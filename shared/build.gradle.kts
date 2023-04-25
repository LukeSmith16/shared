plugins {
    kotlin("multiplatform")
    id("com.android.library")
    id("co.touchlab.faktory.kmmbridge")
    `maven-publish`
}

kotlin {
    android {
        compilations.all {
            kotlinOptions {
                jvmTarget = "1.8"
            }
        }
    }
    
    listOf(
        iosX64(),
        iosArm64(),
        iosSimulatorArm64()
    ).forEach {
        it.binaries.framework {
            baseName = "shared"
        }
    }

    sourceSets {
        val commonMain by getting
        val commonTest by getting {
            dependencies {
                implementation(kotlin("test"))
            }
        }
        val androidMain by getting
        val androidUnitTest by getting
        val iosX64Main by getting
        val iosArm64Main by getting
        val iosSimulatorArm64Main by getting
        val iosMain by creating {
            dependsOn(commonMain)
            iosX64Main.dependsOn(this)
            iosArm64Main.dependsOn(this)
            iosSimulatorArm64Main.dependsOn(this)
        }
        val iosX64Test by getting
        val iosArm64Test by getting
        val iosSimulatorArm64Test by getting
        val iosTest by creating {
            dependsOn(commonTest)
            iosX64Test.dependsOn(this)
            iosArm64Test.dependsOn(this)
            iosSimulatorArm64Test.dependsOn(this)
        }
    }
}

android {
    namespace = "com.example.sharedexample"
    compileSdk = 33
    defaultConfig {
        minSdk = 24
        targetSdk = 33
    }
}

addGithubPackagesRepository()
kmmbridge {

    //  x-SNAPSHOT - Demo builds
    //  x-DEV - Dev build
    //  x.x - Production build

    val versionType: String = System.getenv("VERSION_TYPE") ?: ""

    if (versionType.isNotEmpty()) {
        // versionType could equal '-Snapshot' for example. We append it on the end of the release name below.

        versionWriter.set(
            SuffixedVersionWriter(
                versionType,
                co.touchlab.faktory.versionmanager.GitRemoteVersionWriter()
            )
        )
    }

    println("Test print, the version that is passed: " + versionType)

    mavenPublishArtifacts()
    githubReleaseVersions()
    spm()

}

private class SuffixedVersionWriter(private val suffix: String, private val delegate: co.touchlab.faktory.versionmanager.VersionWriter): co.touchlab.faktory.versionmanager.VersionWriter by delegate {
    override fun scanVersions(project: Project, block: (Sequence<String>) -> Unit) {
        delegate.scanVersions(project) { sequence ->
            block(sequence.map { it.removeSuffix(suffix) })
        }
    }

    override fun writeMarkerVersion(project: Project, version: String) {
        delegate.writeMarkerVersion(project, version + suffix)
    }

    override fun writeFinalVersion(project: Project, version: String) {
        delegate.writeFinalVersion(project, version + suffix)
    }
}