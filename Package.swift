// swift-tools-version: 5.11

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "MacroSample",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13)],
    products: [
        .library(
            name: "MacroSample",
            targets: ["MacroSample"]
        ),
        .executable(
            name: "MacroSampleClient",
            targets: ["MacroSampleClient"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", from: "509.0.0"),
    ],
    targets: [
        .macro(
            name: "MacroSampleMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),
        .target(name: "MacroSample", dependencies: ["MacroSampleMacros"]),
        .executableTarget(name: "MacroSampleClient", dependencies: ["MacroSample"]),
    ]
)
