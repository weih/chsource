require 'pry'

module Chsource
  class Chsource
    Source = {
      rubygems: 'http://rubygems.org',
      taobao: 'http://ruby.taobao.org',
      gzruby: 'http://gems.gzruby.org',
      tsinghua: 'http://mirrors.tuna.tsinghua.edu.cn/rubygems'
    }

    def self.change_source(original_source = 'rubygems', new_source)
      text = File.read('Gemfile')
      text.gsub!(Regexp.new(Source[original_source.to_sym]), Source[new_source.to_sym]) 
      File.open('Gemfile', 'w') do |file|
        file.write text
      end
      puts "\e[32mDone with 'source #{Source[new_source.to_sym]}'\e[0m"
    end
  end
end

# puts Chsource.change_source('http://ruby.taobao.org')
