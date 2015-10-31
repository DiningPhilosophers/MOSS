# Add a declarative step here for populating the DB with movies.

Given /the following visitors exist/ do |visitor_table|
  visitor_table.hashes.each do |visitor|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that visitor to the database here.

    # create visitor in the database
    Visitor.create(visitor)
  end
  #fail "Unimplemented"
end

Given /the following groups exist/ do |group_table|
  group_table.hashes.each do |group|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that visitor to the database here.

    # create visitor in the database
    Group.create(group)
  end
  #fail "Unimplemented"
end

Given /the following zipcodes exist/ do |zipcode_table|
  zipcode_table.hashes.each do |zipcode|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that visitor to the database here.

    # create visitor in the database
    Zipcode.create(zipcode)
  end
  #fail "Unimplemented"
end

Given /the following countries exist/ do |country_table|
  country_table.hashes.each do |country|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that visitor to the database here.

    # create visitor in the database
    Country.create(country)
  end
  #fail "Unimplemented"
end

Given /the following admins exist/ do |admin_table|

  admin_table.hashes.each do |admin|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that visitor to the database here.

    # create visitor in the database
    Admin.create(admin)
  end
  #fail "Unimplemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.

  # the page source code contains string e1 before string e2
  page.body.should =~ /#{e1}.*#{e2}/m

  #fail "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb

  # split the ratings to the array
  rating_list = rating_list.split(', ')

  if uncheck then
    # uncheck each rating
    rating_list.each { |rating|
      uncheck("ratings_#{rating}")
    }
  else
    # check each rating
    rating_list.each { |rating|
      check("ratings_#{rating}")
    }
  end

  #fail "Unimplemented"
end

# This is used for clicking of JavaScript buttons
When /^(?:|I )click on "([^"]*)"$/ do |selector|
  click_on selector
end

Given /^(?:|I ) go to (the)? (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /I should see all the visitors/ do
  # Make sure that all the movies in the app are visible in the table

  # count the number of movies in the database
  number_of_visitors = Visitor.count

  # count number of rows in the movies table displayed
  number_of_rows = page.all('table tbody tr').count

  # those numbers should be the same
  number_of_rows.should == number_of_visitors
  #fail "Unimplemented"
end

Then /the director of "(.*)" should be "(.*)"/ do |title, director|
  Movie.find_by_title(title).director.should == director
end

Then /I should see country with ID "(.*)"/ do |country_id|
  country_name = Country.find_by_id(country_id).name

  if page.respond_to? :should
    page.should have_content(country_name)
  else
    assert page.has_content?(country_name)
  end
end