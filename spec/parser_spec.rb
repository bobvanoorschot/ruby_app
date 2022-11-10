# frozen_string_literal: true

require 'spec_helper'
require_relative '../parser'

describe 'Parsing data' do
  it 'should correctly process the data file' do
    expect { parse(['/help_page/1 126.318.035.038']) }.to output("Views:\n/help_page/1 1 views\n\nUnique views:\n/help_page/1 1 unique views\n").to_stdout
    end

  it 'should return error if file is empty' do
    expect { parse([]) }.to raise_error(RuntimeError, 'File is empty')
  end
end
