class WordCountController < ApplicationController
  def word_count
    @text = params.fetch("user_text")
    @special_word = params.fetch("user_word")

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================

    @word_count = "Replace this string with your answer"

    @character_count_with_spaces = "Replace this string with your answer"

    @character_count_without_spaces = "Replace this string with your answer"

    @occurrences = "Replace this string with your answer"

    # ================================================================================
    # Your code goes above.
    # ================================================================================

@character_count_with_spaces = @text.length

@character_count_without_spaces = @text.gsub(/\s+/, "").length

@word_count = @text.split.count

@occurrences = @text.downcase.gsub(/[^a-z0-9\s]/i, "").split.count(@special_word)

    render("word_count_templates/word_count.html.erb")
  end

  def word_count_form
    render("word_count_templates/word_count_form.html.erb")
  end
end
