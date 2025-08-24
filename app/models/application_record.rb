class ApplicationRecord < ActiveRecord::Base
  DEFAULT_PER_PAGE = 10

  primary_abstract_class

  def self.paginate(params)
    page(params[:page]).per(params[:per_page] || DEFAULT_PER_PAGE)
  end
end
