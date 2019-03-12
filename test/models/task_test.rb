require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "split" do
  	project = Project.new(name: 'project 1', workingdays: "[1,2,3,4,5]")
  	task = Task.new(name: 'task 1', project: project) 
  	p task.split_process.map{|s| "subtask: #{s.name}  => day: #{s.day}" }

  	assert_equal(task.split_process.map{|s| "#{s.name}  => #{s.day}" }, ["ST 1  => 1", "ST 2  => 2", "ST 3  => 3", "ST 4  => 4", "ST 5  => 5"])


  	project = Project.new(name: 'project 2', workingdays: "[1,2,3]")
  	task = Task.new(name: 'task 2', project: project) 
  	p task.split_process.map{|s| "subtask: #{s.name}  => day: #{s.day}" }

  	assert_equal(task.split_process.map{|s| "#{s.name}  => #{s.day}" }, ["ST 1  => 1", "ST 2  => 1", "ST 3  => 2", "ST 4  => 2", "ST 5  => 3"])


  	project = Project.new(name: 'project 3', workingdays: "[3,4,5,6,7,1,2]")
  	task = Task.new(name: 'task 2', project: project) 
  	p task.split_process.map{|s| "subtask: #{s.name}  => day: #{s.day}" }

  	assert_equal(task.split_process.map{|s| "#{s.name}  => #{s.day}" }, ["ST 1  => 3", "ST 2  => 4", "ST 3  => 5", "ST 4  => 1", "ST 5  => 2"])
  end
end
