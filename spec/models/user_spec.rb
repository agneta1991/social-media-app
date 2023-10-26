require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should be present' do
    expect(subject).to be_valid
  end

  it 'updates post_counter when a post is added' do
    initial_post_counter = 0
    expect(subject.post_counter).to eq(initial_post_counter)

    subject.posts.create(title: 'test', text: 'test')
    expect(subject.reload.post_counter).to eq(initial_post_counter + 1)
  end

  it 'should raise an error if post_counter is negative' do
    subject.post_counter = -1
    expect(subject).not_to be_valid
  end

  it 'should be valid when post_counter is zero' do
    subject.post_counter = 0
    expect(subject).to be_valid
  end

  it 'should be valid when post_counter is positive' do
    subject.post_counter = 5
    expect(subject).to be_valid
  end
end
