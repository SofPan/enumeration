# This is the main entrypoint into the program
# It requires the other files/gems that it needs
require 'pp'
require './candidates'
require './filters'

## Your test code can go here

pp @candidates
pp experienced?(@candidates[0]) # => true
pp experienced?(@candidates[1]) # => false
pp find(5) # => true
pp find(1) # => nil
pp qualified_candidates(@candidates)
pp ordered_by_qualifications(@candidates)