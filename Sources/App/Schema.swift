import Graphiti
import Vapor

let schema = try! Schema<Resolver, Request> {
    Scalar(UUID.self)

    Type(User.self) {
        Field("todos", with: \.$todos)
    }

    Type(Todo.self) {
        Field("user", with: \.$user)
    }

    Query {
        Field("users", at: Resolver.getAllUsers)
    }
}
