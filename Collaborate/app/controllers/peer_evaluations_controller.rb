# Created 7/25/2020 by Caroline Wheeler
# Edited 7/26/2020 by Caroline Wheeler
# Edited 7/27/2020 by Caroline Wheeler
# Controller for the peer evaluation form page
#
class PeerEvaluationsController < ApplicationController
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
    parameters = params[:peer_evaluation]
    @peer_evaluation = PeerEvaluation.new(attendance:parameters[:attendance],
                                          participation:parameters[:participation],
                                          contribution:parameters[:contribution],
                                          time:parameters[:time],
                                          team:parameters[:team],
                                          general:parameters[:general])
    if @peer_evaluation.save
      Give.new(peer_evaluation_id: PeerEvaluation.order("created_at").last.id, student_id: current_account.id).save
      redirect_to peer_evaluation_path
    else
      render :new
    end
  end

  # Created 7/26/2020 by Caroline Wheeler
  # Edited 7/28/2020 by Sean Michaels : changing the index method to list all students in a group
  # Gets all peer evals
  def index
    student_ids = ApartOf.where(group_id: params[:id]).pluck :student_id
    @members = Student.where id: student_ids
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
    params.require(:peer_evaluation).permit(:attendance, :participation, :contribution, :time, :team, :general)
  end

end
