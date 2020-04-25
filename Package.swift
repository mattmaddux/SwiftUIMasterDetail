// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUIMasterDetail",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "SwiftUIMasterDetail",
            targets: ["SwiftUIMasterDetail"]),
    ],
    dependencies: [
        .package(url: "https://github.com/mattmaddux/SwiftUIDevice", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "SwiftUIMasterDetail",
            dependencies: ["SwiftUIDevice"])
    ]
)
