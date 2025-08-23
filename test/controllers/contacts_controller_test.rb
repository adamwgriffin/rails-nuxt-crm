require "test_helper"

class ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact = contacts(:one)
  end

  test "should get index" do
    get contacts_url, as: :json
    assert_response :ok

    body = JSON.parse(@response.body)
    assert body.key?("contacts"), "Response should have a 'contacts' key"
    assert body.key?("meta"), "Response should have a 'meta' key"

    meta = body["meta"]
    assert_kind_of Hash, meta, "'meta' should be a hash"
    %w[currentPage totalPages totalCount].each do |key|
      assert meta.key?(key), "'meta' should include '#{key}'"
      assert meta[key].is_a?(Integer), "'#{key}' should be an Integer"
    end
  end

  test "should create contact" do
    assert_difference("Contact.count") do
      post contacts_url,
        params: { contact: contact_params },
        as: :json
    end

    assert_response :created
  end

  test "should show contact" do
    get contact_url(@contact), as: :json
    assert_response :ok
  end

  test "should update contact" do
    patch contact_url(@contact),
      params: { contact: contact_params },
      as: :json
    assert_response :ok
  end

  test "should destroy contact" do
    assert_difference("Contact.count", -1) do
      delete contact_url(@contact), as: :json
    end

    assert_response :no_content
  end

  private

    def contact_params(params = {})
      {
        birthday: @contact.birthday,
        first_name: @contact.first_name,
        last_name: @contact.last_name,
        middle_name: @contact.middle_name,
        notes: @contact.notes
      }.merge(params)
    end
end
