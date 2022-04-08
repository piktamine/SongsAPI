import Fluent
//import FluentMySQLDriver
import Leaf
import Vapor
import FluentSQLiteDriver

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    //Register prividers first
    
    //try services.register(.FluentSQliteP)

    //Database
    
    /*
    app.databases.use(.sqlite(
        hostname: Environment.get("DATABASE_HOST") ?? "localhost",
        port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? SQLiteConfiguration.ianaPortNumber,
        username: Environment.get("DATABASE_USERNAME") ?? "vapor_username",
        password: Environment.get("DATABASE_PASSWORD") ?? "vapor_password",
        database: Environment.get("DATABASE_NAME") ?? "vapor_database"
    ), as: .sqlite)
    */
    
    app.databases.use(.sqlite(.file("db/db.sqlite")), as: .sqlite)

    //app.migrations.add(CreateTodo())

    app.views.use(.leaf)

    

    // register routes
    try routes(app)
}
