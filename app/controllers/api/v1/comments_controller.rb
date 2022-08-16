class Api::V1::CommentsController < ApiController
  protect_from_forgery unless: -> { request.format.json? }
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user

  def create
    comment = post.comments.new(comment_params)
    
    if comment.save 
      render json: comment
      
    else 
      render json: { error: comment.errors.messages }, status: "400"
      
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def post
    @post ||= Post.find(params[:post_id])
  end

  def authenticate_user
    if !user_signed_in?
      render json: {error: ["You must be signed in"]}
    end
  end
end