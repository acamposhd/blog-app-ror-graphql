module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :users, [UserType], null: false, description: "List all users"
    def users
      User.preload(:posts, :comments)
    end

    field :posts, [PostType], null: false, description: "List all posts"
    def posts
      Post.preload(:comments)
    end
  end
end
