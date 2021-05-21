class Tweet < ApplicationRecord
  belongs_to :user

  class << self

    def select_all_with_user
      self.joins(:user).select('tweets.*, users.name AS user_name, users.account_name AS user_account_name').all.order(created_at: :desc)
    end

    def find_by_id_with_user(id)
      self.select('tweets.*, users.name AS user_name, users.account_name AS user_account_name').joins(:user).find_by_id(id)
    end

  end

end
