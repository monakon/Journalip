module ApplicationHelper

  def flash_background_color(type)
    case type.to_sym
    when :notice then "flex items-center p-4 mb-4 text-sm text-green-800 border border-green-300 rounded-lg bg-green-50"
    when :alert  then "flex items-center p-4 mb-4 text-sm text-red-800 border border-red-300 rounded-lg bg-red-50"
    when :error  then "flex items-center p-4 mb-4 text-sm text-red-800 border border-red-300 rounded-lg bg-red-50"
    else "bg-gray-500"
    end
  end
end
