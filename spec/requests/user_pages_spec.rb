require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup" do
    before { visit signup_path }
    
    describe "with invalid information" do

      describe "after submission" do
        before { click_button submit }
        
        it { should have_title('Sign up') }
        it { should have_content('error') }
      end
    end
    
    describe "after saving the user" do
      before { click_button submit }
      let(:user) { User.find_by(email: 'user@example.com') }
      
      it { should have_link('Sign out') }
      it { should have_title(user.name) }
      it { should have_selector('div.alert.alert-success', text: 'Welcome') }
    end
  end
end
