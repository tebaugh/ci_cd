10.times { puts "This is actually just Ruby" }

user 'tdi' do
  action :create
  comment "Test Driven Infrastructure"
  home "/home/tdi"
  supports :manage_home => true
end

template '/home/tdi/.tdi' do
  action :create
  content 'bogus'
end

