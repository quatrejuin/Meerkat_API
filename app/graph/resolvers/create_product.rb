class Resolvers::CreateProduct < GraphQL::Function
  # arguments passed as "args"
  # argument :name, !types.String
  # argument :price, !types.Int
  # argument :quantity, !types.Int
  argument :input, ProductInputType

  # return type from the mutation
  type ProductType

  # the mutation method
  # _obj - is parent object, which in this case is nil
  # args - are the arguments passed
  # _ctx - is the GraphQL context (which would be discussed later)
  def call(_obj, args, _ctx)
    Product.create!(args[:input].to_h)
  end
end