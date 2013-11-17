class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  RADIUS = 10

  class << self
    # This is faster than checking whether a profile
    # is within a circle, so do this to get the
    # records, then test for being within the circle
    # later. Performance and all.
    def in_square_area(x, y)
      where("xcoord <= #{x + RADIUS}").
        where("ycoord <= #{y + RADIUS}").
        where("xcoord >= #{x - RADIUS}").
        where("ycoord >= #{y - RADIUS}")
    end
  end

  # Check if a profile is closely related enough to
  # be considerd a match
  def match?(profile)
    within_circle?(profile.xcoord, profile.ycoord)
  end

  def match_percentage(profile)
    # hypotenuse before sqrt
    square_hyp = profile.xcoord**2 + profile.ycoord**2
    distance = Math.sqrt(square_hyp)
    distance.to_f/RADIUS.to_f
  end

  def coords
    return @coords unless @coords.nil?
    @coords = calculate_coords!
  end

  def calculate_coords!
    xval = 0
    yval = 0
    xdivisor = answers.xaxis.count
    ydivisor = answers.yaxis.count

    answers.each do |answer|
      coord = answer.value
      axis = answer.axis
      
      if axis == 0
        xval += coord 
      elsif axis == 1
        yval += coord
      else
        raise "Unrecognized axis while calculatig coordinates for profile #{id}"
      end
    end

    unless xdivisor == 0
      self.xcoord = xval/xdivisor 
    else
      self.xcoord = 0
    end

    unless ydivisor == 0
      self.ycoord = yval/ydivisor
    else
      self.ycoord = 0
    end

    unless save!
      raise "Couldn't save coordinates for profile #{id}"
    end

    [self.xcoord,self.ycoord]
  end

  private

  def within_circle(x, y)
    (x - self.xcoord)**2 + (y - self.ycoord)**2 < RADIUS**2
  end

end
