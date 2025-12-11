g={}
File.readlines("input.txt",chomp:true).each do |l|
  a=l.split(/[:]? /)
  g[a.shift]=a
end
g.default=[]
f=->(n,e,m={}) {n==e ? 1 : (m[n] ||= g[n].sum{|c| f[c,e,m]})}

p f['svr','fft',{}]*f['fft','dac',{}]*f['dac','out',{}]+f['svr','dac',{}]*f['dac','fft',{}]*f['fft','out',{}]
