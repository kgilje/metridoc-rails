ActiveAdmin.register_page "Reshare",
namespace: :ezborrow do
  menu false

  breadcrumb do
    # Custom breadcrumb links
    [
      link_to('EzBorrow', :ezborrow_root)
    ]
  end

  content title: I18n.t("EzBorrow::ReShare") do
    resource_collection = ActiveAdmin.application.namespaces[:ezborrow].resources
    resources = resource_collection.select { |resource| resource.respond_to? :resource_class }
    resources = resources.select{|r| /^Reshare::/.match(r.resource_name.name) }
    resources = resources.sort{|a,b| a.resource_name.human <=> b.resource_name.human }

    render partial: 'index', locals: {resources: resources}
  end
end
