json.extract! taskdetail, :id, :name, :project_id, :created_at, :updated_at
json.url taskdetail_url(taskdetail, format: :json)
