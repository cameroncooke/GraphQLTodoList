// swift-tools-version:5.9
import PackageDescription

let package = Package(
  name: "GraphQLTodoList",
  platforms: [
    .macOS(.v10_15)
  ],
  dependencies: [
    .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
    .package(url: "https://github.com/vapor/fluent.git", from: "4.0.0"),
    .package(url: "https://github.com/vapor/fluent-sqlite-driver.git", from: "4.0.0"),
    .package(url: "https://github.com/alexsteinerde/graphql-kit.git", from: "2.0.0"),
    .package(url: "https://github.com/alexsteinerde/graphiql-vapor.git", from: "2.0.0")
  ],
  targets: [
    .target(
      name: "App",
      dependencies: [
        .product(name: "Fluent", package: "fluent"),
        .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"),
        .product(name: "Vapor", package: "vapor"),
        .product(name: "GraphQLKit", package: "graphql-kit"),
        .product(name: "GraphiQLVapor", package: "graphiql-vapor"),
      ],
      swiftSettings: [
        .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
      ]
    ),
    .target(name: "Run", dependencies: [.target(name: "App")])
  ]
)
