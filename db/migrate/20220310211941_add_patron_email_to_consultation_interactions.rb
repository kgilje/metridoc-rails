class AddPatronEmailToConsultationInteractions < ActiveRecord::Migration[5.2]
  def change
    add_column :consultation_interactions, :patron_email, :string
  end
end
