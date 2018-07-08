# frozen_string_literal: true

# HomeController
class HomeController < ApplicationController
  def index
    @expedition = Expedition.last_opened
  end
  def credit
    render :'home/credit'
  end
  def condition
    render :'home/condition'
  end
  def partner
    render :'home/partner'
  end
end
