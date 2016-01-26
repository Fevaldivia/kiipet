module BookingsHelper
  def get_status(status)
    case status
    when "available"
      ["Disponible","label label-success"]
    when "taken"
      ["Ocupado","label label-danger"]
    end
  end
end
