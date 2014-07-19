class Voter
  def initialize(upvotes, downvotes, created_at = nil)
    @upvotes = upvotes
    @downvotes = downvotes
    @created_at = created_at
  end

  def calculate_heat
    order = Math.log10([score.abs, 1].max)
    sign = score != 0 ? (score/score.abs) : 0
    seconds = epoch_seconds - 1_383_973_200 # seconds since repo was started
    return (order + sign * seconds / 45_000).round(7)
  end


  def calculate_confidence
    return -@downvotes if @upvotes == 0

    n = @upvotes + @downvotes
    z = 1.66485 # 1.0 = 85%, 1.6 = 95%
    phat = @upvotes.to_f/ n.to_f

    return (phat+z**2/(2*n)-z*Math.sqrt((phat*(1-phat)+z**2/(4*n))/n))/(1+z**2/n)
  end


  private

  def epoch_seconds
    return (@created_at - Time.at(0)).seconds
  end

  def score
    return @upvotes - @downvotes
  end
end
