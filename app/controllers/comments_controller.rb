class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :check_comment_owner, only: [:edit, :update, :destory]

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      flash[:notice] = 'コメントを投稿しました。'
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = 'コメントを保存できませんでした。'
      redirect_back(fallback_location: root_path)
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    if @comment.update(comment_params.merge(user_id: current_user.id))
      flash[:notice] = 'コメントを更新しました。'
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = 'コメントを更新できませんでした。'
      redirect_back(fallback_location: root_path)
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:content, :user_id, :commentable_type, :commentable_id)
    end

    def check_comment_owner
      redirect_to root_path, notice: '権限がありません' unless @comment.user == current_user
    end
end
