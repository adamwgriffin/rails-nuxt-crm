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
    %w[currentPage totalPages totalCount].each do |key|
      assert meta.key?(key), "'meta' should include '#{key}'"
      assert meta[key].is_a?(Integer), "'#{key}' should be an Integer"
    end
  end

  test "should create contact" do
    post contacts_url, params: { contact: contact_params }, as: :json
    assert_response :created
    assert Contact.exists?(body["id"]), "A contact with the returned id should exist"

    body = JSON.parse(@response.body)
    assert body.key?("id"), "Response should have an 'id' key"
    assert body["id"].is_a?(Integer), "'id' should be an Integer"
  end

  test "should show contact" do
    get contact_url(@contact), as: :json
    assert_response :ok

    body = JSON.parse(@response.body)
    expected = {
      "id" => @contact.id,
      "firstName" => @contact.first_name,
      "middleName" => @contact.middle_name,
      "lastName" => @contact.last_name,
      "birthday" => @contact.birthday&.iso8601,
      "notes" => @contact.notes
    }
    assert_equal body, expected
  end

  test "should update contact" do
    patch contact_url(@contact),
      params: { contact: contact_params({ notes: "Updated notes" }) },
      as: :json
    assert_response :ok

    @contact.reload
    assert_equal "Updated notes", @contact.notes
  end

  test "should destroy contact" do
    assert_difference("Contact.count", -1) do
      delete contact_url(@contact), as: :json
    end

    assert_response :no_content
    assert_not Contact.exists?(@contact.id), "Contact should be deleted from the database"
  end

  private

    def contact_params(params = {})
      {
        birthday: @contact.birthday,
        firstName: @contact.first_name,
        lastName: @contact.last_name,
        middleName: @contact.middle_name,
        notes: @contact.notes
      }.merge(params)
    end
end
