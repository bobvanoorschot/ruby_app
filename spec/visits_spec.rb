# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/visits'
require_relative '../parser'

RSpec.describe Visits do
  webpages = ['/help_page/1 126.318.035.038', '/contact 184.123.665.067', '/home 184.123.665.067',
              '/about/2 444.701.448.104', '/help_page/1 929.398.951.889', '/index 444.701.448.104',
              '/help_page/1 126.318.035.038']

  it 'sorts webpages by the amount of views' do
    visits = Visits.new(webpages).sort_by_views

    expect(visits.first).to eq(['/help_page/1', 3])
  end

  it 'sorts webpages by the amount of views' do
    visits = Visits.new(webpages, true).sort_by_views

    expect(visits.first).to eq(['/help_page/1', 2])
  end
end
