require 'spec_helper'

describe Value do

  it { should validate_presence_of(:content) }

end