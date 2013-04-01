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
      nestoria_query = create_nestoria_query(@query)
      search_nestoria(nestoria_query)
    else
      render action: "results"
    end
  end

  def results
  end

  def next_page_of_results
    if(session[:nestoria_query].page < session[:nestoria_query].total_pages)
      session[:nestoria_query].page += 1
    end
    search_nestoria(session[:nestoria_query])
  end

  def previous_page_of_results
    if(session[:nestoria_query].page > 1)
      session[:nestoria_query].page -= 1
    end
    search_nestoria(session[:nestoria_query])
  end

  private

  def create_nestoria_query(query)
    nestoria_query = NestoriaQuery.new(query)
    return nestoria_query
  end

  def search_nestoria(nestoria_query)
    @res = nestoria_query.search()
    if(@res['response']['application_response_code'].to_i < 200)
      session[:nestoria_query] = nestoria_query
      session[:nestoria_query].total_pages = @res['response']['total_pages']
      #render :json => JSON.pretty_generate(@res)
      render action: "results"
    else
      @query.errors.add("place_name", "Place name is ambiguous or misspelled")
      render action: "index"
    end
  end

  def search_datagov(query)
    datagov_query = DataGovQuery.new(query)
    res = datagov_query.search()
    render :json => JSON.pretty_generate(res)
  end
end
