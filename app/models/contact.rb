class Contact < ApplicationRecord
  def self.all_paginated(params, fields = %i[id first_name last_name])
    select(*fields).paginate(params)
  end
end
