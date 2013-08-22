module Chsource
  class Chsource
    Gemfile = 'Gemfile'
    Source = {
      rubygems: "source 'http://rubygems.org'",
      taobao: "source 'http://ruby.taobao.org'",
      gzruby: "source 'http://gems.gzruby.org'",
      tsinghua: "source 'http://mirrors.tuna.tsinghua.edu.cn/rubygems'"
    }

    def self.change_source(new_source)
      @text = File.read(Gemfile)
      @new_source = Source[new_source.to_sym]

      @text.gsub!(/source ['"]https?:\/\/[\S]+['"]/, @new_source)
      if @text.include? new_source
        write_to_file 
      else
        puts "\e[31mSomething goes wrong! please make sure your Gemfile has something like:\nsource 'http://rubygems.org'\e[0m"
      end
    end

    def self.write_to_file
      File.open(Gemfile, 'w') do |file|
        file.write @text
      end
      puts "\e[32mChange to #{@new_source} successfully!\e[0m"
    end
  end
end
