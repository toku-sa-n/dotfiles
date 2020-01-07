#!/usr/bin/env ruby
# frozen_string_literal: true

class GitRepository
  def initialize(path)
    @path = path

    Dir.chdir(path) do
      git_status = `git status -sb`
      @need_to_commit = git_status.lines.count > 1
      @need_to_push = if git_status =~ /\[ahead [0-9]+\]/
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

  def path
    @path.gsub(/#{ENV['HOME']}/, '~')
  end
end

def print_git_status(repositories, push_or_commit, color)
  print "<span color=\"##{color}\">Need to #{push_or_commit}: "
  location_msg = ''
  repositories.each do |repository|
    location_msg += repository.path + ', '
  end
  # [0...-2] is intended to delete the last of ', '
  print location_msg[0...-2]
  print '</span> '
end

def main
  need_to_commit = []
  need_to_push = []

  `git config --global remind.paths`.chomp.split(',').each do |path|
    git_repository = GitRepository.new(path)
    if git_repository.need_to_push?
      need_to_push << git_repository
    elsif git_repository.need_to_commit?
      need_to_commit << git_repository
    end
  end

  print_git_status(need_to_commit, 'commit', 'ff9900') unless need_to_commit.empty?
  print_git_status(need_to_push, 'push', 'ff0000') unless need_to_push.empty?
end

main
