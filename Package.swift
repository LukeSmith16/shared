// swift-tools-version:5.3
import PackageDescription

// BEGIN KMMBRIDGE VARIABLES BLOCK (do not edit)
let remoteKotlinUrl = "https://maven.pkg.github.com/LukeSmith16/shared/SharedExample/shared-kmmbridge/unspecified.1/shared-kmmbridge-unspecified.1.zip"
let remoteKotlinChecksum = "0437756a6e58959a170749f4d7e6b7290ceb86a1f07be9e2c497d58b1e843be1"
let packageName = "shared"
// END KMMBRIDGE BLOCK

let package = Package(
    name: packageName,
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: packageName,
            targets: [packageName]
        ),
    ],
    targets: [
        .binaryTarget(
            name: packageName,
            url: remoteKotlinUrl,
            checksum: remoteKotlinChecksum
        )
        ,
    ]
)