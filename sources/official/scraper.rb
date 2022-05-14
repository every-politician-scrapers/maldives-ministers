#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/scraper_data'
require 'pry'

class MemberList
  class Member
    def name
      noko.css('.highlighted-text,.link-text').text.tidy
    end

    def position
      noko.css('.date-text').first.text.tidy
    end
  end

  class Members
    def member_container
      noko.css('.card-body,.text-center')
    end
  end
end

file = Pathname.new 'official.html'
puts EveryPoliticianScraper::FileData.new(file).csv
