// swift-tools-version:5.3
import PackageDescription

// BEGIN KMMBRIDGE VARIABLES BLOCK (do not edit)
let remoteKotlinUrl = "https://maven.pkg.github.com/LukeSmith16/shared/com/lukesmith/sharedexample/shared-kmmbridge/0.1.1/shared-kmmbridge-0.1.1.zip"
let remoteKotlinChecksum = "586b25ff5b6857b2c29060d3c384bdbaa6aa705ba09601612032b22daafff0e4"
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