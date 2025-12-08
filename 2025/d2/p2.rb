r=File.read("input.txt").split(",").map {|r| r.split("-").map(&:to_i)}
c=0
r.each do |f,l|
  (f..l).each do |i|
    s=i.to_s
    if s =~ /^(\d+)\1+$/
      c+=i
      p "MATCH: #{i}"
    end
  end
end
p c
