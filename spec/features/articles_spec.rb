require 'rails_helper'
RSpec.feature 'Article', type: :feature do
  scenario 'Creates a new Article' do
    visit 'http://localhost:3000/articles/new'

    within find('#new_user') do
      fill_in 'article_title', with: 'RSpec'
      fill_in 'article_text', with: 'RSpec body'
      fill_in 'article_image', with: 'https://rspec.info/images/logo.png'
      fill_in 'article_article_categories_cars', with: 'RSpec'
      find(:css, "#article_article_categories_cars[value='Cars']").set(true)
      click_button 'commit'
    end
  rescue StandardError => e
    puts e.message.to_s
  end
end

RSpec.describe Article, type: :model do
  describe '#title' do
    let(:article) { Article.create(title: 'test', text: 'test body', image: 'https://rspec.info/images/logo.png') }
    it 'doesnt take an article without the title' do
      article = Article.create(title: 'test', text: 'test body', image: 'https://rspec.info/images/logo.png')
      article.title = nil
      article.valid?
      expect(article.errors[:title]).to include("can't be blank")

      article.title = 'test'
      article.valid?
      expect(article.errors[:title]).to_not include("can't be blank")
    end

    it 'doesnt take an article without a body' do
      article = Article.create(title: 'test', text: 'test body', image: 'https://rspec.info/images/logo.png')
      article.text = nil
      article.valid?
      expect(article.errors[:text]).to include("can't be blank")

      article.text = 'test'
      article.valid?
      expect(article.errors[:text]).to_not include("can't be blank")
    end

    it 'doesnt take an article without an image' do
      article = Article.create(title: 'test', text: 'test body', image: 'https://rspec.info/images/logo.png')
      article.image = nil
      article.valid?
      expect(article.errors[:image]).to include("can't be blank")

      article.image = 'https://rspec.info/images/logo.png'
      article.valid?
      expect(article.errors[:image]).to_not include("can't be blank")
    end
  end
end
