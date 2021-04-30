module UsersHelper

  # get users with mos followers
  def get_most_followed_user
    User.find_by_sql('SELECT users.*
                      FROM
                          users
                          inner join follows f on users.id = f.followed_user_id
                      group by users.id
                      ORDER BY count(*) desc
                      LIMIT 3;');
  end
end
