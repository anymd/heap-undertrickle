require 'spec_helper'

describe 'signup' do
  it "can sign-up as a new user called ben" do
    visit sign_up_url
    fill_in "user_name", with: "Ben"
    fill_in "user_email", with: "ben@mail.com"
    fill_in "user_password", with: "puppy"
    fill_in "user_password_confirmation", with: "puppy"
    click_button "Create User"
    page.should have_content "Signed up!"
  end
end

# describe 'login' do
#   it "can login as a user called ben" do
#       visit log_in_url
#       fill_in 'email', with: "ben@mail.com"
#       fill_in 'password', with: "puppy"
#       click_button "Log in"
#       current_path.should == '/'
#   end
# end

# describe 'QuestionVote' do
#   it "can create a new question and vote on it" do
#     visit new_question_url

#     expect {
#       fill_in 'question_title',   with: "I have a question"
#       fill_in 'question_text', with: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat."
#       page.check('post_is_published')
#       click_button "Save"
#     }.to change(Post, :count).by(1)

#     page.should have_content "Published: true"
#     page.should have_content "Post was successfully saved."
#   end

#   it "can mark an existing post as unpublished" do
#     pending # remove this line when you're working on implementing this test

#     page.should have_content "Published: false"
#   end
# end
