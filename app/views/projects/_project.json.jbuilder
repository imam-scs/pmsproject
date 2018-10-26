json.extract! project, :id, :prjname, :prjtype, :team_members, :client_name, :technology, :created_at, :updated_at
json.url project_url(project, format: :json)
