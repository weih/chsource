require 'test_helper'

module Chsource
  class TestChsource< Minitest::Test
    Dir.chdir 'test/fixtures'

    def setup
      @rubygems= 'rubygems'
      @taobao = 'taobao'
      @gzruby = 'gzruby'
      @tsinghua = 'tsinghua'
    end

    def check_content(content)
      file_content = File.read('Gemfile')
      assert_equal true, file_content.include?(content)
    end

    def test_change_source_to_taobao
      Chsource.change_source(@taobao)
      check_content('taobao')
    end

    def test_change_source_to_gzruby
      Chsource.change_source(@gzruby)
      check_content('gzruby')
    end

    def test_change_source_to_tsinghua
      Chsource.change_source(@tsinghua)
      check_content('tsinghua')
    end

    def test_cli
      CLI::start ['taobao']
      check_content('taobao')
    end

    def teardown
      Chsource.change_source(@rubygems)
    end
  end
end
