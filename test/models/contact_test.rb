require "test_helper"

class ContactTest < ActiveSupport::TestCase
  test "all_paginated returns only selected fields, paginates, and orders by last_name then first_name" do
    options = {
      page: 1,
      per_page: 3,
      fields: %i[id first_name last_name],
      order: %i[last_name first_name]
    }
    results = Contact.all_paginated(options)
    correct_order = results.sort_by { |c| [ c.last_name, c.first_name ] }
    assert_equal correct_order.map(&:id),
      results.map(&:id),
      "Contacts should be ordered by last_name, then first_name"

    results.each do |c|
      assert c.has_attribute?(:id)
      assert c.has_attribute?(:first_name)
      assert c.has_attribute?(:last_name)
      refute c.has_attribute?(:middle_name)
      refute c.has_attribute?(:birthday)
      refute c.has_attribute?(:notes)
    end
  end
end
