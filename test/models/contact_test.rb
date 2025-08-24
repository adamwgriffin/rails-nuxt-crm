require "test_helper"

class ContactTest < ActiveSupport::TestCase
  test "all_paginated returns only selected fields and paginates" do
    params = { page: 1, per_page: 2 }
    fields = %i[id first_name last_name]
    results = Contact.all_paginated(params, fields)

    assert_equal 2, results.size, "Should return 2 contacts per page"
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
