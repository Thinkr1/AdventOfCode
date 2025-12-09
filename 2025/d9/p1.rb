pts=File.readlines("input.txt").map do |l|
  l.strip!
  next if l.empty?
  r,c=l.split(",").map(&:to_i)
  [r,c]
end.compact
max=0
n=pts.size
(0...n-1).each do |i|
  ri,ci=pts[i]
  ((i+1)...n).each do |j|
    rj,cj=pts[j]
    dr=(ri-rj).abs
    dc=(ci-cj).abs
    a=(dr+1)*(dc+1)
    max=a if a>max
  end
end
p max
