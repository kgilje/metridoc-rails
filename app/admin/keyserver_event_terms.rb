ActiveAdmin.register Keyserver::EventTerm do
  menu false
  permit_params :term_id, :term_value, :term_abbreviation
end