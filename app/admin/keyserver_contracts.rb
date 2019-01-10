ActiveAdmin.register Keyserver::Contract do
  menu false
  permit_params :contract_id, :contract_server_id, :contract_name
  actions :all, :except => [:edit, :update, :destroy]
end
