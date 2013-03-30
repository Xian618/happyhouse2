class NestoriaQueriesController < ApplicationController
  # GET /nestoria_queries
  # GET /nestoria_queries.json
  def index
    @nestoria_queries = NestoriaQuery.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @nestoria_queries }
    end
  end

  # GET /nestoria_queries/1
  # GET /nestoria_queries/1.json
  def show
    @nestoria_query = NestoriaQuery.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @nestoria_query }
    end
  end

  # GET /nestoria_queries/new
  # GET /nestoria_queries/new.json
  def new
    @nestoria_query = NestoriaQuery.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @nestoria_query }
    end
  end

  # GET /nestoria_queries/1/edit
  def edit
    @nestoria_query = NestoriaQuery.find(params[:id])
  end

  # POST /nestoria_queries
  # POST /nestoria_queries.json
  def create
    @nestoria_query = NestoriaQuery.new(params[:nestoria_query])

    respond_to do |format|
      if @nestoria_query.save
        format.html { redirect_to @nestoria_query, notice: 'Nestoria query was successfully created.' }
        format.json { render json: @nestoria_query, status: :created, location: @nestoria_query }
      else
        format.html { render action: "new" }
        format.json { render json: @nestoria_query.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /nestoria_queries/1
  # PUT /nestoria_queries/1.json
  def update
    @nestoria_query = NestoriaQuery.find(params[:id])

    respond_to do |format|
      if @nestoria_query.update_attributes(params[:nestoria_query])
        format.html { redirect_to @nestoria_query, notice: 'Nestoria query was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @nestoria_query.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nestoria_queries/1
  # DELETE /nestoria_queries/1.json
  def destroy
    @nestoria_query = NestoriaQuery.find(params[:id])
    @nestoria_query.destroy

    respond_to do |format|
      format.html { redirect_to nestoria_queries_url }
      format.json { head :no_content }
    end
  end
end
