module VotesHelper
  def can_vote
    Vote.where(wibni_id: params[:id], user_id: current_user.id).count == 0
  end

  def can_unvote
    Vote.where(wibni_id: params[:id], user_id: current_user.id).count != 0
  end
end
