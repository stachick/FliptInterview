class ClientListsController < ApplicationController
  before_action :set_client_list, only: [:show, :edit, :update, :destroy]

  
  http_basic_authenticate_with name: "Nick Fury", password: "admin", only: [:destroy, :new, :update, :create, :edit]

  # GET /client_lists
  # GET /client_lists.json
  def index
    @client_lists = ClientList.all
  end

  # GET /client_lists/1
  # GET /client_lists/1.json
  def show
  end

  # GET /client_lists/new
  def new
    @client_list = ClientList.new
  end

  # GET /client_lists/1/edit
  def edit
  end

  # POST /client_lists
  # POST /client_lists.json
  def create
    @client_list = ClientList.new(client_list_params)

    respond_to do |format|
      if @client_list.save
        @client_list.update_attribute(:password, @client_list.password)
        format.html { redirect_to @client_list, notice: 'Client list was successfully created.' }
        format.json { render :show, status: :created, location: @client_list }
      else
        format.html { render :new }
        format.json { render json: @client_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /client_lists/1
  # PATCH/PUT /client_lists/1.json
  def update
    respond_to do |format|
      if @client_list.update(client_list_params)
        @client_list.update_attribute(:password, @client_list.password)
        format.html { redirect_to @client_list, notice: 'Client list was successfully updated.' }
        format.json { render :show, status: :ok, location: @client_list }
      else
        format.html { render :edit }
        format.json { render json: @client_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_lists/1
  # DELETE /client_lists/1.json
  def destroy
    @client_list.destroy
    respond_to do |format|
      format.html { redirect_to client_lists_url, notice: 'Client list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_list
      @client_list = ClientList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_list_params
      params.require(:client_list).permit(:client, :description, :password)
    end
end
