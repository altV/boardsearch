require 'mechanize'
require 'iconv'

conv2utf = Iconv.new('UTF-8', 'WINDOWS-1251')
conv2win1251 = Iconv.new('WINDOWS-1251', 'UTF-8')
ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')


id=5146594

agent = WWW::Mechanize.new
agent.user_agent_alias = 'Windows IE 6'
page = agent.get "http://board.rt.mipt.ru/?read=#{id}"

print page.title
print "\n\n"

#print page.content
print "\n\n"

#tmp = /topic_mout\(this\)><B>(.*?)<\/B>/.match(page.content)[1]
tmp = /topic_mout\(this\)><B>(.*?)<\/B>/.match(page.content)
tmp = tmp[1]
print tmp + "\n\n"
tmp=tmp.split('\x80').join
print tmp + "\n\n"

#print conv2win1251.iconv(tmp) + "\n"

print conv2utf.iconv(tmp) + "\n"