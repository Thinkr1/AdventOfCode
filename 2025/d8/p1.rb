jbx=File.readlines("input.txt", chomp:true).map {|l| l.split(",").map(&:to_f)}
n=jbx.size
parent=(0...n).to_a
size=Array.new(n,1)
find=->x{
  while parent[x] != x
    parent[x]=parent[parent[x]]
    x=parent[x]
  end
x}

union=->(a,b){
  ra=find.call(a)
  rb=find.call(b)
  return false if ra==rb
  if size[ra]<size[rb]
    ra,rb=rb,ra
  end
  parent[rb]=ra
  size[ra]+=size[rb]
  true
}
edges=[]
(0...n).each do |i|
  ((i+1)...n).each do |j|
    dx=jbx[i][0]-jbx[j][0]
    dy=jbx[i][1]-jbx[j][1]
    dz=jbx[i][2]-jbx[j][2]
    edges<<[Math.sqrt(dx*dx+dy*dy+dz*dz),i,j]
  end
end
edges.sort_by!(&:first)
processed=0
edges.each do |_,i,j|
  break if processed==1000
  union.call(i,j)
  processed+=1
end
c=Hash.new(0)
(0...n).each {|i| c[find.call(i)]+=1}
top=c.values.sort.reverse.first(3)
p top.join(", ")
p top.reduce(1,:*)
