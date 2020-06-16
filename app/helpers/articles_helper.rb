module ArticlesHelper
  def create_categories
    unless Category.exists?
      Category.create(name: 'Cars', priority: 1)
      Category.create(name: 'Bikes', priority: 2)
      Category.create(name: 'Off Road', priority: 3)
      Category.create(name: 'Racing', priority: 4)
    end
    'There are no articles yet, go ahead and create some!'
  end

  def articles_index_empty(category)
    content_tag(:div, link_to(category.capitalize, new_article_path, class: 'article_text') +
    content_tag(:p, "There is no #{category} article. Go ahead and crete one!",
                class: 'article_text'),
                class: 'empty_category col-6 col-lg-3 d-flex flex-column justify-content-around')
  end

  def articles_to_display(category)
    if category == 'cars'
      @cars_articles
    elsif category == 'bikes'
      @bikes_articles
    elsif category == 'offroad'
      @off_road_articles
    elsif category == 'racing'
      @race_articles
    end
  end

  def votes_button(article)
    votes = article.votes

    unless current_user
      return content_tag(:p, "This article has been voted #{votes.length} times", class: 'votes_count')
    end

    if votes.empty?
      return content_tag(:div, content_tag(:p, "Votes: #{votes.length}") +
      link_to('', vote_path(article_id: article.id), class: 'fa fa-thumbs-up vote_button'),
                         class: 'd-flex justify-content-around w-100 votes_count')
    end

    votes.each do |vote|
      if vote.userid == current_user.id
        return content_tag(:p,
                           "Thank you for voting for this article! This article has been voted #{votes.length} times!",
                           class: 'votes_count')
      end
    end

    content_tag(:div, content_tag(:p, "Votes: #{votes.length}") +
    link_to('', vote_path(article_id: article.id), class: 'fa fa-thumbs-up vote_button'),
                class: 'd-flex justify-content-around w-100 votes_count')
  end

  def article_destroy(article)
    return unless article.authorid == current_user.id

    link_to('Delete this article',
            article_path(@article), method: :delete,
                                    data: { confirm: 'Really delete the article?' }, class: 'votes_count')
  end
end
