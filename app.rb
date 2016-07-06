require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/to_do")

get("/") do
  @tasks = Task.all()
  erb(:index)
end

get("/clear") do
  Task.clear()
  erb(:clear)
end

post("/tasks") do
  description = params.fetch("description")
  task = Task.new(description)
  @tempTask = task
  task.save()
  erb(:success)
end
