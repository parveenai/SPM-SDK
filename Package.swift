// swift-tools-version:5.9
//
// Client-facing Swift Package for the TravelSafely SDK.
//
// TravelSafelyBoneshell.xcframework is a *static* binary framework. It is
// compiled against RealmSwift and CocoaAsyncSocket but does not contain them;
// the wrapper target below pulls both packages into the client's app so the
// linker resolves the SDK's references against the client's own copies.
// (A binaryTarget cannot declare dependencies itself, hence the wrapper.)
//
// Client apps that use Realm themselves should NOT add realm-swift as a
// separate dependency of the app target: adding only this package is enough,
// and `import RealmSwift` works. Adding realm-swift directly as well makes
// Xcode build RealmSwift as a dynamic framework without embedding it, and
// the app crashes at launch on device (seen with Xcode 27).
import Foundation
import PackageDescription

// Release values, stamped by scripts/build_xcframework.sh <version>.
let sdkVersion = "1.0.2"
let sdkChecksum = "36066cf61c82d355c31543c684d562a29ecb5dcfdaba335232bffda196428887"
let sdkURL = "https://github.com/Applied-Information/TravelSafelyBoneshellSPM/releases/download/\(sdkVersion)/TravelSafelyBoneshell.xcframework.zip"

// Clients download the zip from the GitHub release. When a freshly built
// TravelSafelyBoneshell.xcframework sits next to this file (local testing, e.g.
// the demo app), that copy is used instead. Never commit the xcframework to
// the public repo, or clients would get it instead of the release zip.
let localXCFramework = "TravelSafelyBoneshell.xcframework"
let useLocal = FileManager.default.fileExists(atPath: Context.packageDirectory + "/" + localXCFramework)
let sdkBinary: Target = useLocal
    ? .binaryTarget(name: "TravelSafelyBoneshell", path: localXCFramework)
    : .binaryTarget(name: "TravelSafelyBoneshell", url: sdkURL, checksum: sdkChecksum)

let package = Package(
    name: "TravelSafelyBoneshell",
    platforms: [.iOS("17.6")],
    products: [
        .library(name: "TravelSafelyBoneshell", targets: ["TravelSafelyBoneshellWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/realm/realm-swift.git", from: "20.0.6"),
        .package(url: "https://github.com/robbiehanson/CocoaAsyncSocket.git", exact: "7.6.5"),
    ],
    targets: [
        sdkBinary,
        .target(
            name: "TravelSafelyBoneshellWrapper",
            dependencies: [
                "TravelSafelyBoneshell",
                .product(name: "RealmSwift", package: "realm-swift"),
                .product(name: "CocoaAsyncSocket", package: "CocoaAsyncSocket"),
            ],
            path: "Sources/TravelSafelyBoneshellWrapper"
        ),
    ]
)
