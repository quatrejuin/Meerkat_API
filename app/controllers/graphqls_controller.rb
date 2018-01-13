class GraphqlsController < ApplicationController
    def create
        query_string = params[:query]
        query_variables = JSON.load(params[:variables]) || {}
        context = { current_product: Product.find(3) }
        result = Schema.execute(query_string, variables: query_variables, context: context)
        render json: result
      end
end
