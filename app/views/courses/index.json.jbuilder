json.array!(@courses) do |course|
  json.extract! course, :id, :course_id, :code, :name
  json.url course_url(course, format: :json)
end
