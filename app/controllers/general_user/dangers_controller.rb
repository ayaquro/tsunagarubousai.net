# frozen_string_literal: true

class GeneralUser::DangersController < ApplicationController
  before_action :authenticate_general_user!, except: [:top, :about]
  def create
    @post = Post.find(params[:post_id])
    danger = current_general_user.dangers.new(post_id: @post.id)
    danger.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    danger = current_general_user.dangers.find_by(post_id: @post.id)
    danger.destroy
  end
end
