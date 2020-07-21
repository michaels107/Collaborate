# Created 7/19/2020 by Sean Michaels
# Testing for Give table data manipulation
require 'test_helper'

class GiveTest < ActiveSupport::TestCase
  #Test Setups
  def setup
    Account.new(email:'bob@gmail.com', password:'password').save
    Project.new(project_name:'something', description:'something').save
    Student.new(account_id: Account.last.id,
                f_name: 'Sean',
                l_name: 'Michaels',
                dot_name:'michaels.107',
                rating:'A').save
    PeerEvaluation.new(project_role: 'leader',
                       content: 'leader 1',
                       project_id: Project.last.id).save
    @Give = Give.new student_id: Student.last.id, peer_evaluation_id: PeerEvaluation.last.id

  end

  test 'validity' do
    assert @Give.valid?
  end

  test 'valid student' do
    @Give.student_id = -2
    assert_not @Give.valid?
  end

  test 'valid peer' do
    @Give.peer_evaluation_id = -2
    assert_not @Give.valid?
  end


end
