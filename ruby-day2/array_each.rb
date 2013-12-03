# Print the contents of an array of sixteen numbers, four numbers at a
# time, using just each. 

arr = (1..16).to_a

count = 0;
arr.each do |n| 
  count += 1
  print "#{n} "
  print "\n" if count % 4 == 0
end

# Now, do the same with each_slice in Enumerable.
arr.each_slice(4) do |a| 
  a.each {|n| print "#{n} "}
  print "\n"
end
