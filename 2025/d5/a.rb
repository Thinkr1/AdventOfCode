ranges=File.readlines("input.txt").join("").split("\n\n").first
l=ranges.split("\n").reject(&:empty?)
ranges=l.map do |line|
  left,right=line.scan(/(\d+)-(\d+)/).flatten.map(&:to_i)
  [left,right]
end
sorted=ranges.sort_by{|li,_r| li}
t=0
curl,curr=sorted.first
sorted.drop(1).each do |le,ri|
  if le<=curr+1
    curr=[curr,ri].max
  else
    t+=curr-curl+1
    curl,curr=le,ri
  end
end
t+=curr-curl+1
p t
