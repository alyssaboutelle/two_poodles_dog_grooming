class AuthorizedAssociatesController < ApplicationController
  before_action :set_authorized_associate,
                only: %i[show edit update destroy]

  def index
    @q = AuthorizedAssociate.ransack(params[:q])
    @authorized_associates = @q.result(distinct: true).includes(
      :dog_owner_profile, :dog_profile
    ).page(params[:page]).per(10)
  end

  def show; end

  def new
    @authorized_associate = AuthorizedAssociate.new
  end

  def edit; end

  def create
    @authorized_associate = AuthorizedAssociate.new(authorized_associate_params)

    if @authorized_associate.save
      message = "AuthorizedAssociate was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @authorized_associate, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @authorized_associate.update(authorized_associate_params)
      redirect_to @authorized_associate,
                  notice: "Authorized associate was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @authorized_associate.destroy
    message = "AuthorizedAssociate was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to authorized_associates_url, notice: message
    end
  end

  private

  def set_authorized_associate
    @authorized_associate = AuthorizedAssociate.find(params[:id])
  end

  def authorized_associate_params
    params.require(:authorized_associate).permit(:first_name, :last_name,
                                                 :phone, :dog_owner_profile_id)
  end
end
