class Tweet < ApplicationRecord
  belongs_to :user

  def select_all_with_user
    self.joins(:user).select('tweets.*, users.name AS user_name, users.account_name AS user_account_name').all.order(created_at: :desc)
  end

end
