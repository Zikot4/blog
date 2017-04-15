class RegistrationsController < Devise::RegistrationsController

  protected

  def update_resource(resource, params)
    unless Account.find_by(user_id: current_user.id).nil?
        resource.update_without_password(params)
    else
        resource.update_with_password(params)
    end
  end
end
