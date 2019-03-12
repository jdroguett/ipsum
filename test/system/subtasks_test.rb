require "application_system_test_case"

class SubtasksTest < ApplicationSystemTestCase
  setup do
    @subtask = subtasks(:one)
  end

  test "visiting the index" do
    visit subtasks_url
    assert_selector "h1", text: "Subtasks"
  end

  test "creating a Subtask" do
    visit subtasks_url
    click_on "New Subtask"

    fill_in "Day", with: @subtask.day
    fill_in "Name", with: @subtask.name
    fill_in "Task", with: @subtask.task_id
    click_on "Create Subtask"

    assert_text "Subtask was successfully created"
    click_on "Back"
  end

  test "updating a Subtask" do
    visit subtasks_url
    click_on "Edit", match: :first

    fill_in "Day", with: @subtask.day
    fill_in "Name", with: @subtask.name
    fill_in "Task", with: @subtask.task_id
    click_on "Update Subtask"

    assert_text "Subtask was successfully updated"
    click_on "Back"
  end

  test "destroying a Subtask" do
    visit subtasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Subtask was successfully destroyed"
  end
end
