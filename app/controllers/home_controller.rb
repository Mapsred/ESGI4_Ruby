# frozen_string_literal: true

# HomeController
class HomeController < ApplicationController
  def index
    @expedition = Expedition.last_opened
  end
end
