#!/usr/bin/ruby

# first split into each line, then split into two elements, status and place.
git_status = `git-remind status -s`.split("\n").map do |status|
  status.split(' ')
end
git_status.each do |status|
  status[1].gsub!(/#{ENV['HOME']}/, '~')
  if status[0] == 'C'
    print '<span color="#ff9900">Need to commit: '
  else
    print '<span color="#ff0000">Need to push: '
  end
  print "#{status[1]}</span> "
end
