require 'rails_helper'

RSpec.describe Vote, type: :model do

  describe "validations" do
    describe "value validation" do
      it "allows 1 as valid value" do
        vote = Vote.new(value: 1)
        result = vote.save
        vote.valid?
        expect(result).to eq(true)
      end

      it "allows -1 as valid value" do
        vote = Vote.new(value: -1)
        result = vote.save
        expect(result).to eq(true)
      end

      it "does not allow 0 as valid value" do
        vote = Vote.new(value: 0)
        result = vote.save
        expect(result).to eq(false)
      end
    end
  end

  # describe 'after_save' do
  #   it "calls `Post#update_rank` after save" do
  #     post = associated_post
  #     vote = Vote.new(value: 1, post: post)
  #     expect(post).to receive(:update_rank)
  #     vote.save
  #   end
  # end
end
