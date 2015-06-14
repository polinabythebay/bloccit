require 'rails_helper'

describe Vote do
  describe "validations" do
    describe "value validation" do
      it "allows 1 as valid value" do
        vote = Vote.new(value: 1)
        result = vote.save
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
end 