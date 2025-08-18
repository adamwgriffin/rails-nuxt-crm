json.contacts @contacts do |contact|
  json.extract! contact, :id, :first_name, :middle_name, :last_name, :birthday, :notes
end

json.meta do
  json.current_page @contacts.current_page
  json.total_pages  @contacts.total_pages
  json.total_count  @contacts.total_count
end
