module Matcher
  class Answer < ActiveRecord::Base
    belongs_to :profile, foreign_key: 'matcher_profile_id'
    belongs_to :question, foreign_key: 'matcher_question_id'

    class << self
      XAXIS = 0
      YAXIS = 1
      ZAXIS = 2

      def xaxis
        where(axis: XAXIS)
      end

      def yaxis
        where(axis: YAXIS)
      end

      def zaxis
        where(axis: ZAXIS)
      end
    end

    def to_coord
      coord = value * question.parity
    end
  end
end
