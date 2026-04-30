class ContactMethodsController < ApplicationController
  allow_unauthenticated_access only: %i[ index ]
  before_action :set_contact, only: %i[ edit update destroy ]
  def index
    @contact_methods = ContactMethod.all
  end

  def new
    @contact_method = ContactMethod.new
  end

  def create
    @contact_method = ContactMethod.new(contact_params)
    if @contact_method.save
      redirect_to contact_methods_path
    else
      render projects_path, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @contact_method.update(contact_params)
      redirect_to contact_methods_path
    else
      render projects_path, status: :unprocessable_entity
    end
  end

  def destroy
    @contact_method.destroy
    redirect_to contact_methods_path
  end

  private
    def set_contact
      @contact_method = ContactMethod.find(params[:id])
    end
    def contact_params
      params.expect(contact_method: [:service_name, :link_url, :username, :logo ])
    end
end
