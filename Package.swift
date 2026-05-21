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
            url: "https://github.com/parveenai/SPM-SDK/releases/download/1.0.7/TravelSafelyBoneshell.xcframework.zip",
            checksum: "759654e268a132ba31ae6a778d27518cb802a8f67b2417244855caa465449d5a"
        )
    ]
)