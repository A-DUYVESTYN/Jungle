class AboutController < ApplicationController

  # restrict this about page to logged in users for testing reasons
  before_action :authorize

  def index
  end

end
