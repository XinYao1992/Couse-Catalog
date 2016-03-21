json.array!(@coursesubjects) do |coursesubject|
  json.extract! coursesubject, :id, :course_code, :course_name, :subject_id
  json.url coursesubject_url(coursesubject, format: :json)
end
