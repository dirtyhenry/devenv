#!/usr/bin/env ruby
# frozen_string_literal: true

def parse_working_tree_item(str)
  /^(?<X>[ MADRCU\?])(?<Y>[ MADRCU\?])\s(?<PATH>.*)$/m.match(str.rstrip)
end

def supported?(parsed_item)
  return [false, 'item could not be parsed'] if parsed_item.nil?
  return [false, "unsupported X: #{parsed_item[:X]}"] unless parsed_item[:X] == ' '
  return [false, "unsupported Y: #{parsed_item[:Y]}"] unless parsed_item[:Y] == 'M'

  [true, parsed_item[:PATH]]
end

def latest_commit(filename)
  [`git rev-list -1 HEAD #{filename}`.strip, filename]
end

def fixup_script(commit, filename)
  res = <<~SCRIPT
    git add #{filename}
    git commit --fixup #{commit}
  SCRIPT

  res
end

def run(command)
  return if system(command)

  error_message = "Command #{command} failed"
  raise error_message
end

# This will output something like
# XY PATH
# Cf. https://git-scm.com/docs/git-status#_output
working_tree = `git status --porcelain`

working_tree
  .lines
  .map { |item| parse_working_tree_item(item) }
  .map { |item| supported?(item) }
  .select { |item| item[0] == true }
  .map { |item| item[1] }
  .map { |item| latest_commit(item) }
  .map { |item| fixup_script(item[0], item[1]) }
  .each { |item| run(item) }
