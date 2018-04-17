
Transform /^#{CUSTOMER}$/ do |customer|
  "a transformed customer"
end

Transform /^an? customer$/ do |customer|
  "a transformed customer"
end

Transform /^the customer$/ do |customer|
  "the transformed customer"
end

Transform /^(#{ORDER}) customer$/ do |order|
  "#{order} customer"
end

Transform /^#{TEDDY_BEAR}$/ do |teddy|
  "the tranformed teddy bear"
end

#
# This is a complicated Transform with a comment
#
Transform /^((?:\d{1,2}[\/-]){2}(?:\d\d){1,2})?\s*(\w{3})?\s*(\d{1,2}:\d{2}\s*(?:AM|PM)?)$/ do |date,day,time|
  "#{date} #{day} #{time}"
end

#
# Assign a trnasform to a variable to be interpolated later in a step definition
#
SUBSTITUTED_FILE = Transform(/^file '([^']*)'$/) do |filepath|
  "Contents loaded from file"
end 

Given /^that (#{CUSTOMER}) is a valid customer$/ do |customer|
  pending "Customer #{customer} validation"  
end

#
# This comment will likely blow {things up}!
#
When /^a customer logs in as username '([^']+)' with password '([^']+)'$/ do |username,password|
  Given "that the customer is a valid customer"
  pending "Customer logs in with #{username} and #{password}"
end

Then /^I expect them to have logged in (successfully|miserably)$/ do |success|
  pending "Validation that the customer has logged in #{success}"
end

When /^the customer logs out$/ do
  pending
end

Then /^I expect the customer to be shown the logout page$/ do 
  pending
end

And /^this (third) defined step definition$/ do |number|
  pending
end

And /^the customer has the following details:$/ do |table|
  pending "Table of data #{table.hashes}"
end

And /^edits their the (biography) to state:$/ do |section,text|
  pending "text_field not present for #{section} #{bio} for this release"
end

Then /I expect (#{CUSTOMER}) to be a member of the '([^']+)' group/ do |customer,product|
  pending "Customer #{customer} with product #{product}"
end

#
# Complicated step definition with optional parameters
#
Given /^(?:I create )?an? (?:(active|deactive|inactive|simulated)d?)? ?project(?:[\s,]*(?:with)? ?(?:an?|the)? (?:(?:the size? (?:at|of)? ?(\d+)|named? (?:of )?'([^']+)'|start date (?:of )?((?:(?:\d{1,2}[\/-]){2}(?:\d\d){1,2}))|end date (?:of )?((?:(?:\d{1,2}[\/-]){2}(?:\d\d){1,2}))|user range (?:of )?(\d+-\d+)|description (?:of )?'([^']+)'|nicknamed? (?:of )?'([^']+)')[,\s]*)* ?)?$/ do |state,size,name,start_date,end_date,user_range,description,nickname|
  pending "#{state} #{size} #{name} #{start_date} #{end_date} #{user_range} #{description} #{nickname}"
end


#
# The highlighting replacement uses a span which had trouble when blindly using
# a gsub replacement.
#
Given /(a|\d+) ducks? that ha(?:s|ve) (a|\d+) bills?/ do |duck_count,bills_count|
  pending
end

Then /I expect the (duck|bird) to (\w+)/ do |animal,verb|
  pending
end

#
# This double-quoted step definition caused some problems when being rendered
#
When /^searching the log for the exact match of the message "([^"]+)"$/ do |message|
  pending message
end

#
#
#
When /^the step definition has HTML escaped characters like: "([^"]+)"$/ do |characters|
  pending characters
end

#
# Step using interpolated transform to replace file reference with contents of file
#
Then /^the (#{SUBSTITUTED_FILE}) will be replaced with the file contents$/ do |content|
  pending "File contained #{content}"
end

#
# Some details about the helper method that might be picked up in the documentation.
#
def a_helper_method
  puts "performs some operation"
end

#
# This is a block used in multiple steps 
#
saySomething = Proc.new do |something|
   puts something
end

#
# Engligh step say something
#
When /^say ([^$]*)$/, saySomething

#
# Spanish step fo say something
#
When /^di ([^$]*)$/, saySomething

#
# French step fo say something
#
When /^dis ([^$]*)$/, saySomething
