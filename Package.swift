// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftGenerator",
    platforms: [.macOS(.v10_15)],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
//        .package(url: "https://github.com/jpsim/Yams.git", from: "4.0.0"),
        .package(url: "https://github.com/syedqamara/SwiftExtractor.git", from: "1.0.1"),
        .package(url: "https://github.com/syedqamara/core_architecture.git", from: "1.0.5"),
        .package(url: "https://github.com/apple/swift-syntax.git", from: "508.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "SwiftGenerator",
            dependencies: [
                .product(name: "SwiftExtractor", package: "SwiftExtractor"),
                .product(name: "core_architecture", package: "core_architecture"),
                .product(name: "SwiftSyntax", package: "swift-syntax"),
                .product(name: "SwiftSyntaxBuilder", package: "swift-syntax")
                
            ]),
        .testTarget(
            name: "SwiftGeneratorTests",
            dependencies: ["SwiftGenerator"]),
    ]
)
