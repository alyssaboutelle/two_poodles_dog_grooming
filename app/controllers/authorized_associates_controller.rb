class AuthorizedAssociatesController < ApplicationController
  before_action :set_authorized_associate, only: [:show, :edit, :update, :destroy]

  # GET /authorized_associates
  def index
    @authorized_associates = AuthorizedAssociate.all
  end

  # GET /authorized_associates/1
  def show
  end

  # GET /authorized_associates/new
  def new
    @authorized_associate = AuthorizedAssociate.new
  end

  # GET /authorized_associates/1/edit
  def edit
  end

  # POST /authorized_associates
  def create
    @authorized_associate = AuthorizedAssociate.new(authorized_associate_params)

    if @authorized_associate.save
      redirect_to @authorized_associate, notice: 'Authorized associate was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /authorized_associates/1
  def update
    if @authorized_associate.update(authorized_associate_params)
      redirect_to @authorized_associate, notice: 'Authorized associate was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /authorized_associates/1
  def destroy
    @authorized_associate.destroy
    redirect_to authorized_associates_url, notice: 'Authorized associate was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_authorized_associate
      @authorized_associate = AuthorizedAssociate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def authorized_associate_params
      params.require(:authorized_associate).permit(:first_name, :last_name, :phone, :dog_owner_profile_id)
    end
end
