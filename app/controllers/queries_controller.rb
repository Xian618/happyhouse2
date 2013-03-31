class QueriesController < ApplicationController
  require 'json'

  # GET /queries
  def index
    @query = Query.new
  end

  # POST /queries
  def create
    @query = Query.new(params[:query])
    if(@query.valid?)
      @nestoria_query = NestoriaQuery.new(@query)
      res = @nestoria_query.search()
      if(res['response']['response_action_code'] == 100)
        render :json => JSON.pretty_generate(res)
      else
        @query.errors.add("place_name", "Place name is not specific enough")
        render action: "index"
      end
    else
      render action: "index"
    end
  end

end
