module AstronautsHelper
  def grade_user(name, grade)
    raw "#{grade} #{name} "
  end
end
