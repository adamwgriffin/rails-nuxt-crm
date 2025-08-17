json.array! @contacts do |contact|
  json.merge! contact.slice(:id, :first_name, :middle_name, :last_name, :birthday, :notes)
end
