require_relative 'main_methods'

module SourceModule
  include MainMethods

  def source_list
    if @sources.empty?
      puts Rainbow("\n No Source entered yet.").red.bright
      puts Rainbow(' -----------------------').red.bright
    else
      puts Rainbow("\n List of all sources:\n").aqua.bright.underline
      @sources.each_with_index do |source, index|
        puts Rainbow(" #{index + 1}. #{source.name}").white.bright
        puts Rainbow("_______________________________________\n").aqua.bright
      end
    end
  end
end
