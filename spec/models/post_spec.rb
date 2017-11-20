require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { build(:post) }

  it { is_expected.to belong_to :user }
  it { is_expected.to have_one :rating }
end
