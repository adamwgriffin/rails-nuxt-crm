require "test_helper"

class ContactTest < ActiveSupport::TestCase
  test "all_paginated returns only selected fields, paginates, and orders by last_name then first_name" do
    params = { page: 1, per_page: 3 }
    fields = %i[id first_name last_name]
    order = %i[last_name first_name]
    results = Contact.all_paginated(params, fields, order)
    correct_order = results.sort_by { |c| [ c.last_name, c.first_name ] }
    assert_equal correct_order.map(&:id),
      results.map(&:id),
      "Contacts should be ordered by last_name, then first_name"

    results.each do |contact|
      assert contact.has_attribute?(:id)
      assert contact.has_attribute?(:first_name)
      assert contact.has_attribute?(:last_name)
      refute contact.has_attribute?(:middle_name)
      refute contact.has_attribute?(:birthday)
      refute contact.has_attribute?(:notes)
    end
  end
end
