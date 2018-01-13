QueryType = GraphQL::ObjectType.define do
    name "Query"
    description "The query root of this schema"
  
    field :product do
      type ProductType
      description "Current product"
      resolve ->(obj, args, ctx) {
        ctx[:current_product]
      }
    end
  end