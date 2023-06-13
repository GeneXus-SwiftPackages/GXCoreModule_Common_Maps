// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXCoreModule_Common_Maps",
	platforms: [.iOS("12.0"), .watchOS("5.0"), .tvOS("12.0")],
	products: [
		.library(
			name: "GXCoreModule_Common_Maps",
			targets: ["GXCoreModule_Common_MapsWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreModule_Common_GeoLocation.git", exact: "1.0.0-beta.20230613192339"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.0.0-beta.20230613192339"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXObjectsModel.git", exact: "1.0.0-beta.20230613192339")
	],
	targets: [
		.target(name: "GXCoreModule_Common_MapsWrapper",
				dependencies: [
					"GXCoreModule_Common_Maps",
					.product(name: "GXCoreModule_Common_GeoLocation", package: "GXCoreModule_Common_GeoLocation", condition: .when(platforms: [.watchOS, .iOS, .tvOS])),
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.watchOS, .iOS, .tvOS])),
					.product(name: "GXObjectsModel", package: "GXObjectsModel", condition: .when(platforms: [.watchOS, .iOS, .tvOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXCoreModule_Common_Maps",
			url: "https://pkgs.genexus.dev/iOS/beta/GXCoreModule_Common_Maps-1.0.0-beta.20230613192339.xcframework.zip",
			checksum: "96d3b64425e9a988b64d691269aa9f3ce22003873cda78e3287646e8d3c612c9"
		)
	]
)