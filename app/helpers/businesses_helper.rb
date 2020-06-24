module BusinessesHelper
  def pretty_time(str)
    if str.present?
      if str.to_i > 1200
        ((str.to_i - 1200).to_s + " p.m.").insert(-8, ":")
      elsif str.to_i < 1200
        (str + " a.m.").insert(-8, ":")
      else
        ""
      end
    else
    	""
    end
  end
end
