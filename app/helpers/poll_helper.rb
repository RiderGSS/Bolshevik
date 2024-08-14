# frozen_string_literal: true

module PollHelper

  def visualize_poll (koll,full_koll)
    if  koll==0
      summary=0
    else
      summary=  ( koll* 100)/ full_koll
    end


  end
    end

