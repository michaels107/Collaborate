# Created 7/25/2020 by Caroline Wheeler
# Edited 7/26/2020 by Caroline Wheeler
# Edited 7/27/2020 by Caroline Wheeler
# Controller for the peer evaluation form page
#
# Note: Unsure how to redirect/where to
class FormController < ApplicationController
  # Created 7/25/2020 by Caroline Wheeler
  # Provides new peer eval form with instance
  def new
    @peer_evaluation = PeerEvaluation.new
  end

  # Created 7/25/2020 by Caroline Wheeler
  # Inserts new peer eval in peer evaluation table
  # Also updates gives table
  def create
    # @peer_evaluation = PeerEvaluation.new(f_name: params[:f_name], etc.)
    @peer_evaluation = PeerEvaluation.new(peer_eval_params)

    if @peer_evaluation.save
      Give.new (peer_evaluation_id: PeerEvaluation.order("created_at").last.id, student_id: current_account.id).save
      # define path somewhere??
      redirect_to peer_evaluation_path
    else
      render :new
    end
  end

  # Created 7/26/2020 by Caroline Wheeler
  # Gets all peer evals
  def index
    @peer_evaluations = PeerEvaluation.all
  end

  # Created 7/25/2020 by Caroline Wheeler
  # Prepare edits page for a project
  def edit
    @peer_evaluation = PeerEvaluation.find(params[:id])
  end

  # Created 7/27/2020 by Caroline Wheeler
  # Updates an already existing peer eval
  def update
    @peer_evaluation = PeerEvaluation.find(params[:id])
    if @peer_evaluation.save
      @peer_evaluation.update(peer_eval_params)
      redirect_to peer_evaluation_path
    else
      render :edit
    end
  end

  private
  def peer_eval_params
    # Note: need to specify different params based on the form
    params.require(:peer_evaluation).permit(:f_name)
  end

end
