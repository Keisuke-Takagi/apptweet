class UsersController < TweetsController
  def search
    @users = User.where('nickname LIKE(?)', "%#{params[:keyword]}%")
    @users.each do |user|
      @tweets = tweets.find(user_id: user.id)
    end
  end
end
