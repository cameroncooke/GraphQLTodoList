import Fluent
import FluentSQLiteDriver
import GraphQLKit
import GraphiQLVapor
import Vapor

public func configure(_ app: Application) throws {
    app.databases.use(.sqlite(.memory), as: .sqlite)
    try app.autoMigrate().wait()
    app.register(graphQLSchema: schema, withResolver: Resolver())
    
    if !app.environment.isRelease {
        app.enableGraphiQL()
    }
}
