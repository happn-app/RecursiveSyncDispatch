// swift-tools-version:5.0
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
