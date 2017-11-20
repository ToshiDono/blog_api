require 'rails_helper'

RSpec.describe Rating, type: :model do
  subject { build(:rating) }

  it { is_expected.to belong_to :post }
end
