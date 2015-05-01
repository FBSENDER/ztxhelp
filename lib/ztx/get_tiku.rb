def get_tiku_question(cookie)
  questions = []
  25.times do |time|
    response = HTTParty.get($test_url, headers: {'Cookie' => cookie})
    body = response.body
    body.each_line do |x|
      begin
        data = /(type='hidden' value='\d*')/.match(x)
        if data
          key = data[0].match(/'\d*'/)[0].gsub("'",'')
          questions << key.to_i if key.to_i > 100
        end
      rescue
        next
      end
    end
  end
  questions.uniq.sort
end

def get_tiku_answer(cookie, tiku)
  answer = []
  http_body = {}
  http_body[:i] = tiku.size
  (1..(tiku.size)).each do |i|
    sy = "a#{i}".to_sym
    sy1 = "key#{i}".to_sym
    sy1 = "key#{i}".to_sym
    http_body[sy] = tiku[i-1]
  end

  response = HTTParty.post($test_form_url, body: http_body, headers: {'Cookie' => cookie})
  ny = '正确答案'.encode('gb2312')
  response.each_line do |line|
    begin
      if line.match(/#{ny}/)
        answer << line.match(/[ABCDEFG,]* </)[0].sub(' <', '')
      end
    rescue
      next
    end
  end
  result = []
  (1..(tiku.size)).each do |i|
    result << "#{tiku[i-1]} #{answer[i-1]}"
  end
  File.open('tiku.txt', 'w') do |f|
    result.uniq.sort.each do |r|
      f.puts r
    end
  end
end
