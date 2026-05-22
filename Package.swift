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
            url: "https://github.com/parveenai/SPM-SDK/releases/download/1.0.9/TravelSafelyBoneshell.xcframework.zip",
            checksum: "f0cc905dafb8d4b1abcc35a3ab2c2edc4c8d75fb3e26811a81ef4022d0c88628"
        )
    ]
)