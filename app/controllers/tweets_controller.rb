class TweetsController < ApplicationController

  # 本来であればログインユーザーのチェックやアクションに対する権限があるかどうかのチェックが必要になるが割愛する

  # GET /tweets
  def index
    render response_of_success(Tweet.all)
  end

  # GET /tweets/:id
  def show
    tweet = Tweet.find_by_id(tweet_id)
    render tweet.present? ? response_of_success(tweet) : response_of_not_found
  end

  # POST /tweets
  def create
    tweet = Tweet.new(params_for_create)
    render tweet.save ? response_of_success(tweet) : response_of_bad_request(tweet.errors.full_messages)
  end

  # PUT /tweets/:id
  def update
    tweet = Tweet.find_by_id(tweet_id)
    render response_of_not_found and return if tweet.blank?
    render tweet.update(params_for_update) ? response_of_success(tweet) : response_of_bad_request(tweet.errors.full_messages)
  end

  # DELETE /tweets/:id
  def destroy
    tweet = Tweet.find_by_id(tweet_id)
    render response_of_not_found and return if tweet.blank?
    render response_of_success(tweet.destroy)
  end

  private

    def params_for_create
      # 意図しないデータの受け取りを防ぐことができる
      params.require(:tweet).permit(:user_id, :content)
    end

    def params_for_update
      # 意図しないデータの受け取りを防ぐことができる
      params.require(:tweet).permit(:content)
    end

    def tweet_id
      params[:id]
    end

    def response_of_success(json)
      { json: json, status: 200 }
    end

    # application_controller.rb に書いてもらうことも検討
    def response_of_bad_request(msg)
      { json: { message: msg }, status: 400 }
    end

    # application_controller.rb に書いてもらうことも検討
    def response_of_not_found
      { json: { message: '対象のツイートが存在しません。' }, status: 404 }
    end

end
