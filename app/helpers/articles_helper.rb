module ArticlesHelper
  def create_categories
    Category.create(name: 'Cars', priority: 1)
    Category.create(name: 'Bikes', priority: 2)
    Category.create(name: 'Off Road', priority: 3)
    Category.create(name: 'Racing', priority: 4)
    'There are no articles yet, go ahead and create some!'
  end

  def articles_index_empty(category) 
    content_tag(:div, content_tag(:p, 'Cars', class: 'article_text') + content_tag(:p, "There is no #{category} article. Go ahead and crete one!", class: 'article_text'), class: 'empty_category col-6 d-flex flex-column justify-content-between')
  end

  def articles_to_display(category)
    if category == 'cars'
      p @cars_articles
      return @cars_articles
    elsif category == 'bikes'
      return @bikes_articles
    elsif category == 'offroad'
      return @off_road_articles
    elsif category == 'racing'
      return @race_articles
    end
  end

  def votes_button(article)
    votes = article.votes

    return content_tag(:p, "This article cas been voted #{votes.length} times", class: 'votes_count') unless  session[:current_user_id]

    return content_tag(:div, content_tag(:p, "Votes: #{votes.length}") + link_to('', vote_path(article_id: article.id), class: 'fa fa-thumbs-up vote_button'), class: 'd-flex justify-content-around w-100 votes_count') if votes.empty?

    votes.each do |vote|
      return content_tag(:p, "Thank you for voting fo this article! This article cas been voted #{votes.length} times!", class: 'votes_count') if vote.userid == session[:current_user_id]
    end

    return content_tag(:div, content_tag(:p, "Votes: #{votes.length}") + link_to('', vote_path(article_id: article.id), class: 'fa fa-thumbs-up vote_button'), class: 'd-flex justify-content-around w-100 votes_count')
  end

end
