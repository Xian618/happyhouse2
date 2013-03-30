class QueriesController < ApplicationController
  require 'json'

  # GET /queries
  # GET /queries.json
  def index
    @query = Query.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @query }
    end
  end


  # POST /queries
  # POST /queries.json
  def create
    @query = Query.new(params[:query])
    @nestoria_query = NestoriaQuery.new(@query)
    res = @nestoria_query.search()
    render :json => JSON.pretty_generate(res)
  end
end
