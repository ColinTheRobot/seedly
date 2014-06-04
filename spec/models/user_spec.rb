# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :text
#  email           :text
#  frostdate_id    :integer
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'

describe User do
  it { should have_many(:seeds) }
  it { should have_many(:beds)}

  it { should validate_presence_of(:name) }

  it { should have_secure_password }
  it { should validate_confirmation_of(:password) }
  it { should ensure_length_of(:password).is_at_least(8).is_at_most(16) }

    user = User.create(name: "colin", email: "colin@colin.com", password: "colincolin", password_confirmation: "colincolin")
end
