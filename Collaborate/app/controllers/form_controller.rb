# Created 7/25/2020 by Caroline Wheeler
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
  def create
    params.permit!
    @peer_evaluation = PeerEvaluation.new(params[:peer_evaluation])
  end

  # Created 7/25/2020 by Caroline Wheeler
  # Initialize method for the peer evaluation
  def initialize(params)
    self.name = params.fetch(:name, '')
    # we will need to specify other parameters for the peer eval here I believe
    # These also need to be in the model?
  end

  # Seems like we only need either initialize or edit????
  # Forms are confusing :\

  # Created 7/25/2020 by Caroline Wheeler
  # Prepare edits page for a project
  def edit
    @peer_evaluation = PeerEvaluation.find(params[:id])
  end

  # Created 7/25/2020 by Caroline Wheeler
  # Returns true if form is submitted correctly, false otherwise
  def save
    return false unless valid? # guard clause - confused about how this works

    PeerEvaluation.create # we need params here
    notify_prof
  end

  # Created 7/25/2020 by Caroline Wheeler
  # Notifies the professor when a new peer eval is completed.
  def notify_prof
    # code to notify prof when peer eval is done
    # Either need a message model or email should be sent
  end

  # Created 7/25/2020 by Caroline Wheeler
  # Deletes a selected peer evaluation from the database
  def destroy
    @peer_evaluation = PeerEvaluation.find(params[:peer_evaluation_id])
    @peer_evaluation.destroy
  end

end
