s=0
inf=-1<<60
File.foreach("input.txt") do |r|
  l=r.chomp
  next if l.size<12
  best=Array.new(13,inf)
  best[0]=0
  l.each_byte do |b|
    d=b-48
    12.downto(1) do |len|
      cand=best[len-1]*10+d
      best[len]=cand if cand>best[len]
    end
  end
  ans=best[12]
  p "best: #{ans}"
  s+=ans
end
p s
