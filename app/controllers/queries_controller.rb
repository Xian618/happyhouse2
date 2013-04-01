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
      #search_datagov(@query)
      search_nestoria(@query)
    else
      render action: "index"
    end
  end

  def results

  end

  private

  def search_nestoria(query)
    nestoria_query = NestoriaQuery.new(query)
    @res = nestoria_query.search()
    if(@res['response']['application_response_code'].to_i < 200)
      #render :json => JSON.pretty_generate(res)
      render action: "results"
    else
      query.errors.add("place_name", "Place name is ambiguous or misspelled")
      render action: "index"
    end
  end

  def search_datagov(query)
    datagov_query = DataGovQuery.new(query)
    res = datagov_query.search()
    render :json => JSON.pretty_generate(res)
  end
end
