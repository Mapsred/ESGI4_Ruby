class GradesController < ApplicationController
  def index
    @grades = Grade.all
  end

  def new
  end

  def create

    errors = []
    if(!params.has_key?(:name))
      errors["name"] = "Le nom ne peut pas être vide"
    end
    if(!params.has_key?(:alias))
      errors["alias"] = "L'alias ne peut pas être vide"
    end
    if(!params.has_key?(:description))
      errors["description"] = "La description ne peut pas être vide"
    end

    if(errors.empty?)
      @grade = Grade.new(params)
      if @grade.save
        redirect_to @grade
      else
        render "new"
      end
      # grades.name = params[:name]
      # grades.alias = params[:alias]
      # grades.description = params[:description]
      # grades.save

    end

  end

  def is_param_valid(param, key)
    if(param.has_key?(key))
      return true
    else
      return false
    end
  end
end