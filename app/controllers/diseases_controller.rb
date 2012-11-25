class DiseasesController < ApplicationController
  def indexer
    @search = Disease.search do
      fulltext params[:search] do
       #phrase_fields :symp => 2.0
        query_phrase_slop 1
        highlight :symp
        highlight :name
        #:signal,:symp,:defi,:factor,:divi,:name
      end
    end
    @hits = @search.hits
    @search.hits.each do |hit|
     hit="#{hit}+hi"
    end
   # @search.hits.each do |hit|
    #  puts "hit:"
    #  hit.highlights(:symp).each do |highlight|
     #         puts "  " + highlight.format { |word| "*#{word}*" }
      #       end
   # end
    @results = @search.results
    @totals = @search.total
    @total_pages = @results.total_pages
  end


  def show
    @disease = Disease.find(params[:id])

  end
end
