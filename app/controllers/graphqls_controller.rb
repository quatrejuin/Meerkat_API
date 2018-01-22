class GraphqlsController < ApplicationController
    before_action :cors_preflight_check
    after_action :cors_set_access_control_headers


    def cors_set_access_control_headers
        response.headers['Access-Control-Allow-Origin'] = '*'
        response.headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
        response.headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token, Auth-Token, Email, X-User-Token, X-User-Email'
        response.headers['Access-Control-Max-Age'] = '1728000'
    end

    def cors_preflight_check
        if request.method == 'OPTIONS'
          cors_set_access_control_headers
          render plain: '',  content_type: 'text/plain'
        end
    end

    def create
        query_string = params[:query]
        query_variables = JSON.load(params[:variables]) || {}
        # context = { current_product: Product.all }
        # result = Schema.execute(query_string, variables: query_variables, context: context)
        result = Schema.execute(query_string, variables: query_variables)
        render json: result
    end
end
