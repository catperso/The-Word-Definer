require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('creates a word and enters the words page') do
    visit('/words')
    click_on('Add a new word!')
    fill_in('new_word', :with => 'Epicodus')
    click_on('Add the word!')
    expect(page).to have_content('Epicodus')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('goes to a word page and creates a definition') do
    word = Word.new(word: "Banana")
    word.save
    visit("/word/#{word.id}")
    fill_in('new_definition', :with => 'A freudian fruit')
    click_on('Add a new definition!')
    expect(page).to have_content('A freudian fruit')
  end
end