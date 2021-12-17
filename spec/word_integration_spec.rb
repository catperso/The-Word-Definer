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