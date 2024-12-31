// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SwiftUIColorButton",
  platforms: [
    .macOS(.v12),
    .iOS(.v15),
    .tvOS(.v15),
    .macCatalyst(.v15),
    .watchOS(.v8),
  ],
  products: [
    .library(
      name: "SwiftUIColorButton",
      targets: ["SwiftUIColorButton"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/micahkimel/SwiftUIColorButtons", from: "1.0.0"),
  ],
  targets: [
    .target(
      name: "SwiftUIColorButton"
    ),
  ]
)
