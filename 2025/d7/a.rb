g=File.read("input.txt").lines.map(&:chomp)
srow=g.index {|r| r.include?("S")}
scol=g[srow].index("S")
beams=[[srow,scol]]
ct=0
until beams.empty?
  nbeams=[]
  beams.each do |r,c|
    r+=1
    next if r>=g.length
    if g[r][c]=="^"
      ct+=1
      nbeams<<[r,c-1] if c>0
      nbeams<<[r,c+1] if c<g[r].length-1
    else
      nbeams<<[r,c]
    end
  end
  beams=nbeams.uniq
end
p ct
