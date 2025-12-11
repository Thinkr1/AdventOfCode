g={}
File.readlines("input.txt",chomp:true).each do |l|
  a=l.split(/[:]? /)
  g[a.shift]=a
end
g.default=[]
f=->(n,g,m) {m[n] ? m[n] : (m[n]=n =='out' ? 1 : g[n].sum {|c| f.call(c,g,m)})}
p f.call('you',g,{})
