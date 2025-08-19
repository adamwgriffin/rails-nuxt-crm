json.contacts @contacts do |contact|
  json.extract! contact, :id, :first_name, :last_name
end

json.meta do
  json.current_page @contacts.current_page
  json.total_pages  @contacts.total_pages
  json.total_count  @contacts.total_count
end
