pts=File.readlines("input.txt").map do |l|
  l.strip!
  next if l.empty?
  r,c=l.split(",").map(&:to_i)
  [r,c]
end.compact

n=pts.size
segs=[]
(0...n).each do |i|
  r1,c1=pts[i]
  r2,c2=pts[(i+1)%n]
  t=[r1,r2].min
  b=[r1,r2].max
  l=[c1,c2].min
  r=[c1,c2].max
  segs<<[t,l,b,r]
end

def collide(a,b)
  at,al,ab,ar=a
  bt,bl,bb,br=b
  !(ar<=bl || al>=br || ab<=bt || at>=bb)
end

rects=[]
pts.each do |p1|
  pts.each do |p2|
    r1,c1=p1
    r2,c2=p2
    t=[r1,r2].min
    b=[r1,r2].max
    l=[c1,c2].min
    r=[c1,c2].max
    rects<<[t,l,b,r,(b-t+1)*(r-l+1)]
  end
end
rects.sort_by!{|_,_,_,_,a|-a}

rects.each do |rect|
  t,l,b,r,a=rect
  valid=true
  segs.each do |seg|
    if collide([t,l,b,r],seg)
      valid=false
      break
    end
  end
  if valid
    p a
    break
  end
end
