class BoardController < ApplicationController
  def search
  end

  def admin
  end

  def show
    if BoardPost.exists?(params[:id]) then @msg=BoardPost.find(params[:id]).body
    else @msg="not found"
      flash[:err]="no such entry. First entry id is #{BoardPost.first.id}"
    end
    
  end

end
