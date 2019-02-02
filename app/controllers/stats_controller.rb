class StatsController < ApplicationController
  def stats
    @numbers = params.fetch("list_of_numbers").gsub(",", "").split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @maximum - @minimum

    # Median
    # ======

    
    if @count.odd? then
      
  @median= @sorted_numbers[@count/2.round]
  
    elsif
    
  @median= (@sorted_numbers[@count/2.round] + @sorted_numbers[(@count/2.round)-1])/2
  
    end
    
    

    @sum = @numbers.sum

    @mean = @sum/@count

    # Variance
    # ========

variance_vec = []

@numbers.each do |num|
  dif = num - @mean
  sq_dif = dif ** 2
  variance_vec.push(sq_dif)
end

@variance = variance_vec.sum/variance_vec.count

    @standard_deviation = @variance**0.5

    # Mode
    # ====

    @mode = "Replace this string with your answer"
    

@mode = @sorted_numbers.first

@numbers.each do |num|

  if  num == @numbers[1+@numbers.index(num)]
  @mode = num
  end
  
end

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("stats_templates/stats.html.erb")
  end

  def stats_form
    render("stats_templates/stats_form.html.erb")
  end
  
end
