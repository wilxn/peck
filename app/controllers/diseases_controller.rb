require 'will_paginate/array'
class DiseasesController < ApplicationController
  def initpage
    cookies[:current_page] = 1
    cookies[:search] = params[:search]
    redirect_to indexer_path
  end
  def indexer
      cookies[:play] = 0
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
#      paginate :page => @page,:per_page => 10 
    end
    @search.hits.each do |hit|
      puts "hit:"
      hit.highlights(:name).each do |highlight|
              puts "  " + highlight.format { |word| "*#{word}*" }
             end
    end
    @results = @search.results.paginate(:page => params[:page],:per_page => 5)
    @totals = @search.total
    @total_pages = @results.total_pages
    cookies[:totals] = @totals
    
    @docIds = Array.new(@totals){|i|
      unless @search.results[i] == nil
      @search.results[i].id
      end
    }
    cookies[:docId] = @docIds.join(":")
    @status = 2
    cookies[:status] = @status
#    respond_to do |format|
    # The action 'vote' is called here.
#    format.js { render :action => "vote", :layout => false }
#  end
  end
  def research
    cookies[:play] = 1
    params[:search] = cookies[:search]
    @docIds = cookies[:docId].split(":")
    @docTotals = cookies[:totals].to_i
    if @docTotals == 1
      flash[:notice] = "This is the only one disease.you can't do research!"
      @results = Array.new(1){|i|
        Disease.getDiseasebyId(@docIds[0].to_i)
      }
      @results = @results.paginate(:page => params[:page],:pre_page => 5)
      @totals = @results.length
      return 
    end
    factor = (@docTotals/2).to_i
    keyword = File.open("/home/wilxn/peck-3.2.1/app/controllers/data.txt")
    @keywords = keyword.readlines[0].split("#")
    @keywords.delete_at(@keywords.length - 1)
   # @keywords = Array.new(4)
   # @keywords = ["c","b","a","s"]
    @searchbyKeywords = Array.new(@keywords.length){|i|
      keyword = @keywords[i]
      Disease.search do
        fulltext keyword
      end
    }
    @resultbyKeywords = Array.new(@keywords.length){|i|
      @searchbyKeywords[i].results
    }
    @totalDocIds = Array.new(@resultbyKeywords.length){|i|
      Array.new(@searchbyKeywords[i].total){|j|
        if @resultbyKeywords[i][j] != []
        @resultbyKeywords[i][j].id
        else
         [] 
        end
      }    
    }
    @docIds.each do |docIds|
      docIds.to_i
    end
    @docIds_toI = Array.new(@docIds.length){|i|
      @docIds[i].to_i
    }
    @yesDocIds = Array.new(@searchbyKeywords.length){|i|
      @docIds_toI & @totalDocIds[i]
    }
    @noDocIds = Array.new(@searchbyKeywords.length){ |i|
      @docIds_toI - @totalDocIds[i]
    }
    i = 0
    min = 1000
    while i < @searchbyKeywords.length
      rule = (@yesDocIds[i].length - factor)**2
      if rule <= min
        min = rule
        keyId = i
      end
      i = i + 1
    end
    @resultsInit = Array.new(@docIds.length){|i|
      Disease.getDiseasebyId(@docIds[i])
    }
    @mainkeyword = @keywords[keyId]
    if @mainkeyword == nil
      flash[:notice] = "can't to make differrence"
      @totals = @results.length
      @results = @resultsInit.paginate(:page => [:page],:per_page => 5)
      return
    end
    if cookies[:status] == "1" 
      @yesKeyDocs = @yesDocIds[keyId]
      @results = Array.new(@yesKeyDocs.length){|i|
        Disease.getDiseasebyId(@yesKeyDocs[i])
      }
      @docIds = Array.new(@results.length){|i|
        unless @results[i] == nil
          @results[i].id
        end
      }
      cookies[:docId] = @docIds.join(":")
      cookies[:status] = 2
      cookies[:play] = 0
    else
      if cookies[:status] =="0"
        @noKeyDocs = @noDocIds[keyId]
        @results = Array.new(@noKeyDocs.length){|i|
          Disease.getDiseasebyId(@noKeyDocs[i])
        }
        @docIds = Array.new(@results.length){|i|
          unless @results[i] == nil
            @results[i].id
          end
        }
        cookies[:docId] = @docIds.join(":")
        cookies[:status] = 2
        cookies[:play] = 0
      else
        @results = @resultsInit
      end
    end
    @totals = @results.length
    @results = @results.paginate(:page => params[:page],:per_page => 5)
    cookies[:totals] = @totals
  end
  def yes
    @status = 1
    cookies[:status] = @status
    cookies[:search] += ' ' + cookies[:searchtmp] 
    cookies[:play] = 0
    redirect_to research_path
  end
  def no
    @status = 0
    cookies[:status] = @status
    cookies[:play] = 0
    redirect_to research_path
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
