require 'spec_helper'

describe BooksController do
  login_user

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'user_books'" do
    it "should be successful" do
      get 'user_books'
      response.should be_success
    end
  end
end

