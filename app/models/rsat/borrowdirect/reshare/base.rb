class Rsat::Borrowdirect::Reshare::Base < ApplicationRecord
  self.abstract_class = true
  self.table_name_prefix = 'bd_reshare_'
end
