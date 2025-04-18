class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      # 新規投稿後に投稿一覧ページへリダイレクト
      redirect_to posts_path, notice: "投稿完了！"
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
