class Question < ActiveRecord::Base
  has_many :answers

  HORIZONTAL = 0
  VERTICAL = 1

  RIGHTWING = 1
  LEFTWING = -1

  AUTHORITARIAN = 1
  LIBERTARIAN = -1

  def is_horizontal?
    type == HORZONTAL
  end

  def is_vertical?
    type == VERTICAL
  end

  def axis
    return :xcoord if is_horizontal?
    return :ycoord
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
end
