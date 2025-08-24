class ApplicationRecord < ActiveRecord::Base
  DEFAULT_PER_PAGE = 10

  primary_abstract_class

  def self.paginate(options)
    page(options[:page]).per(options[:per_page] || DEFAULT_PER_PAGE)
  end
end
