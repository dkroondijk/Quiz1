class RequestsController < ApplicationController

  before_action :find_request, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      @requests = Request.search(params[:search]).paginate(:page => params[:page], :per_page => 5).prioritize
    else
      @requests = Request.all.paginate(:page => params[:page], :per_page => 5).prioritize
    end
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)

    if @request.save
      redirect_to requests_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @request.update(request_params)
      redirect_to requests_path
    else
      render :edit
    end
  end

  def destroy
    @request.destroy
    redirect_to requests_path
  end


  private

  def find_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:name, :email, :department, :message, :done)
  end

end
