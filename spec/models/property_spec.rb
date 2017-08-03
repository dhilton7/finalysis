require 'rails_helper'

RSpec.describe Property, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:property)).to be_valid
  end
end
