QueryType = GraphQL::ObjectType.define do
    name "Query"
    description "The query root of this schema"
  
    field :products, !types[ProductType] do
      description "all product"
      resolve ->(obj, args, ctx) {
        # ctx[:current_product]
        Product.all
      }
    end
    
    field :product do
      type ProductType
      argument :id, !types.Int
      description "Find a Product by ID"
      resolve ->(obj, args, ctx) {
        # ctx[:current_product]
        Product.find(args["id"])
      }
    end
  end