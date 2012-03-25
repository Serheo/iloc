# Sort localization lines in files
# Files format *.strings 
# Lines format /^\"[a-zA-Z0-9]+\"\s{,2}=\s{,2}\".+\";$/ Ex: "Day" = "День";
# Other files and format will be ingored
# Shatunov S. MIT License. 
# ruby 1.9.2 tested

list = Dir[File.join("./", "*.strings")]
puts "Files found: " + list.to_s 
puts

list.each do |file|
  buffer = Array.new
  unsort = Array.new
  
  File.open(file, 'r') do |f1|  
    while line = f1.gets  
      if (line =~ /^\"[a-zA-Z0-9]+\"\s{,2}=\s{,2}\".+\";/)
        buffer.push line
      else
        unsort.push line
      end 
    end  
  end
  
  buffer = buffer.sort
  
  File.open(file, 'w') do |f1|  
    unsort.each {|line|  f1.write(line)}
    buffer.each {|line|  f1.write(line)}
  end
  
  puts "File " + file
  puts "unsorted:" + unsort.to_s
  puts "Rewrited lines count: " + (unsort.count + buffer.count).to_s
  puts
end

puts "Complete!"
