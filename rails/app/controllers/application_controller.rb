class ApplicationController < ActionController::API

  def test500
    raise "Test 500 error"
  end
end
