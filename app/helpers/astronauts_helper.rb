module AstronautsHelper
  def grade_user(name, grade)
    raw "Nom : #{name}, Grade : #{grade}"
  end
end
