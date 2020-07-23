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
    Account.new(email:'bob@gmail.com', password:'password').save
    Group.new(group_name:'Quaranteam', num_of_teammates:'4').save
    Student.new(account_id: Account.last.id,
                f_name: 'Sean',
                l_name: 'Michaels',
                dot_name:'michaels.107',
                rating:'A').save
    @peer_eval = PeerEvaluation.new project_role: 'Useless',
                                    content: 'Very bad',
                                    project_id: Project.last.id,
                                    group_id: Group.last.id,
                                    student_id: Student.last.id
  end

  test 'should be valid' do
    assert @peer_eval.valid?
  end

  # project_role constraints testing
  test 'project role must not exceed 255 characters' do
    @peer_eval.project_role = 'a' * 256
    assert_not @peer_eval.valid?
  end

  # content constraints testing
  test 'content should be present' do
    @peer_eval.content = '         '
    assert_not @peer_eval.valid?
  end

  test 'content should not exceed 6000 characters' do
    @peer_eval.content = 'a' * 6001
    assert_not @peer_eval.valid?
  end

  # project_id constraints testing
  test 'project_id should be present' do
    @peer_eval.project_id = '         '
    assert_not @peer_eval.valid?
  end

  test 'project_id should exist' do
    @peer_eval.project_id = -2
    assert_not @peer_eval.valid?
  end

end
