class HomeController < ApplicationController
  before_action :authenticate_user!
  def top
    @bands = Band.order(bandid: :asc)
  end
  def administrator
  end
  def OK
  end
end
