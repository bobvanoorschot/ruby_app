# frozen_string_literal: true

# Count number of visits on webpages
class Visits
  attr_reader :webpages

  # @param [Array] webpages is an array of webpages recently visited
  # @param [Boolean] unique sets if only unique items needs to be considered
  def initialize(webpages, unique = false)
    @webpages = unique ? webpages.uniq : webpages
  end

  # @return [Array] with url and times visited
  def sort_by_views
    totals = Hash.new(0)
    webpages.each do |page|
      page_split = page.split(' ')
      totals[page_split[0]] += 1
    end

    totals.sort_by(&:last).to_a.reverse
  end
end
