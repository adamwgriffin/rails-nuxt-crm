json.contacts @contacts

json.meta do
  json.extract! @contacts,
    :current_page,
    :total_pages,
    :total_count
end
