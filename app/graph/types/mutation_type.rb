MutationType = GraphQL::ObjectType.define do
  name "Mutation"
  field :createProduct, function: Resolvers::CreateProduct.new
  field :updateProduct, function: Resolvers::UpdateProduct.new
  field :removeProduct, function: Resolvers::RemoveProduct.new
end