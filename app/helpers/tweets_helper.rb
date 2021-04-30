module TweetsHelper
  # replace every # by link to the hashtag
  def format_tweet_body(body)
    body = simple_format(body)
    body = body.gsub(/#\w+/)do |word|
      link_to word, controller: :tweets, action: 'hashtag', hashtag: word.downcase.delete('#')
    end.html_safe
    body.gsub(/@\w+/)do |word|
      if !User.find_by(login:word.delete('@')).nil?
        link_to word, controller: :users, action: 'show', id: User.find_by(login: word.delete('@')).id
      else
        word
      end
    end.html_safe

  end

  # get most popular hashtags
  def popular_hashtag
    Tag.find_by_sql('SELECT tags.*
                    FROM tags
                             inner join tags_tweets tt on tags.id = tt.tag_id
                    group by tags.id
                    ORDER BY count(*) desc
                    LIMIT 5;')

  end
end
