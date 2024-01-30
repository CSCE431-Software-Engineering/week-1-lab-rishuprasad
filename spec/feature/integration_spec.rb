# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe "Book", type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in "book[title]", with: 'Sooley'
    fill_in "book[author]", with: "John Grisham"
    fill_in "book[price]", with: "15.32"
    fill_in "book[published_date]", with: "2024-01-01"
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('Sooley')
  end

  scenario 'book is added successfully' do
    visit new_book_path
    fill_in "book[title]", with: 'Lord of the Flies'
    fill_in "book[author]", with: "John Grisham"
    fill_in "book[price]", with: "15.32"
    fill_in "book[published_date]", with: "2024-01-01"
    click_on 'Create Book'
    expect(page).to have_text("Book was successfully created.")
  end

  scenario 'book is not added with blank title' do
    visit new_book_path
    fill_in "book[title]", with: ''
    fill_in "book[author]", with: "John Grisham"
    fill_in "book[price]", with: "15.32"
    fill_in "book[published_date]", with: "2024-01-01"
    click_on 'Create Book'
    expect(page).to have_text("1 error prohibited this book from being saved:")
    expect(page).to have_text("Title can't be blank")
  end

  scenario 'book is not added with blank author' do
    visit new_book_path
    fill_in "book[title]", with: 'Lord of the Flies'
    fill_in "book[author]", with: ''
    fill_in "book[price]", with: "15.32"
    fill_in "book[published_date]", with: "2024-01-01"
    click_on 'Create Book'
    expect(page).to have_text("1 error prohibited this book from being saved:")
    expect(page).to have_text("Author can't be blank")
  end

  scenario 'book is not added with blank price' do
    visit new_book_path
    fill_in "book[title]", with: 'Lord of the Flies'
    fill_in "book[author]", with: 'John Grisham'
    fill_in "book[price]", with: ""
    fill_in "book[published_date]", with: "2024-01-01"
    click_on 'Create Book'
    expect(page).to have_text("1 error prohibited this book from being saved:")
    expect(page).to have_text("Price can't be blank")
  end

  scenario 'book is not added with blank published date' do
    visit new_book_path
    fill_in "book[title]", with: 'Lord of the Flies'
    fill_in "book[author]", with: 'John Grisham'
    fill_in "book[price]", with: "64.23"
    fill_in "book[published_date]", with: ""
    click_on 'Create Book'
    expect(page).to have_text("1 error prohibited this book from being saved:")
    expect(page).to have_text("Published date can't be blank")
  end



end
