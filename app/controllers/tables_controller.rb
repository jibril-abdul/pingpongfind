class TablesController < ApplicationController
  before_action :set_table, only: [:show, :edit, :update, :destroy]
  before_action :correct_user onl
  before_action :authenticate_user!, except: [:index, :show] 

  # GET /tables
  # GET /tables.json
  def index
    @tables = Table.all
  end

  # GET /tables/1
  # GET /tables/1.json
  def show
  end

  # GET /tables/new
  def new
    @table = current_user.tables.build
  end

  # GET /tables/1/edit
  def edit
  end

  # POST /tables
  # POST /tables.json
  def create
    @table = current_user.tables.build(table_params)
    if @table.save
      redirect_to @table, notice: 'Table was successfully created.' 
    else
      render :new 
    end
  end

  # PATCH/PUT /tables/1
  # PATCH/PUT /tables/1.json
  def update
    if @table.update(table_params)
      redirect_to @table, notice: 'Table was successfully updated.' 
    else
      render :edit
    end
  end

  # DELETE /tables/1
  # DELETE /tables/1.json
  def destroy
    @table.destroy
    redirect_to tables_url, notice: 'Table was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table
      @table = Table.find_by(id: params[:id])
    end

    def correct_user
      @table = current_user.tables.find(params[:id])
      redirect_to tables_path, notice: "Not authorized to edit this table" if @table.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def table_params
      params.require(:table).permit(:description, :title)

    end
end
