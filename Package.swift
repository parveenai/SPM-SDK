// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "TravelSafelyBoneshell",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "TravelSafelyBoneshell",
            targets: ["TravelSafelyBoneshell"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "TravelSafelyBoneshell",
            url: "https://github.com/parveenai/SPM-SDK/releases/download/1.0.10/TravelSafelyBoneshell.xcframework.zip",
            checksum: "15096dd65737cfc123375fc0a5ce9920c23445445e79dc692e6868df8e332bcb"
        )
    ]
)