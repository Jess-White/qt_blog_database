class Api::BlogsController < ApplicationController

  # before_action :authenticate_user

  def index
    @blogs = Blog.all

    @blogs = @blogs.order(id: :asc)

    render "index.json.jb"
  end

  def create
    @blog = Blog.new(
      title: params[:title],
      text: params[:text],
    )
    if @blog.save
      render "show.json.jb"
    else
      render json: { errors: @blog.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @blog = Blog.find(params[:id])
    render "show.json.jb"
  end

  def update
    @blog = Blog.find(params[:id])

    @blog.title = params[:title] || @blog.title
    @blog.text = params[:text] || @blog.text

    if @blog.save
      render "show.json.jb"
    else
      render json: { errors: @blog.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    render json: { message: "Blog entry successfully destroyed" }
  end
end

