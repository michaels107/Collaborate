# Created 7/19/2020 by Sean Michaels
# Testing for Give table data manipulation
require 'test_helper'

class GiveTest < ActiveSupport::TestCase
  #Test Setups
  def setup
    Course.new(section_num: 43234, course_name: 'data', course_number: 1337).save
    Group.new(group_name:'Quaranteam', num_of_teammates:'4', course_id: Course.last.id).save
    Account.new(email:'bob@gmail.com', password:'password').save
    Project.new(project_name:'something', description:'something', course_id: Course.last.id).save
    Associated.new(group_id: Group.last.id, project_id: Project.last.id).save
    Student.new(account_id: Account.last.id,
                f_name: 'Sean',
                l_name: 'Michaels',
                dot_name:'michaels.107',
                rating:'A').save
    PeerEvaluation.new(attendance: '2',
                       participation: '3',
                       contribution: '4',
                       time: '5',
                       team: '3',
                       general: '4',
                       associated_id: Associated.last.id,
                       student_id: Student.last.id).save
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
