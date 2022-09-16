require 'rails_helper'

RSpec.describe "Comments", type: :controller do
  # describe "GET /index" do
  #   pending "add some examples (or delete) #{__FILE__}"
  # end

  before do
    @controller = CommentsController.new
  end

  before(:each) do
    @article = Article.create(title: "First title", content: "First content")
  end

  describe 'create' do
    it 'successfully creates a new comment' do
      expect{
          post :create, params: {:article_id => @article, 
            :comment => { :commenter => "First article", :body => "First content" } }
        }.to change(Comment,:count).by(1)
    end
  end

  after(:each) do
    DatabaseCleaner.clean_with(:truncation)
  end


end
