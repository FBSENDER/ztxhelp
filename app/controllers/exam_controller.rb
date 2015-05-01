require File.expand_path('../../../lib/ztx/ztx', __FILE__)
class ExamController < ApplicationController
  def index
  end
  def doit
    username = params[:TestNumber]
    password = params[:PassWord]
    cookie = get_cookie(username, password)
    questions = get_question(cookie)
    answers = get_answer(questions)
    post_exam(questions, answers, cookie)
    redirect_to '/exam/success'
  end
  def success 
  end
end
