class UpennEzproxy::EzpaarseJob < UpennEzproxy::Base
  self.ignored_columns = [
    :login, :host, :penn_id
  ]
end
