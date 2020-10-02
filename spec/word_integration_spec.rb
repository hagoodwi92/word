require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create an word path', {:type => :feature}) do
  it('creates an word and then goes to the word page') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_name', :with => 'Word')
    click_on('Go!')
    expect(page).to have_content('Word')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates an word and then goes to the word page') do
    word = Word.new("Word", nil, nil)
    word.save
    visit("/words/#{word.id}")
    fill_in('definition_name', :with => 'Definition')
    click_on('Add definition')
    expect(page).to have_content('Word')
  end
end

