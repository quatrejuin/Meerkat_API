ProductType = GraphQL::ObjectType.define do
  name "Product"
  description "A prodcut"

  field :id, types.Int
  field :name, types.String
  field :price, types.Int
  field :quantity, types.Int
  field :updated_at do
    type types.Int

    resolve -> (obj, args, ctx) {
      obj.updated_at.to_i
    }
  end
  field :created_at do
    type types.Int

    resolve -> (obj, args, ctx) {
      obj.created_at.to_i
    }
  end
end

ProductInputType = GraphQL::InputObjectType.define do
  name "ProductInputType"
  description "Properties for creating a Product"
  argument :name, !types.String do
    description "Title of the post."
  end
  argument :price, types.Int do
    description "Title of the post."
  end
  argument :quantity, types.Int do
    description "Description of the post."
  end
end