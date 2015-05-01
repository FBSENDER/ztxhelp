def get_answer(questions)
  f = File.open('tiku.txt','r')
  datas = []
  f.each_line do |line|
    line = line.sub("\n",'')
    datas << line.split(' ')
  end
  f.close
  answers = ('A ' * 100).split
  questions.each_with_index do |q,index|
    it = datas.select{|item| item[0] == q.to_s}.first
    next if it.nil?
    answers[index] = it[1]
  end
  answers
end

def get_cookie(username, password)
  response = HTTParty.get($login_url)
  fp = Nokogiri::HTML response
  vst = fp.css('#__VIEWSTATE')[0]["value"].encode('gb2312')
  etn = fp.css('#__EVENTVALIDATION')[0]["value"].encode('gb2312')
  $login_body[:TestNumber] = username
  $login_body[:PassWord] = password
  $login_body[:__VIEWSTATE] = vst
  $login_body[:__EVENTVALIDATION] = etn
  response = HTTParty.post($login_url,body: $login_body, headers: {'Cookie' => response.headers['Set-Cookie']})
  response.request.options[:headers]['Cookie']
end

def get_question(cookie)
  response = HTTParty.get($question_url, headers: {'Cookie' => cookie})
  body = response.body
  questions = []
  body.each_line do |x|
    data = /(type='hidden' value='\d*')/.match(x)
    if data
      key = data[0].match(/'\d*'/)[0].gsub("'",'')
      questions << key.to_i if key.to_i > 100
    end
  end
  questions
end

def post_exam(questions, answers, cookie)
  http_body = {}
  http_body[:i] = questions.size
  (1..(questions.size)).each do |i|
    sy = "a#{i}".to_sym
    sy1 = "key#{i}".to_sym
    http_body[sy] = questions[i-1]
    http_body[sy1] = answers[i-1]
  end
  response = HTTParty.post($exam_url, headers: {"Cookie" => cookie}, body: http_body)
  puts response
end
