require 'spec_helper'

describe Answer do

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:question_id) }
  it { should belong_to(:user) }
  it { should belong_to(:question) }
  it { should have_many(:votes) }
  it { should have_many(:responses) }


end



# describe Answer do
#   let(:answer) { Answer.new("0123456789", 50) }

#   describe "#initialize" do
#     it "creates an account object" do
#       account.should be_an_instance_of Account
#     end

#     it "should have a starting balance of 0" do
#       account.balance.should eq 0
#     end

#   end

#   describe "#transactions" do
#     it "should increment in size when deposit! is called" do
#       expect { account.deposit!(50) }.to change { account.transactions.size }.from(1).to(2)
#     end
 
#     it "should increment in size when withdraw! is called" do
#       expect { account2.withdraw!(25) }.to change { account2.transactions.size }.from(1).to(2)
#     end
#   end
