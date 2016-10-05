def sign_up
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'jobseeker@job.com')
  fill_in('Password', with: 'findingjobs')
  fill_in('Password confirmation', with: 'findingjobs')
  click_button('Sign up')
end

def create_job
  visit '/jobs'
  click_link('Add a job')
  fill_in 'Title', with: 'Awesome tech job'
  fill_in 'Company', with: 'Awesome tech charity'
  fill_in 'Location', with: 'London'
  fill_in 'Description', with: 'Seeking junior dev, to save the world with code'
  fill_in 'Salary', with: '35000'
  click_button 'Create Job'
end

def edit_job
  visit '/jobs'
  click_link 'Edit'
  fill_in 'Title', with: 'Senior dev'
  fill_in 'Description', with: 'We decided we want you to know everything already'
  click_button 'Update'
end
