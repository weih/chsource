require 'test_helper'

module Chsource
  class TestChsource< Minitest::Test
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

    def change_source(from, to, &block)
      Chsource.change_source(from, to)
      yield
      Chsource.change_source(to, from)
    end

    def test_change_source_to_taobao
      change_source(@rubygems, @taobao) do
        check_content('taobao')
      end
    end

    def test_change_source_to_gzruby
      change_source(@rubygems, @gzruby) do
        check_content('gzruby')
      end
    end

    def test_change_source_to_tsinghua
      change_source(@rubygems, @tsinghua) do
        check_content('tsinghua')
      end
    end

    # def teardown
    #   Chsource.change_source(@to_taobao, @rubygems)
    # end
  end
end
