# frozen_string_literal: true

# Created 7/18/2020 by Duytan Tran
# Testing for PeerEvaluations table data manipulation
require 'test_helper'

class PeerEvaluationTest < ActiveSupport::TestCase
  # Created 7/18/2020 by Duytan Tran
  # Initial valid form of a peer evaluation formatted for insertion in PeerEvaluations table
  def setup
    Course.new(section_num: 43234, course_name: 'data', course_number: 1337).save
    Project.new(project_name: 'P1: Something', description: 'Does something', course_id: Course.last.id).save
    Account.new(email: 'bob@gmail.com', password: 'password').save
    Group.new(group_name: 'Quaranteam', num_of_teammates: '4', course_id: Course.last.id).save
    Associated.new(group_id: Group.last.id, project_id: Project.last.id).save
    Student.new(account_id: Account.last.id,
                f_name: 'Sean',
                l_name: 'Michaels',
                dot_name: 'michaels.107',
                rating: 'A').save
    @peer_eval = PeerEvaluation.new attendance: '2',
                                    participation: '3',
                                    contribution: '4',
                                    time: '5',
                                    team: '3',
                                    general: '4',
                                    associated_id: Associated.last.id,
                                    student_id: Student.last.id
  end

  test 'should be valid' do
    assert @peer_eval.valid?
  end

end
