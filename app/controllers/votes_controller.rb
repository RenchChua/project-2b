class VotesController < ApplicationController
  before_action :can_vote, only: :vote
  before_action :can_unvote, only: :unvote

  def vote
    @vote = Vote.new
    @vote.user_id = current_user.id
    @vote.wibni_id = params[:id]
    @wibni=Wibni.find(params[:id])
    if @vote.save
      @wibni.update_attribute(:numvotes, Vote.where(wibni_id: params[:id]).count )
      redirect_to "/wibnis/#{params[:id]}"
    else
      redirect_to root_path
    end
  end

  def unvote
    @vote = Vote.find(params[:vote_id])
    @wibni=Wibni.find(params[:wibni_id])
    @vote.destroy
    @wibni.update_attribute(:numvotes, Vote.where(wibni_id: params[:wibni_id]).count )
    redirect_to "/wibnis/#{params[:wibni_id]}"
  end


end
