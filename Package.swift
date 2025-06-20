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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreModule_Common_GeoLocation.git", exact: "3.1.4"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "3.1.4")
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
			url: "https://pkgs.genexus.dev/iOS/releases/GXCoreModule_Common_Maps-3.1.4.xcframework.zip",
			checksum: "ac8d7841aacb9b703ae7451880af90740d14515de2cc128bd1192c2ac2163833"
		)
	]
)