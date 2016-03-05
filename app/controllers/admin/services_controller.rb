class Admin::ServicesController < Admin::AdminController
  def index
    @services = Service.all
  end
end
