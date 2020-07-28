 class SocialsController < ApplicationController

  def destroy
    Social.find(params[:id]).destroy
  end
end