ops=File.read("input.txt").split("\n")

s=50
n=0
ops.each do |e|
  add=e[1..-1].to_i
  prev=s
  s+=add
  t,s=s.divmod(100)
  t=t.abs
  t-=1 if s==0 && add.positive?
  t-=1 if prev==0 && add.negative?
  t+=1 if s==0
  n+=t
end
p n
