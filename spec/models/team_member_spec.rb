require 'spec_helper'

describe TeamMember do
  it { should belong_to :project }
  it { should belong_to :developer }
end
