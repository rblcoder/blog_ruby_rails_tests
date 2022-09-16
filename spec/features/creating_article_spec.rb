require "rails_helper"

RSpec.feature "Creating Articles" do 
  scenario "A user creates a new article" do
    visit articles_path
    click_link "New Article"
    fill_in "Title", with: "Creating a blog" 
    fill_in "Content", with: "Lorem Ipsum" 
    click_button "Create Article"
    expect(page).to have_content("Creating a blog")
    # expect(page.current_path).to eq(articles_path)
    expect(page.current_path).to eq('/articles/1') 
  end

  scenario "A user fails to create a new article" do 
    visit "/articles"
    click_link "New Article"
    fill_in "Title", with: "" 
    fill_in "Content", with: "" 
    click_button "Create Article"
    
    expect(page).to have_content("Title can't be blank") 
    expect(page).to have_content("Content can't be blank")
  end


end