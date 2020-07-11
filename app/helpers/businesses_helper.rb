module BusinessesHelper
  def pretty_time(str)
    if str.present?
      if str.gsub(":","").to_i > 1200
        ((str[0..-4].to_i - 12).to_s + str[-3..-1] + " p.m.")
      elsif str.gsub(":","").to_i < 1200
        (str + " a.m.")
      else
        ""
      end
    else
    	""
    end
  end

  def grouped_subcats_for_select
    subcats = {}
    Category.all.each do |cat|
      subcats[cat.name] = []
      cat.subcategories.each { |sub| subcats[cat.name] << [sub.name, sub.id] }
    end
    subcats
  end
end
