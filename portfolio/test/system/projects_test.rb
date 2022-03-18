require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  setup do
    @project = projects(:one)
  end

  test "visiting the index" do
    visit projects_url
    assert_selector "h1", text: "Projects"
  end

  test "should create projects" do
    visit projects_url
    click_on "New projects"

    fill_in "Description", with: @project.description
    fill_in "Title", with: @project.title
    click_on "Create Projects"

    assert_text "Projects was successfully created"
    click_on "Back"
  end

  test "should update Projects" do
    visit project_url(@project)
    click_on "Edit this projects", match: :first

    fill_in "Description", with: @project.description
    fill_in "Title", with: @project.title
    click_on "Update Projects"

    assert_text "Projects was successfully updated"
    click_on "Back"
  end

  test "should destroy Projects" do
    visit project_url(@project)
    click_on "Destroy this projects", match: :first

    assert_text "Projects was successfully destroyed"
  end
end
