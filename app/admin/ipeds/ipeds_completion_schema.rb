ActiveAdmin.register Ipeds::CompletionSchema, namespace: :ipeds do
  menu false
  actions :all, :except => [:new, :edit, :update, :destroy]
end
