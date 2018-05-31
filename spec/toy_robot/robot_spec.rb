require 'spec_helper'

context 'when facing north' do
  subject { ToyRobot::Robot.new(0, 0, "NORTH") }                       #=> Given

  it 'moves north' do
    subject.move                                                       #=> When
    expect(subject.north).to eq(1)                                     #=> Then
  end
end

context 'when facing south' do
  subject { ToyRobot::Robot.new(0, 0, "SOUTH") }                       #=> Given

  it 'moves south' do
    subject.move                                                       #=> When
    expect(subject.north).to eq(-1)                                    #=> Then
  end
end

context 'when facing east' do
  subject { ToyRobot::Robot.new(0, 0, "EAST") }                        #=> Given

  it 'moves east' do
    subject.move                                                       #=> When
    expect(subject.east).to eq(1)                                      #=> Then
  end
end

context 'when facing west' do
  subject { ToyRobot::Robot.new(0, 0, "WEST") }                        #=> Given

  it 'moves west' do
    subject.move                                                       #=> When
    expect(subject.east).to eq(-1)                                     #=> Then
  end
end



#We've refered to the Robot class under the ToyRobot module as our application is called ToyRobot.
#And the container for the robot logic is going to be the Robot class.
describe ToyRobot::Robot do
  subject { ToyRobot::Robot.new(0) }                                   #=> Given

  it 'moves 3 spaces east' do
    3.times { subject.move_east}                                       #=> When

    expect(subject.east).to eq(3)                                      #=> Then
  end

  it 'moves 4 spaces east' do
    4.times { subject.move_east}                                       #=> When

    expect(subject.east).to eq(4)                                      #=> Then
  end

  it 'moves 3 spaces west' do
    3.times { subject.move_west}                                       #=> When

    expect(subject.east).to eq(-3)                                     #=> Then
  end

  it 'moves 4 spaces west' do
    4.times { subject.move_west}                                       #=> When

    expect(subject.east).to eq(-4)                                     #=> Then
  end

  it 'moves 3 spaces north' do
    3.times { subject.move_north}                                      #=> When

    expect(subject.north).to eq(3)                                     #=> Then
  end

  it 'moves 4 spaces east' do
    4.times { subject.move_north}                                      #=> When

    expect(subject.north).to eq(4)                                     #=> Then
  end

  it 'moves 3 spaces south' do
    3.times { subject.move_south}                                      #=> When

    expect(subject.north).to eq(-3)                                    #=> Then
  end

  it 'moves 4 spaces south' do
    4.times { subject.move_south}                                      #=> When

    expect(subject.north).to eq(-4)                                    #=> Then
  end
end
