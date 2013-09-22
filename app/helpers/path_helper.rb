module PathHelper
  def destroy_session_path
    if developer_signed_in?
      destroy_developer_session_path
    elsif organization_signed_in?
      destroy_organization_session_path
    end
  end
end
