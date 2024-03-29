# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

# Takes in an id
def find(id)
  # Returns the candidate with that :id
  for candidate in @candidates
    if candidate[:id] == id
      return true
    end
  end
  # If there is no candidate with that id, it naturally returns nil
  nil
end

# Takes in a single candidate (hash). Note: not the array.
def experienced?(candidate)
  # Returns true if the candidate has 2 years of experience or more
  if candidate[:years_of_experience] >= 2
    return true
  end
  # Returns false otherwise
  false
end

# Takes in the collection of candidates
def qualified_candidates(candidates)
  qualifiers = []
  # Returns a subset of the candidates that meet the following criteria:
  # Are experienced
  # Have 100 or more Github points
  # Know at least Ruby or Python
  # Applied in the last 15 days
  # Are over the age of 17 (18+)
  for candidate in candidates
    if experienced?(candidate) && 
      find_greater_than(candidate[:github_points], 100) && 
      find_greater_than(candidate[:age], 18) && 
      find_less_than(Time.now.to_date - candidate[:date_applied], 15) &&
      required_languages(candidate[:languages])
      qualifiers.push(candidate)
    end
  end
    qualifiers
end

# Takes in a collection of candidates
def ordered_by_qualifications(candidates)
# Instead of filtering on the candidates, returns them all back but reordered such that:
# Candidates with the most experience are at the top
# For Candidates that have the same years of experience, they are further sorted by their number of Github points (highest first)
  candidates.sort_by! {|candidate| [candidate[:years_of_experience], candidate[:github_points]]}
  candidates.reverse!
end


# Helper Methods

def find_greater_than(candidate_statistic, requirement_value)
  candidate_statistic >= requirement_value
end

def find_less_than(candidate_statistic, requirement_value)
  candidate_statistic <= requirement_value
end

def required_languages(language_array)
  language_array.include?('Ruby') || language_array.include?('Python')
end