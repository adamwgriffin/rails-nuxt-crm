class Contact < ApplicationRecord
  DEFAULT_PAGINATION_OPTIONS = {
    page: 1,
    per_page: 10,
    fields: %i[id first_name last_name],
    order: %i[last_name first_name]
  }.with_indifferent_access

  def self.all_paginated(options)
    opts = DEFAULT_PAGINATION_OPTIONS.merge(options)
    select(opts[:fields]).order(opts[:order]).paginate(opts)
  end
end
