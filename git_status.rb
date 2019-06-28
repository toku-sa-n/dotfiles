#!/usr/bin/ruby
# frozen_string_literal: true

class GitRepository
  def initialize(path)
    @path = path

    Dir.chdir(path) do
      git_status = `git status -sb`
      @need_to_commit = git_status.lines.count > 1
      @need_to_push = if git_status =~ /\[ahead\] [0-9]+/
                        true
                      else
                        false
                    end
    end
  end

  def need_to_commit?
    @need_to_commit
  end

  def need_to_push?
    @need_to_push
  end

  def show_path
    @path.gsub(/#{ENV['HOME']}/, '~')
  end
end

def print_git_status(locations, push_or_commit, color)
  print "<span color=\"##{color}\">Need to #{push_or_commit}: "
  location_msg = ''
  locations.each do |location|
    location_msg += location + ', '
  end
  # [0...-2] is intended to delete the last of ', '
  print location_msg[0...-2]
  print '</span> '
end

# first split into each line, then split into two elements, status and place.
git_status = `git-remind status -s`.split("\n").map do |status|
  status.split(' ')
end

need_to_commit = []
need_to_push = []
git_status.each do |status|
  status[1].gsub!(/#{ENV['HOME']}/, '~')
  if status[0] == 'C'
    need_to_commit.push(status[1])
  else
    need_to_push.push(status[1])
  end
end

print_git_status(need_to_commit, 'commit', 'ff9900') unless need_to_commit.empty?
print_git_status(need_to_push, 'push', 'ff0000') unless need_to_push.empty?
