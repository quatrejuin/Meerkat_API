class Resolvers::RemoveProduct < GraphQL::Function
  # arguments passed as "args"
  argument :id, !types.Int
  # return type from the mutation
  type ProductType

  # the mutation method
  # _obj - is parent object, which in this case is nil
  # args - are the arguments passed
  # _ctx - is the GraphQL context (which would be discussed later)
  def call(_obj, args, _ctx)
    Product.find(args[:id]).destroy!
  end
end