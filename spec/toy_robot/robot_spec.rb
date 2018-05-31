require 'spec_helper'

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
