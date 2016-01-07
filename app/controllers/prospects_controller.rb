class ProspectsController < ApplicationController
  before_action :find_client_list
  before_action :authenticate, :only => [:index]

  def index
  end

  def new
  	@prospect = @client_list.prospects.new
  end

  def create
	@prospect = @client_list.prospects.new(prospect_params)
	if @prospect.save
		@prospect.update_attribute(:added_at, Time.now)
		flash[:success] = "Added prospect."
		render action: :edit
	else
		flash[:error] = "Could not add prospect."
		render action: :new
	end
  end

  
  def update
	@prospect = @client_list.prospects.find(params[:id])
	if @prospect.update_attributes(prospect_params)
		flash[:success] = "Saved prospect."
		redirect_to root_path
	else
		flash[:error] = "That prospect could not be saved."
		render action: :edit
	end
  end  

  def edit
	@prospect = @client_list.prospects.find(params[:id])
  end

  def destroy
  	@prospect = @client_list.prospects.find(params[:id])
  	if @prospect.destroy
  		flash[:success] = "Prospect was deleted."
  	else
  		flash[:error] = "Prospect could not be deleted."
  	end
  	redirect_to client_list_prospects_path
  end

  def url_options
  	{ client_list_id: params[:client_list_id] }.merge(super)
  end

	private
	def find_client_list 
		@client_list = ClientList.find(params[:client_list_id])
	end

	def prospect_params
		params[:prospect].permit(:name, :phone)
	end

	protected
	def authenticate
		@client_list = ClientList.find(params[:client_list_id])

	  	authenticate_or_request_with_http_basic do |username, password|
	  		username = @client_list.client && password == @client_list.password
	  	end
	end

end
