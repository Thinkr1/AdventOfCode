g=File.read("input.txt").lines.map(&:chomp)
srow=g.index {|r| r.include?("S")}
scol=g[srow].index("S")
beams={[srow,scol]=>1}
ct=0
until beams.empty?
  nbeams=Hash.new(0)
  beams.each do |(r,c),paths|
    r+=1
    if r>=g.length
      ct+=paths
      next
    end
    if g[r][c]=="^"
      nbeams[[r,c-1]]+=paths if c>0
      nbeams[[r,c+1]]+=paths if c<g[r].length-1
    else
      nbeams[[r,c]]+=paths
    end
  end
  beams=nbeams
end
p ct
