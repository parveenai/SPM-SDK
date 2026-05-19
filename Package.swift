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
            url: "https://github.com/parveenai/SPM-SDK/TravelSafelyBoneshell.xcframework.zip",
            checksum: "f7b497fd61ce79f3ee7b6b4a2847aa689f0bccfd6e4256216e5c87c018d2a15a"
        )
    ]
)