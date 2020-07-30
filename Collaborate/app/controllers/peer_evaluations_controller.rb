# Created 7/25/2020 by Caroline Wheeler
# Edited 7/26/2020 by Caroline Wheeler
# Edited 7/27/2020 by Caroline Wheeler
# Edited 7/28/2020 by Sean Michaels : changing the index method to list all students in a group
# Controller for the peer evaluation form page
#
class PeerEvaluationsController < ApplicationController
  # Created 7/25/2020 by Caroline Wheeler
  # Provides new peer eval form with instance
  def new
    @page_id = params[:page_id]
    @student_id = params[:student_id]
    @associated_id = params[:associated_id]
    @peer_evaluation = PeerEvaluation.new
  end

  # Created 7/25/2020 by Caroline Wheeler
  # Edited 7/29/2020 by Duytan Tran: fixed param passing
  # Inserts new peer eval in peer evaluation table
  # Also updates gives table
  def create
    params.permit!
    @peer_evaluation = PeerEvaluation.new peer_eval_params
    parameters = params[:peer_evaluation]
    @peer_evaluation = PeerEvaluation.new attendance: params[:attendance],
                                          participation: params[:participation],
                                          contribution: params[:contribution],
                                          time: params[:time],
                                          team: params[:team],
                                          general: parameters[:general],
                                          associated_id: params[:associated_id],
                                          student_id: params[:student_id]
    if @peer_evaluation.save
      Give.new(peer_evaluation_id: PeerEvaluation.order('created_at').last.id, student_id: current_account.id).save
      redirect_to peer_evaluation_path(params[:page_id], associated_id: params[:associated_id])
    else
      render :new
    end
  end

  # Created 7/26/2020 by Caroline Wheeler
  # Edited 7/28/2020 by Sean Michaels : changing the index method to list all students in a group
  # Gets all peer evals
  def index
    student_ids = ApartOf.where(group_id: params[:id]).pluck :student_id
    @page_id = params[:id]
    @associated_id = params[:associated_id]
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
