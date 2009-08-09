require 'scrubyt'
require 'mechanize'
require 'iconv'
require 'activesupport'
require 'oniguruma'

class BoardPost < ActiveRecord::Base

  def self.acquire_post(id)
    conv2utf = Iconv.new('UTF-8', 'WINDOWS-1251')
    #conv2win1251 = Iconv.new('WINDOWS-1251', 'UTF-8')
    ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')
    reg = Oniguruma::ORegexp.new("\\p{C}", {:encoding => Oniguruma::ENCODING_UTF8})
    
    agent = WWW::Mechanize.new
    agent.user_agent_alias = 'Windows IE 6'
    page = agent.get "http://board.rt.mipt.ru/?read=#{id}"

    b_post = BoardPost.find_or_initialize_by_id(id)
    #TODO: betterway
    b_post.id=id
    #b_post.title = ' '
    #b_post.title = page.title  # somehow in UTF8

    tmp = page.content
    tmp = conv2utf.iconv(tmp) unless tmp.nil?
    tmp = /topic_mout\(this\)><B>(.*?)<\/B>/m.match(tmp)
    tmp = tmp[1] unless tmp.nil?

    #tmp=tmp.split('\x80').join
    #tmp = ic.iconv(tmp + ' ')[0..-2]
    #tmp = reg.gsub(tmp, '')
    b_post.title=tmp

    tmp = page.content
    tmp = conv2utf.iconv(tmp) unless tmp.nil?
    tmp = /<div class="body">(.*?)<\/div>/.match(tmp)
    tmp = tmp[1] unless tmp.nil?
    tmp = nil if tmp == ""
    b_post.body = tmp
    #b_post.body = ic.iconv(page.content + ' ')[0..-2]
    #b_post.body = page.content.mb_chars.tidy_bytes
    #b_post.body = ActiveSupport::Multibyte::Chars.new(page.content).tidy_bytes.to_s
    b_post.save!
    b_post
  end

  def self.post(id)
    board_data = Scrubyt::Extractor.define do
      fetch "http://board.rt.mipt.ru/?read=#{id}"
      result 'asdf'
    end

    board_data.to_xml
  end
end
