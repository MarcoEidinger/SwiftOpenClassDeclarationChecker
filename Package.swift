// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "SwiftOpenClassDeclarationChecker",
    platforms: [.macOS(.v12)],
    products: [
        .executable(name: "socdc", targets: ["SwiftOpenClassDeclarationChecker"]),
    ],
    dependencies: [
        .package(url: "https://github.com/jpsim/SourceKitten", from: "0.33.0"),
    ],
    targets: [
        .executableTarget(
            name: "SwiftOpenClassDeclarationChecker",
            dependencies: [
                .product(name: "SourceKittenFramework", package: "SourceKitten"),
            ]
        ),
    ]
)
