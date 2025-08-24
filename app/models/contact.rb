class Contact < ApplicationRecord
  def self.all_paginated(
    params,
    fields = %i[id first_name last_name],
    order = %i[last_name first_name]
  )
    select(*fields)
      .order(*order)
      .paginate(params)
  end
end
