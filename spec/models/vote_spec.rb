require 'rails_helper'

RSpec.describe Vote, type: :model do
  let(:employee) { create(:employee) }
  let(:vote) { Vote.create!(value: 1, post: post, user: user) }

  it { is_expected.to belong_to(:employee) }

  it { is_expected.to validate_presence_of(:value) }
  it { is_expected.to validate_inclusion_of(:value).in_array([-1,1]) }

end
