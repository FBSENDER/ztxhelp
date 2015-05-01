# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks
require_relative 'lib/ztx/ztx'

task :get_tiku do 
  cookie = get_cookie('21110319890712111X', 'a19890712')
  tiku = get_tiku_question(cookie)
  get_tiku_answer(cookie, tiku)
end

task :do_exam do
  cookie = get_cookie('370983198901063210', '123')
  p cookie
  exit
  questions = get_question(cookie)
  answers = get_answer(questions)
  post_exam(questions, answers, cookie)
end
