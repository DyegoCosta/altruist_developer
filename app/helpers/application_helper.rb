module ApplicationHelper
  def signed_in_user_email
    if developer_signed_in?
      current_developer.email
    elsif organization_signed_in?
      current_organization.email
    end
  end
end
