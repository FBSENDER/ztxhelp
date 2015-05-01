require 'httparty'

$login_url = 'http://211.140.254.2:8080/login.aspx'
$question_url = 'http://211.140.254.2:8080/Examination.aspx?type=zsks'
$exam_url = 'http://211.140.254.2:8080/examination_form.aspx?type=zsks&nian=&yue='
$test_url = 'http://211.140.254.2:8080/test.aspx'
$test_form_url = 'http://211.140.254.2:8080/test_form.aspx'

$login_body = {__VIEWSTATE: '/wEPDwUKLTY0NzE3NTEzNA9kFgICAw9kFgICCA8PFgIeB1Zpc2libGVoZGRkeNiuxVR55wYK4dj1u114XT3yldA=',__EVENTVALIDATION: '/wEWBQKw7rysCgL0wanGAgKyxeCRDwKM54rGBgK7q7GGCFm+VcAUu25/jIHj8vRYqMJ0esXq', TestNumber: '', PassWord: '', Button1: '登录'}
require_relative 'do_exam'
require_relative 'get_tiku'

