json.array!(@debit_notes) do |debit_note|
  json.extract! debit_note, :id
  json.url debit_note_url(debit_note, format: :json)
end
