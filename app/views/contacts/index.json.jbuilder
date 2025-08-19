json.contacts @contacts do |contact|
  json.extract! contact, :id, :first_name, :last_name
end

json.meta do
  json.extract! @contacts,
    :current_page,
    :total_pages,
    :total_count
end
