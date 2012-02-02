require 'spec_helper'

describe Option do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:values) }

end