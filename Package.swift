// swift-tools-version:5.3
import PackageDescription

// BEGIN KMMBRIDGE VARIABLES BLOCK (do not edit)
let remoteKotlinUrl = "https://maven.pkg.github.com/LukeSmith16/shared/com/lukesmith/sharedexample/shared-kmmbridge/0.1.3/shared-kmmbridge-0.1.3.zip"
let remoteKotlinChecksum = "14add34a6592f47bcaee9093eb4526194bfb9416a13de62ba3086c2057d67b8d"
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