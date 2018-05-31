<pre><code>
$ <b>bundle gem rb_tr_book --mit --test=rspec</b>
Creating gem 'rb_tr_book'...
MIT License enabled in config
Do you want to include a code of conduct in gems you generate?
Codes of conduct can increase contributions to your project by contributors who prefer collaborative, safe spaces. You can read more about the code of conduct at contributor-covenant.org. Having a code of conduct means agreeing to the responsibility of enforcing it, so be sure that you are prepared to do that. Be sure that your email address is specified as a contact in the generated code of conduct so that people know who to contact in case of a violation. For suggestions about how to enforce codes of conduct, see https://bit.ly/coc-enforcement. y/(n): n
      create  rb_tr_book/Gemfile
      create  rb_tr_book/lib/rb_tr_book.rb
      create  rb_tr_book/lib/rb_tr_book/version.rb
      create  rb_tr_book/rb_tr_book.gemspec
      create  rb_tr_book/Rakefile
      create  rb_tr_book/README.md
      create  rb_tr_book/bin/console
      create  rb_tr_book/bin/setup
      create  rb_tr_book/.gitignore
      create  rb_tr_book/.travis.yml
      create  rb_tr_book/.rspec
      create  rb_tr_book/spec/spec_helper.rb
      create  rb_tr_book/spec/rb_tr_book_spec.rb
      create  rb_tr_book/LICENSE.txt
Initializing git repo in /Users/mikaelblomkvist/rb_tr_book
Gem 'rb_tr_book' was successfully created. For more information on making a RubyGem visit https://bundler.io/guides/creating_gem.html
</pre></code>

`toy_robot.gemspec`:
```ruby
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "toy_robot/version"

Gem::Specification.new do |spec|
  spec.name          = "toy_robot"
  spec.version       = ToyRobot::VERSION
  spec.authors       = ["mikaelblomkvist50"]
  spec.email         = ["mikaelblomkvist50@gmail.com"]

  spec.summary       = %q{Toy Robot}
  spec.description   = %q{This is a Toy Robot Gem created by following Ryan Bigg's book.}
  spec.homepage      = "https://github.com/mikaelblomkvist50/rb_tr_book"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
```

Let’s go to a command prompt in the root of our gem and run:
<pre><code>
$ <b> bundle install</b>
Fetching gem metadata from https://rubygems.org/..........
Fetching gem metadata from https://rubygems.org/.
Resolving dependencies...
Fetching rake 10.5.0
Installing rake 10.5.0
Using bundler 1.16.2
Fetching diff-lcs 1.3
Installing diff-lcs 1.3
Fetching rspec-support 3.7.1
Installing rspec-support 3.7.1
Fetching rspec-core 3.7.1
Installing rspec-core 3.7.1
Fetching rspec-expectations 3.7.0
Installing rspec-expectations 3.7.0
Fetching rspec-mocks 3.7.0
Installing rspec-mocks 3.7.0
Fetching rspec 3.7.0
Installing rspec 3.7.0
Using toy_robot 0.1.0 from source at `.`
Bundle complete! 4 Gemfile dependencies, 9 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
</pre></code>

This will install all the dependencies (including RSpec) listed in the gemspec. Then run to test RSpec is working:
<pre><code>
$ <b>rspec spec</b>

ToyRobot
  has a version number
  does something useful (FAILED - 1)

Failures:

  1) ToyRobot does something useful
     Failure/Error: expect(false).to eq(true)

       expected: true
            got: false

       (compared using ==)
     # ./spec/toy_robot_spec.rb:7:in `block (2 levels) in <top (required)>'

Finished in 0.02949 seconds (files took 0.16188 seconds to load)
2 examples, 1 failure

Failed examples:

rspec ./spec/toy_robot_spec.rb:6 # ToyRobot does something useful

</pre></code>

<pre><code>
$ <b>rm -rf spec/toy_robot_spec.rb</b>
$ <b>mkdir spec/toy_robot && touch spec/toy_robot/robot_spec.rb</b>
</pre></code>

`spec/toy_robot/robot_spec.rb`:
```ruby
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
```

Make sure tests are running correctly:
<pre><code>
$ <b>rspec spec</b>

An error occurred while loading ./spec/toy_robot/robot_spec.rb.
Failure/Error:
  describe ToyRobot::Robot do
    subject { ToyRobot::Robot.new(0) }

    it 'moves 3 spaces' do
      3.times { subject.move}

      expect(subject.position).to eq(3)
    end
  end

NameError:
  uninitialized constant ToyRobot::Robot
# ./spec/toy_robot/robot_spec.rb:5:in `<top (required)>'
No examples found.

Finished in 0.0004 seconds (files took 0.11652 seconds to load)
0 examples, 0 failures, 1 error occurred outside of examples
</pre></code>

<pre><code>
$ <b>touch lib/toy_robot/robot.rb</b>
</pre></code>

`lib/toy_robot/robot.rb`:
```ruby
module ToyRobot
  class Robot

  end
end
```

`lib/toy_robot.rb`:
```ruby
require "toy_robot/version"
require "toy_robot/robot"

module ToyRobot
  # Your code goes here...
end
```

<pre><code>
$ <b>rspec spec</b>

An error occurred while loading ./spec/toy_robot/robot_spec.rb.
Failure/Error:
  describe ToyRobot::Robot do
    subject { ToyRobot::Robot.new(0) }

    it 'moves 3 spaces' do
      3.times { subject.move}

      expect(subject.position).to eq(3)
    end
  end

NameError:
  uninitialized constant ToyRobot::Robot
# ./spec/toy_robot/robot_spec.rb:5:in `<top (required)>'
No examples found.

Finished in 0.0004 seconds (files took 0.12578 seconds to load)
0 examples, 0 failures, 1 error occurred outside of examples
</pre></code>

Make sure comment out `config.disable_monkey_patching!` spec/spec_helper:
```ruby
require "bundler/setup"
require "toy_robot"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  # config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
```

<pre><code>
$ <b>rspec spec</b>

An error occurred while loading ./spec/toy_robot/robot_spec.rb.
Failure/Error:
  describe ToyRobot::Robot do
    subject { ToyRobot::Robot.new(0) }

    it 'moves 3 spaces' do
      3.times { subject.move}

      expect(subject.position).to eq(3)
    end
  end

NameError:
  uninitialized constant ToyRobot::Robot
# ./spec/toy_robot/robot_spec.rb:5:in `<top (required)>'
No examples found.

Finished in 0.00045 seconds (files took 0.11973 seconds to load)
0 examples, 0 failures, 1 error occurred outside of examples
</pre></code>
