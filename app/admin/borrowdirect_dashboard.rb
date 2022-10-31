ActiveAdmin.register_page "Borrowdirect Dashboard" do

  breadcrumb do
    # Custom breadcrumb links
    [link_to('Admin', admin_root_path), link_to('BorrowDirect', admin_borrowdirect_path)]
  end

  # Do not add to top menu
  menu false

  # General title for the page
  content title: "BorrowDirect Dashboard" do
    # This is a sub div to the main_content div?? May not need
    div id: "borrowdirect_dashboard" do
      # Direct path to dashboard template
      render partial: 'admin/borrowdirect/dashboard'
    end
  end

  # Redefine ActiveAdmin::PageController::authorize_access
  # This will restrict the page view to the correct users.
  controller do
    private
    def authorize_access!
      authorize! :read, "Borrowdirect"
    end
  end

end