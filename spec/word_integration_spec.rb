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
    word = Word.new({word: "Banana"})
    word.save
    visit("/word/#{word.id}")
    fill_in('new_definition', :with => 'A freudian fruit')
    click_on('Add a new definition!')
    expect(page).to have_content('A freudian fruit')
  end
end

describe('change a definition', {:type => :feature}) do
  it('goes to the definitions page and changes the definition') do
    word = Word.new(word: "Banana")
    word.save
    definition = Definition.new({definition: "A freudian fruit", word_id: word.id})
    definition.save
    visit("/word/#{word.id}/definition/#{definition.id}")
    fill_in('def_update', :with => "A monkey's favourite snack")
    click_on('Change definition')
    expect(page).to have_content("A monkey's favourite snack")
  end
end

describe('delete a definition', {:type => :feature}) do
  it("goes to a definition's page and deletes it") do
    word = Word.new(word: "Banana")
    word.save
    definition = Definition.new({definition: "A freudian fruit", word_id: word.id})
    definition.save
    visit("/word/#{word.id}/definition/#{definition.id}")
    click_on('Remove definition!')
    expect(page).to have_content("This word is undefined!")
  end
end

describe('clear the pseudo databases', {:type => :feature}) do
  it("removes all definitions and words and resets the ID counters") do
    word = Word.new(word: "Banana")
    word.save
    definition = Definition.new({definition: "A freudian fruit", word_id: word.id})
    definition.save
    visit("/")
    click_on('Remove ALL words and ALL definitions?')
    expect(page).to have_content("No words have been added!")
  end
end

describe('delete a single word', {:type => :feature}) do
  it("goes to a word's page and deletes the word") do
    word = Word.new(word: "Banana")
    word.save
    definition = Definition.new({definition: "A freudian fruit", word_id: word.id})
    definition.save
    visit("/word/#{word.id}")
    click_on('Remove Banana!')
    expect(page).to have_content("No words have been added!")
  end
end