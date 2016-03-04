module PaymentsHelper
  def get_cuidador(booking_id)
    c = Booking.find(booking_id)
    if c
      c.calendar.profile.name
    else
      "No encontrado"
    end
  end

  def get_comuna(booking_id)
    c = Booking.find(booking_id)
    if c
      c.calendar.profile
    else
      "No encontrado"
    end
  end

  def get_pagador(profile_id)
    p = Profile.find(profile_id)

    if p
      p.name
    else
      "No encontrado"
    end
  end

  def get_servicio(booking_id)
    b = Booking.find(booking_id)
    if b
      b.profile_service.service.name
    else
      "No encontrado"
    end
  end
end
