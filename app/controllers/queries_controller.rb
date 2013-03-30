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
      render :json => JSON.pretty_generate(res)
    else
      render action: "index"
    end
  end

end
