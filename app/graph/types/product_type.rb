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