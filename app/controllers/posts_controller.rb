class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end
    
    def create
        post = Post.new(post_params)
            post.content = post.content.gsub("spoiler", "")
        post.save

        redirect_to root_path
    end

    def post_params
        params.require(:post).permit(:tittle, :image_url, :content)
    end
end
