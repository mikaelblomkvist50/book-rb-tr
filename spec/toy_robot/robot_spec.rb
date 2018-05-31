require 'spec_helper'

#We've refered to the Robot class under the ToyRobot module as our application is called ToyRobot.
#And the container for the robot logic is going to be the Robot class.
describe ToyRobot::Robot do
  subject { ToyRobot::Robot.new(0) }

  it 'moves 3 spaces' do
    3.times { subject.move}

    expect(subject.position).to eq(3)
  end
end
