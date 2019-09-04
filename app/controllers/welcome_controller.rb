class WelcomeController < ApplicationController

  def index
    @search_results = []
    # @search_results = PgSearch::Document.all

    if params[:q] && !params[:q].empty?
      @search_results = PgSearch.multisearch(params[:q])
    elsif params[:q] && params[:q].empty?
        @search_results = PgSearch::Document.all
    end
  end
end
