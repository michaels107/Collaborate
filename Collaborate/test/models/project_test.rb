# frozen_string_literal: true

# Created 7/18/2020 by Duytan Tran
# Testing for project table data manipulation
require 'test_helper'

# Tests constraints imposed on Projects table
class ProjectTest < ActiveSupport::TestCase
  # Created 7/18/2020 by Duytan Tran
  # Initial valid form of a project formatted for insertion in Projects table
  def setup
    @project = Project.new project_name: 'Example Project',
                           description: 'An example of a project in the project table'
  end

  test 'should be valid' do
    assert @project.valid?
  end

  # project_name constrictions tests
  test 'project_name should be present' do
    @project.project_name = '     '
    assert_not @project.valid?
  end

  test 'project_name should not be nil' do
    @project.project_name = nil
    assert_not @project.valid?
  end

  test 'project_name should not be more than 100 characters' do
    @project.project_name = 'a' * 101
    assert_not @project.valid?
  end

  # Description constrictions tests
  test 'description can be nil' do
    @project.description = nil
    assert @project.valid?
  end

  test 'description can be empty' do
    @project.description = ''
    assert @project.valid?
  end

  test 'description should not exceed 255 characters' do
    @project.description = 'a' * 256
    assert_not @project.valid?
  end
end
