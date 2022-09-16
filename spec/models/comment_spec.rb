require 'rails_helper'

RSpec.describe Comment, type: :model do
  

  before(:each) do
    @article = Article.create(title: "First title", content: "First content")
  end

  it 'checks that a comment can be created' do
    expect(@article.comments.create(commenter: "user1", body: "body of comment")).to be_valid
  end

  after(:each) do
    DatabaseCleaner.clean_with(:truncation)
  end

end


