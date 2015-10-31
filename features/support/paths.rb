# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

      when /^(the)? home\s?page$/ then '/'
      when /^visitors? statistics? page$/ then '/visitors_statistics/show'
      when /^log\s?in page$/ then '/login'
      when /^(the)? visitors? index\s?page$/ then '/visitors'
      # when /^the (.*) page for "(.*)"$/
      #   movie = Movie.find_by_title($2)
      #
      #   if $1 == 'edit' then
      #     edit_movie_path(movie)
      #   elsif $1 == 'details' then
      #     movie_path(movie)
      #   elsif $1 == 'Similar Movies' then
      #     director_path(movie)
      #   else
      #     raise "Unsupported page #{$1} for #{$2}"
      #   end

      else
        begin
          page_name =~ /^the (.*) page$/
          path_components = $1.split(/\s+/)
          self.send(path_components.push('path').join('_').to_sym)
        rescue NoMethodError, ArgumentError
          raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
                    "Now, go and add a mapping in #{__FILE__}"
        end
    end
  end
end

World(NavigationHelpers)