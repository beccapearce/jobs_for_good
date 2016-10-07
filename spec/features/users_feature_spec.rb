require 'rails_helper'
require 'web_helpers'

feature "User" do
  context "user not signed in and on the homepage" do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context "user signed in on the homepage" do
    before do
      sign_up
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end

    it "should display the profile link" do
      visit('/')
      expect(page).to have_link('Profile')
    end

    it "should the user's info in the profile" do
      visit('/')
      click_link('Profile')
      expect(page).to have_content('jobseeker@job.com')
    end

    it "should link back to the jobs page" do
      visit('/')
      click_link('Profile')
      click_link('Back to the jobs list')
      expect(page).to have_content('Add a job')
    end
  end
end
