require 'spec_helper'

describe Project do
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should belong_to :organization }
end
