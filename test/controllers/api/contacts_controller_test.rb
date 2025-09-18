require "test_helper"

class Api::ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact = contacts(:one)
  end

  test "should get index" do
    get api_contacts_url, as: :json
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

  test "index respects pagination and fields params" do
    params = {
      page: 1,
      perPage: 2,
      fields: [ "id", "first_name" ]
    }
    get api_contacts_url(params), as: :json
    assert_response :ok
    body = JSON.parse(@response.body)
    assert_equal 2, body["contacts"].size
    body["contacts"].each do |contact|
      assert contact.key?("id")
      assert contact.key?("firstName")
      refute contact.key?("lastName")
    end
  end

  test "should create contact" do
    post api_contacts_url, params: { contact: contact_params }, as: :json
    assert_response :created
    body = JSON.parse(@response.body)
    assert body.key?("id"), "Response should have an 'id' key"
    assert body["id"].is_a?(Integer), "'id' should be an Integer"
    assert Contact.exists?(body["id"]), "A contact with the returned id should exist"
  end

  test "should show contact" do
    get api_contact_url(@contact), as: :json
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
    patch api_contact_url(@contact),
      params: { contact: contact_params({ notes: "Updated notes" }) },
      as: :json
    assert_response :ok

    @contact.reload
    assert_equal "Updated notes", @contact.notes
  end

  test "should destroy contact" do
    delete api_contact_url(@contact), as: :json

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
