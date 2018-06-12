# frozen_string_literal: true

# HomeController
class HomeController < ApplicationController
  def index
    @expedition = Expedition.order('created_at').last
  end
end
