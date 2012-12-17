class TopicsController < ApplicationController
  def new
    @topic = Topic.new
    @nodes = Node.all
  end
  def create
    pt = params[:topic]
    @topic = Topic.new(pt)
    @topic.user_id = current_user.id
    @topic.node_id = params[:node][:id]
    if @topic.save
      redirect_to(topics_path(@topic.id),:notice => "create successfully")
    end
  end
  def index
  	@topics = Topic.all
     @section = Section.all
  end
  def show
  	@topic = Topic.find(params[:id])
  	@replies = @topic.replies
     @reply_counter = @topic.replies_count

  end
  def edit
    @topic = Topic.find(params[:id])
    @nodes = Node.all
    @node = @topic.node
  end
  def update
    @topic = Topic.find(params[:id])
    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        @topic.node_id = params[:node][:id]
        @topic.save
        format.html { redirect_to @topic, notice:'Topic was updated successfully.'}
        format.json { head :no_content }
      else
        format.html {render allction: "edit" }
        format.json {render json: @topic.errors,status: :unprocessable_entity }
      end
    end
  end
  def destroy
  	@topic = Topic.find(params[:id])
  	@topic.destroy
  	redirect_to(topics_path, :notice => "topics.delete_topic_success")

  end
end
