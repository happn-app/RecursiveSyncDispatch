// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription



let package = Package(
	name: "RecursiveSyncDispatch",
	products: [
		.library(name: "RecursiveSyncDispatch", targets: ["RecursiveSyncDispatch"]),
	],
	targets: [
		.target(name: "RecursiveSyncDispatch", dependencies: []),
		.testTarget(name: "RecursiveSyncDispatchTests", dependencies: ["RecursiveSyncDispatch"])
	]
)
