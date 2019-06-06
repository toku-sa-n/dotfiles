#!/usr/bin/ruby

# first split into each line, then split into two elements, status and place.
git_status = `git-remind status -s`.split("\n").map do |status|
  status.split(' ')
end
need_to_commit = []
need_to_push = []
git_status.each do |status|
  if status[0] == 'C'
    need_to_commit.push(status[1])
  else
    need_to_push.push(status[1])
  end
end
unless need_to_commit.empty?
  print '<span color="#ff9900">Need to commit: '
  status_msg = ''
  need_to_commit.each do |status|
    status_msg += status + ', '
  end
  # [0...-2] is intended to delete the last of ', '
  print status_msg[0...-2]
  print '</span> '
end

unless need_to_push.empty?
  print '<span color="#ff0000">Need to push: '
  status_msg = ''
  need_to_push.each do |status|
    status_msg += status + ', '
  end
  # [0...-2] is intended to delete the last of ', '
  print status_msg[0...-2]
  print '</span>'
end
