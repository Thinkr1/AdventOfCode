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
needed=n-1
added=0
last=nil
edges.each do |dist,i,j|
  break if added==needed
  if union.call(i,j)
    added+=1
    last=[i,j]
  end
end
i,j=last
p (jbx[i][0]*jbx[j][0]).to_i
