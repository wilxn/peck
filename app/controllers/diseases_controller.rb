class DiseasesController < ApplicationController
  def initpage
    cookies[:current_page] = 1
    cookies[:search] = params[:search]
    redirect_to indexer_path
  end
  def indexer
      params[:search] = cookies[:search]
      @search = Disease.search do
      fulltext cookies[:search] do
        highlight :name
        phrase_fields :defi => 2.0
        #phrase_slop 1
        query_phrase_slop 1
        #highlight :symp
        #highlight :name
        #:signal,:symp,:defi,:factor,:divi,:name
      end 
      @page = cookies[:current_page].to_i
      paginate :page => @page,:per_page => 5
    end
    @search.hits.each do |hit|
      puts "hit:"
      hit.highlights(:name).each do |highlight|
              puts "  " + highlight.format { |word| "*#{word}*" }
             end
    end
    @results = @search.results
    @totals = @search.total
    @total_pages = @results.total_pages
    cookies[:totals] = @total_pages
  end
  def previous
    @page = cookies[:current_page].to_i
    if @page != 1
    @page = @page - 1
    else
      flash[:notice] = "this is the first page"
    end
    cookies[:current_page] = @page
    redirect_to indexer_path
  end
  def next
    @page = cookies[:current_page].to_i
    if @page == cookies[:totals].to_i
      flash[:notice] = "this is the last page"
    else
    @page = @page + 1
    end
    cookies[:current_page] = @page
    redirect_to indexer_path
  end
  def show
    @disease = Disease.find(params[:id])
  end
end
