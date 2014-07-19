def right_wing(prompt)
  Matcher::Question.create({
    prompt: prompt,
    axis: 0,
    parity: 1
  })
end

def left_wing(prompt)
  Matcher::Question.create({
    prompt: prompt,
    axis: 0,
    parity: -1
  })
end

def authoritarian(prompt)
  Matcher::Question.create({
    prompt: prompt,
    axis: 1,
    parity: 1
  })
end

def libertarian(prompt)
  Matcher::Question.create({
    prompt: prompt,
    axis: 1,
    parity: -1
  })
end

def conservative(prompt)
  Matcher::Question.create({
    prompt: prompt,
    axis: 2,
    parity: 1
  })
end

def progressive(prompt)
  Matcher::Question.create({
    prompt: prompt,
    axis: 2,
    parity: -1
  })
end

namespace :matcher do
  namespace :questions do

    desc "Load up questions for FTUE"
    task :seed => :environment do
      Matcher::Question.delete_all

      right_wing "The free-market will sort it out."
      authoritarian "Government is necessary for national order." 
      conservative "There is one true religion."

      left_wing "Each according to their ability, each according to their need."
      libertarian "The less government in my life, the better."
      progressive "All cultures are equal."

      right_wing "Social programs promote a nanny-state."
      authoritarian "The government should control all industry."
      conservative "The nuclear family is the corner-stone of a strong country."

      left_wing "The workplace should be controlled democratically by its workers."
      libertarian "Power always corrupts."
      progressive "That which happens between two consenting adults is none of my business."
    end
  end
end
