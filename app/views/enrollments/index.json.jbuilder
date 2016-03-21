json.array!(@enrollments) do |enrollment|
  json.extract! enrollment, :id, :email, :course_code, :course_name, :subject_id
  json.url enrollment_url(enrollment, format: :json)
end
