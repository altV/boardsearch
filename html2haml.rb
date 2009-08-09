class ToHaml
  def initialize(path)
    @path = path
  end
  
  def convert!
    Dir["#{@path}/**/*.erb"].each do |file|
      #`html2haml -rx #{file} #{file.gsub(/\.erb$/, '.haml')}`
      s = "html2haml -rx #{file} #{file.gsub(/\.erb$/, '.haml')}".gsub('/', '\\').gsub('.\\','')
      #`#{s}`
      print s
      print "\n"
      system(s.to_s)
      exec(s)
    end
  end
end
                                                                          
path = File.join(File.dirname(__FILE__), 'app', 'views')
ToHaml.new(path).convert!