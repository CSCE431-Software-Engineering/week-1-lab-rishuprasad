require 'rails_helper'

RSpec.describe Book, type: :model do
  subject do
    described_class.new(title: 'Curious Incident of the Dog in the Nighttime', author: 'Mark Haddon', price: 5.32, published_date: '2022-01-05')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  it "is not valid without an author" do
    subject.author = nil
    expect(subject).not_to be_valid
  end

  it "is not valid without an price" do
    subject.price = nil
    expect(subject).not_to be_valid
  end

  it "is not valid without an published_date" do
    subject.published_date = nil
    expect(subject).not_to be_valid
  end
end
