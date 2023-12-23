ActiveAdmin.register Ezborrow::Relais::CallNumber,
as: "Relais::CallNumber",
namespace: :ezborrow do
  menu false

  breadcrumb do
    # Custom breadcrumb links
    [
      link_to('EzBorrow', :ezborrow_root),
      link_to('Relais', :ezborrow_relais)
    ]
  end
  
  permit_params :call_number_id, :request_number, :holdings_seq, :supplier_code, :call_number, :process_date, :load_time, :version
  actions :all, :except => [:new, :edit, :update, :destroy]

  preserve_default_filters!

  filter :call_number_id, filters: [:contains, :not_cont, :starts_with, :ends_with, :equals]
  filter :request_number, filters: [:contains, :not_cont, :starts_with, :ends_with, :equals]
  filter :holdings_seq, filters: [:contains, :not_cont, :starts_with, :ends_with, :equals]
  filter :supplier_code, filters: [:contains, :not_cont, :starts_with, :ends_with, :equals]
  filter :call_number, filters: [:contains, :not_cont, :starts_with, :ends_with, :equals]
  filter :process_date, filters: [:contains, :not_cont, :starts_with, :ends_with, :equals]
  filter :load_time, filters: [:contains, :not_cont, :starts_with, :ends_with, :equals]
  filter :version, filters: [:contains, :not_cont, :starts_with, :ends_with, :equals]


  # Set the title on the index page
  index title: "CallNumber"
end
