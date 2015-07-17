require 'rails_helper'

describe "Visiting profiles" do
  # include TestFactories
  include Warden::Test::Helpers
  Warden.test_mode!

  before do
    @user = create(:user)
    @topic = Topic.create(description: "A topic title")
    @post = create(:post, user: @user, topic: @topic)
    @comment = create(:comment, post: @post, user: @user)
    # @comment = Comment.new(user: @user, post: @post, body: "A Comment")
    # allow(@comment).to receive(:send_favorite_emails)
    # @comment.save!
  end

  describe "not signed in" do

    it "shows profile" do
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))

      expect(page).to have_content(@user.name)
      expect(page).to have_content(@post.title)
      expect(page).to have_content(@comment.body)
    end
  end

  describe "signed in as admin" do

    before do
      login_as(create(:user, role: 'admin'), :scope => :user)
    end

    it "shows profile" do
      visit user_path(@user)
      #byebug
      #save_and_open_page
      expect(page).to have_link("Delete")
      expect(page).to have_css(".vote-arrows")
    end
  end
end