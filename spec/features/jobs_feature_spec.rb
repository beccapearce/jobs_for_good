require 'rails_helper'
require 'web_helpers'

feature 'jobs' do
  context 'no jobs have been added' do
    scenario 'should display a prompt to add a job' do
      visit '/jobs'
      expect(page).to have_content 'No jobs yet'
      expect(page).to have_link 'Add a job'
    end
  end
  context 'creating jobs' do
    scenario 'user signed in' do
      sign_up
      create_job
      expect(page).to have_text 'Awesome tech job'
    end
  end

    context 'viewing jobs' do

    let!(:job){ Job.create(title:'job name') }

    scenario 'lets anyone view a job' do
     visit '/jobs'
     click_link 'job name'
     expect(page).to have_content 'job name'
     expect(current_path).to eq "/jobs/#{job.id}"
    end
  end
  context 'editing restaurants' do

    before { Job.create title: 'junior dev', description: 'We teach you everything' }

    scenario 'let a user edit a job spec' do
    sign_up
    edit_job
     expect(page).to have_content 'Senior dev'
     expect(page).to have_content 'We decided we want you to know everything already'
     expect(current_path).to eq '/jobs'
    end

  end
    context 'deleting Job specs' do

    before { Job.create title: 'web developer', description: 'make me things' }

    scenario 'removes a job when a user clicks a delete link' do
      sign_up
      visit '/jobs'
      click_link 'Delete'
      expect(page).not_to have_content 'web developer'
      expect(page).to have_content 'Job spec deleted successfully'
    end
  end
end
