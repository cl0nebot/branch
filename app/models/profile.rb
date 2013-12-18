class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  has_attached_file :avatar, styles: { 
    medium: "140x140#",
    thumb: "30x30#",
    feed: "64x64#"
  }, default_url: "/images/profile/:style/avatar-blank.jpg"

  RADIUS = 100

  class << self
    # This is faster than checking whether a profile
    # is within a circle, so do this to get the
    # records, then test for being within the circle
    # later. Performance and all.
    def in_cube_area(x, y, z)
      where{
        (xcoord <= my{x + RADIUS}) & 
        (ycoord <= my{y + RADIUS}) &
        (zcoord <= my{z + RADIUS}) &
        (xcoord >= my{x - RADIUS}) &
        (ycoord >= my{y - RADIUS}) &
        (zcoord >= my{z - RADIUS}) }
    end
  end

  # Check if a profile is closely related enough to
  # be considerd a match
  def match?(profile)
    within_sphere?(profile.xcoord, profile.ycoord, profile.zcoord)
  end

  def match_percentage(profile)
    # hypotenuse before sqrt
    square_hyp = (profile.xcoord-self.xcoord)**2 +
      (profile.ycoord-self.ycoord)**2 +
      (profile.zcoord-self.zcoord)**2

    distance = Math.sqrt(square_hyp)

    (max_distance-distance)/max_distance
  end

  def coords
    return @coords unless @coords.nil?
    @coords = calculate_coords!
  end

  def calculate_coords!
    xval = 0
    yval = 0
    zval = 0
    xdivisor = answers.xaxis.count
    ydivisor = answers.yaxis.count
    zdivisor = answers.zaxis.count

    answers.each do |answer|
      coord = answer.value
      axis = answer.axis
      
      if axis == 0
        xval += coord 
      elsif axis == 1
        yval += coord
      elsif axis == 2
        zval += coord
      else
        raise "Unrecognized axis while calculatig coordinates for profile #{id}: #{axis}"
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

    unless zdivisor == 0
      self.zcoord = zval/zdivisor
    else
      self.zcoord = 0
    end

    unless save!
      raise "Couldn't save coordinates for profile #{id}"
    end

    [self.xcoord,self.ycoord,self.zcoord]
  end

  private

  def within_sphere?(x, y)
    (x - self.xcoord)**2 + (y - self.ycoord)**2 + (z - self.zcoord)**2 < RADIUS**2
  end

  def max_distance
    @max_distance ||= Math.sqrt((200**2)*3)
  end

end
