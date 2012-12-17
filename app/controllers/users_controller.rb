class UsersController < ApplicationController
   def index
   	@total_user_count = User.count
   	@users = User.all
       end
    def edit
      @user = User.find(current_user.id)
      end
    def update
       @user = User.find(params[:id])
      respond_to do |format|
      if @user.update_attributes(params[:user])
        @user.save
        format.html { redirect_to @user, notice:'User was updated successfully.'}
        format.json { head :no_content }
      else
        format.html {render allction: "edit" }
        format.json {render json: @user.errors,status: :unprocessable_entity }
      end
    end
    end
   def show
      @user = User.find(params[:id])
      @replies = @user.replies
      @topics = @user.topics
   end
   def topics
        @user = User.find(params[:userId])
   	 @topics = @user.topics.paginate(:page => params[:page] , :per_page => 30)
   end
   def favorites
    @user = User.find(params[:userId])
   end
end
