require 'spec_helper'

describe ProductImage do

  it { should validate_presence_of(:image) }

end