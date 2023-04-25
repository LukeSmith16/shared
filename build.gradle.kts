plugins {
    //trick: for the same plugin versions in all sub-modules
    id("com.android.library").version("7.4.1").apply(false)
    kotlin("multiplatform").version("1.8.0").apply(false)
    id("co.touchlab.faktory.kmmbridge").version("0.3.7").apply(false)
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

subprojects {
    val GROUP: String by project
    val LIBRARY_VERSION: String by project

    group = GROUP
    version = LIBRARY_VERSION
}

tasks.register("clean", Delete::class) {
    delete(rootProject.buildDir)
}
