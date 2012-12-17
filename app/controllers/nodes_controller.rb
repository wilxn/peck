class NodesController < ApplicationController
	def new
	end
	def creat
	end
	def show
	@node = Node.findbyId(params[:nodeId])
	@topics = @node.topics
	end
	def destroy
	end
end
