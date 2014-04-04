require 'spec_helper'

describe Seed do
  it { should belong_to(:bed) }
  it { should belong_to(:user)}

  it { should validate_presence_of(:variety) }
  it { should validate_presence_of(:user_id) }


end
