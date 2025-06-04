// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXCoreModule_Common_Maps",
	platforms: [.iOS("15.0"), .watchOS("10.0"), .tvOS("18.0"), .visionOS("2.0")],
	products: [
		.library(
			name: "GXCoreModule_Common_Maps",
			targets: ["GXCoreModule_Common_MapsWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreModule_Common_GeoLocation.git", exact: "3.2.0-beta.11"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "3.2.0-beta.11")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXCoreModule_Common_Maps-3.2.0-beta.11.xcframework.zip",
			checksum: "609d898088d5a7590166347b3e7fee61f3e7e55d97d02ce516b551908b337fb4"
		)
	]
)