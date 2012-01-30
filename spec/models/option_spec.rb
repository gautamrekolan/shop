require 'spec_helper'

describe Option do

  it { should embed_many(:values) }

  it { should validate_presence_of(:name) }

end