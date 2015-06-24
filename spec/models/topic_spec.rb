require 'rails_helper'

describe Topic do 
  include TestFactories

  describe "scopes" do
    before do
      #I took all of the things out of the before block
      #because the my tests don't need global access to 
      #this setup
      #when should I put this kind of setup in the before block?
      #here I don't think it's necessary to give global access to
      #all testing methods
    end

    describe "publicly_viewable" do
      it "returns a relation of all public topics" do
        public_topic = Topic.create
        expect(Topic.publicly_viewable).to eq([public_topic])
      end
    end

    describe "privately_viewable" do
      it "returns a relation of all private topics" do
        private_topic = Topic.create(public: false)
        expect(Topic.privately_viewable).to eq([private_topic])
      end
    end

    describe "visible_to(user)" do
      it "returns all topics if the user is present" do
        user = authenticated_user
        expect(Topic.visible_to(user)).to eq(Topic.all)
      end
      it "returns only public topics if user is nil" do
        user = nil
        expect(Topic.visible_to(user)).to eq(Topic.publicly_viewable)
        #is it safe to test one feature with a method that it uses? 
        #Topic.public doesn't seem to work here
      end
    end
  end
end
