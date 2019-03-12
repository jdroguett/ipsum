json.extract! subtask, :id, :task_id, :name, :day, :created_at, :updated_at
json.url subtask_url(subtask, format: :json)
