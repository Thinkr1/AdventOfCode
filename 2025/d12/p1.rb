grps=File.read('input.txt').split("\n\n").map {|g| g.strip.split("\n")}
pres,regions=grps[0...-1],grps[-1]
as=pres.each_with_index.map {|sh,i|
  _id,*lns=sh
  [i,lns.size*lns.first.size]
}.to_h
res=regions.count do |l|
  dims,nums=l.split(': ',2)
  x,y=dims.split('x').map(&:to_i)
  ct=nums.split.map(&:to_i)
  tot=ct.each_with_index.sum {|c,i| c*as.fetch(i,0)}
  tot<=x*y
end
p res
