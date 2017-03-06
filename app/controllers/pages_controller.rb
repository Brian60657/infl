class PagesController < ApplicationController

  # restrict access, only logged in users can access the secret page
    before_action :authorize, only: [:secret]

  def secret
  end

end
