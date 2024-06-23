module ApplicationHelper
  def convert_to_id(resource)
    resource.to_s.parameterize.concat("-#{resource.id}")
  end

  def level_color_class(level)
    case level
    when 1..3
      "bg-gray-800 text-white dark:bg-gray-900 dark:text-gray-100"
    when 4..6
      "bg-red-100 text-red-800 dark:bg-red-500/20 dark:text-red-300"
    when 7..9
      "bg-blue-100 text-blue-800 dark:bg-blue-500/20 dark:text-blue-300"
    when 10..12
      "bg-yellow-100 text-yellow-800 dark:bg-yellow-500/20 dark:text-yellow-300"
    else
      "bg-gray-100 text-gray-800 dark:bg-gray-500/20 dark:text-gray-300"
    end
  end

end
