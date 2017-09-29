class PublicController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout "application"
  before_filter :get_menu
  before_filter :get_menuII
  
  def get_menu
    @menus = MenuService.new.list
  end

  def get_menuII
    @menusII = MenuService.new.listII
  end
  
  def index
    
  end
  
  def about
    
  end

  def woman

  end

  def men

  end

  def watch

  end 

  def jewelry

  end 

  def lifestyle

  end

  def retailer

  end

  def solutions

  end

  def others

  end

  def beauty
    
  end
end
