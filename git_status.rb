#!/usr/bin/ruby

# first split into each line, then split into two elements, status and place.
raw_git_status = `git-remind status -s`.split("\n").map do |status|
  status.split(' ')
end
git_status = []
raw_git_status.each do |status|
  new_element = {}
  new_element[:status] = status[0]
  new_element[:location] = status[1]
  git_status.push(new_element)
end
need_to_commit = []
need_to_push = []
git_status.each do |status|
  if status[:status] == 'C'
    need_to_commit.push(status)
  else
    need_to_push.push(status)
  end
end
unless need_to_commit.empty?
  print '<span color="#ff9900">Need to commit: '
  status_msg = ''
  need_to_commit.each do |status|
    status_msg += (status[:location]).to_s + ', '
  end
  # [0...-2] is intended to delete the last of ', '
  print status_msg[0...-2].to_s
  print '</span>'
end

unless need_to_push.empty?
  print '<span color="#ffff00">Need to push: '
  status_msg = ''
  need_to_commit.each do |status|
    status_msg += (status[:location]).to_s + ', '
  end
  # [0...-2] is intended to delete the last of ', '
  print status_msg[0...-2].to_s
  print '</span>'
end
