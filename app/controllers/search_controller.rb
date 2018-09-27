class SearchController < ApplicationController
  def search
    if params[:term].nil?
      @manuals = []
    else
      @manuals = Manual.search params[:term]
    end
  end
end
