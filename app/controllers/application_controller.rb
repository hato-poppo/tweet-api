class ApplicationController < ActionController::API

  def response_of_success(json)
    { json: json, status: 200 }
  end

  def response_of_bad_request(msg)
    { json: { message: msg }, status: 400 }
  end

  def response_of_not_found(msg)
    { json: { message: msg }, status: 404 }
  end

end
