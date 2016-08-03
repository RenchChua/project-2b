module VotesHelper
  def can_vote
    logged_in? && Vote.where(wibni_id: params[:id], user_id: current_user.id).count == 0
  end

  def can_unvote
    logged_in? && Vote.where(wibni_id: params[:id], user_id: current_user.id).count == 1
  end
end
