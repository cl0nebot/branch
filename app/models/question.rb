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
    axis == HORZONTAL
  end

  def is_vertical?
    axis == VERTICAL
  end

  def is_lateral?
    axis == LATERAL
  end

  def is_leftwing?
    axis == HORIZONTAL && parity == LEFTWING
  end

  def is_rightwing?
    axis == HORIZONTAL && parity == RIGHTWING
  end

  def is_authoritarian?
    axis == VERTICAL && parity == AUTHORITARIAN
  end

  def is_libertarian?
    axis == VERTICAL && parity == LIBERTARIAN
  end

  def is_conservative?
    axis == LATERAL && parity == CONSERVATIVE
  end

  def is_progressive?
    axis == LATERAL && parity == PROGRESSIVE
  end
end
