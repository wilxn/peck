class RepliesController < ApplicationController
    #before_filter :find_topic 
  def create
    @topic = Topic.find(params[:topic_id])
    @reply = @topic.replies.build(params[:reply])
    @reply.user_id = current_user.id
    @reply.topic_id = @topic.id
    @topic.replies_count += 1
    @topic.save
    if @reply.save
      #current_user.read_topic(@topic)
      redirect_to(topic_path(@reply.topic_id),:notice => "reply successfully")
    else
      @msg = @reply.errors.full_messages.join("<br />")
    end
  end
  def show
  
  end
  def update
    @reply = Reply.find(params[:id])

    if @reply.update_attributes(params[:reply])
      redirect_to(topic_path(@reply.topic_id), :notice => 'successfully replies')
    else
      render :action => "edit"
    end
  end
  def edit
  	@reply = Reply.find(params[:id])
  end	
  def destroy
    @reply = Reply.find(params[:id])
    @topic = @reply.topic
    @topic.replies_count -= 1
    @topic.save

    if @reply.destroy
      redirect_to(topic_path(@reply.topic_id), :notice => 'delete successfully')
    else
      redirect_to(topic_path(@reply.topic_id), :alert => 'delete failed')
    end
  end
  def find_topic
    @topic = Topic.find(params[:topic_id])
  end
end
