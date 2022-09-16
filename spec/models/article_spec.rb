require 'rails_helper'

RSpec.describe Article, type: :model do
  context "article actions" do
    before(:all) do
      @article = Article.create(title: "First title", content: "First content")
    end

    it 'checks that an article can be created' do
      expect(@article).to be_valid
    end

    it 'checks that an article can be read' do
      actual_result = Article.find_by_title("First title")
      expect(actual_result).to eq(@article)
    end


    it 'checks that an article can be updated' do
      @article.update(:title => "Second Article")
      expect(Article.find_by_title("Second Article")).to eq(@article)
      actual_result = Article.find_by_title("Second Article")
      expect(actual_result).to eq(@article)
    end

    it 'checks that an article can be destroyed' do
      @article.destroy
      expect(Article.count).to eq(0)
    end

    after(:all) do
      DatabaseCleaner.clean_with(:truncation)
    end
  end

  context "verifications" do
    it "is valid with title and content" do
      article = Article.new(title: "First title", content: "First content")
      expect(article).to be_valid
    end

    it "is not valid with no title" do
      article = Article.new(title: nil, content: "First content")
      expect(article).to_not be_valid
    end

    it "is not valid with no content" do
      article = Article.new(title: "First title", content: nil)
      expect(article).to_not be_valid
    end
  end
end
