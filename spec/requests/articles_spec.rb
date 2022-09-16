require 'rails_helper'

# RSpec.describe "Articles", type: :request do
# RSpec.describe "Articles", type: :controller do
#   before do
#     @controller = ArticlesController.new
#   end

#   describe 'create' do
#     it 'successfully creates a new article' do
#       expect{
#           post :create, params: { :article => { :title => "First article", :content => "First content" } }
#         }.to change(Article,:count).by(1)
#     end
#   end

#   describe 'update' do
#     it 'successfully updates an article' do
#       expect{
#           post :create, params: { :article => { :title => "First article", :content => "First content" } }
#         }.to change(Article,:count).by(1)
#     end
#   end

# end

RSpec.describe "Articles", type: :request do
  before do
    @article = Article.create(title: "Title one", content: "Content of article one")
    # puts Article.count
  end
  
  describe 'GET /articles/:id' do 
    context 'with existing article' do
      
      it "handles existing article" do 
        get "/articles/1" 
        expect(response.status).to eq 200
      end 
    end

    context 'with non-existing article' do 
      it "handles non-existing article" do 
        get "/articles/1111" 
        expect(response.status).to eq 302
        flash_message = "The article you are looking for could not be found"
        expect(flash[:alert]).to eq flash_message
      end 
    end
    
  end
  after(:all) do
    # DatabaseCleaner.clean_with(:truncation)
  end

end
