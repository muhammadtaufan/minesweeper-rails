require 'rails_helper'

RSpec.describe Board, type: :model do
  subject do
    described_class.new(name: 'Test Board', email: 'test@example.com', width: 5, height: 5, mines: 3)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a width' do
    subject.width = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a height' do
    subject.height = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without mines' do
    subject.mines = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid if mines is greater than total cells' do
    subject.mines = 26
    expect(subject).to_not be_valid
  end

  it 'generates cells before create' do
    subject.save
    expect(subject.cells).to_not be_nil
  end
end
