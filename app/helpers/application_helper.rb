module ApplicationHelper
  def signed_in_user_email
    if developer_signed_in?
      current_developer.email
    elsif organization_signed_in?
      current_organization.email
    end
  end

  def signed_in_user_name
    if developer_signed_in?
      current_developer.name
    elsif organization_signed_in?
      current_organization.name
    end
  end
end
