module TweetsHelper
  def render_with_hashtags(body)
    body.gsub(/#\w+/)do |word|
      link_to word, controller: :tweets, action: 'hashtag', hashtag: word.downcase.delete('#')
    end.html_safe
  end

  def popular_hashtag
    Tag.find_by_sql('SELECT tags.*
                    FROM tags
                             inner join tags_tweets tt on tags.id = tt.tag_id
                    group by tags.id
                    ORDER BY count(*) desc
                    LIMIT 5;')

  end
end
