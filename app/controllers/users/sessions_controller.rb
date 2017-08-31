class Users::SessionsController < Devise::SessionsController
  respond_to :js
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
  def new
    self.resource = resource_class.new(sign_in_params)
    @resource = self.resource
    clean_up_passwords(resource)
    yield resource if block_given?
    respond_to do |format|
      format.js { render 'new.js.erb' }
      format.html { respond_with(resource, serialize_options(resource)) }
    end
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
