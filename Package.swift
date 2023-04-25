// swift-tools-version:5.3
import PackageDescription

// BEGIN KMMBRIDGE VARIABLES BLOCK (do not edit)
let remoteKotlinUrl = "https://maven.pkg.github.com/LukeSmith16/shared/com/lukesmith/sharedexample/shared-kmmbridge/0.1.2/shared-kmmbridge-0.1.2.zip"
let remoteKotlinChecksum = "2caff96b850c994aa4490ac391e95089b57480ef0da723040766811aa7c9d5bf"
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