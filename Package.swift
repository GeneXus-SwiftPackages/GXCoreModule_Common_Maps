// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXCoreModule_Common_Maps",
	platforms: [.iOS("12.0"), .watchOS("9.0"), .tvOS("12.0"), .visionOS("1.0")],
	products: [
		.library(
			name: "GXCoreModule_Common_Maps",
			targets: ["GXCoreModule_Common_MapsWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreModule_Common_GeoLocation.git", exact: "2.1.0"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "2.1.0")
	],
	targets: [
		.target(name: "GXCoreModule_Common_MapsWrapper",
				dependencies: [
					"GXCoreModule_Common_Maps",
					.product(name: "GXCoreModule_Common_GeoLocation", package: "GXCoreModule_Common_GeoLocation", condition: .when(platforms: [.iOS, .watchOS, .tvOS, .visionOS])),
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.iOS, .watchOS, .tvOS, .visionOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXCoreModule_Common_Maps",
			url: "https://pkgs.genexus.dev/iOS/releases/GXCoreModule_Common_Maps-2.1.0.xcframework.zip",
			checksum: "4c15aa5488a32d8159f5dfea3e94f3bf46f6cc9b4d3a6d13ebb553301e0a2420"
		)
	]
)