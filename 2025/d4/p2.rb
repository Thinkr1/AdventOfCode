DIRS=[[-1,-1],[-1,0],[-1,1],[0,-1],[0,1],[1,-1],[1,0],[1,1]].freeze
def occ(g,r,c)
  rows=g.size
  cols=g[0].size
  ct=0
  DIRS.each do |dr,dc|
    nr=r+dr
    nc=c+dc
    next unless nr.between?(0,rows-1) && nc.between?(0,cols-1)
    ct+=1 if g[nr][nc]=="@"
  end
  ct
end
g=File.readlines("input.txt",chomp:true).map(&:dup)
tot=0
loop do
  changed=false
  ngrid=g.map(&:dup)
  rem=0
  g.each_with_index do |row, r|
    row.chars.each_with_index do |ch,c|
      next if ch=="."
      oc=occ(g,r,c)
      if oc<4
        ngrid[r][c]="."
        changed=true
        rem+=1
      end
    end
  end
  break unless changed
  tot+=rem
  g=ngrid
end
p tot
