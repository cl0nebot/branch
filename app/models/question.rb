class Question < ActiveRecord::Base
  has_many :answers

  HORIZONTAL = 0 # x
  VERTICAL = 1 # y
  LATERAL = 2 # z

  RIGHTWING = 1
  LEFTWING = -1

  AUTHORITARIAN = 1
  LIBERTARIAN = -1

  CONSERVATIVE = 1
  PROGRESSIVE = -1

  def is_horizontal?
    type == HORZONTAL
  end

  def is_vertical?
    type == VERTICAL
  end

  def is_lateral?
    type == LATERAL
  end

  def axis
    return :xcoord if is_horizontal?
    return :ycoord if is_vertical?
    return :zcoord
  end

  def is_leftwing?
    type == HORIZONTAL && parity == LEFTWING
  end

  def is_rightwing?
    type == HORIZONTAL && parity == RIGHTWING
  end

  def is_authoritarian?
    type == VERTICAL && parity == AUTHORITARIAN
  end

  def is_libertarian?
    type == VERTICAL && parity == LIBERTARIAN
  end

  def is_conservative?
    type == LATERAL && parity == CONSERVATIVE
  end

  def is_progressive?
    type == LATERAL && parity == PROGRESSIVE
  end
end
