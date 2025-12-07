l=File.readlines("input.txt").map {|l| l.chomp.split("")}
ops=l.pop
cols=l.transpose
sep_idx=cols.each_index.select {|i| cols[i].all?(" ")}
sep_idx=[-1]+sep_idx+[cols.size]
s=0
(sep_idx.size-1).times do |i|
  left=sep_idx[i]+1
  right=sep_idx[i+1]
  next if left>=right
  n=[]
  (left...right).each do |cidx|
    digits=cols[cidx].reject {|d| d==" "}
    n<<digits.join.to_i if !digits.empty?
  end
  op=nil
  (left...right).each do |cidx|
    if ops[cidx] && ops[cidx] != " "
      op=ops[cidx]
      break
    end
  end
  if n.size>0 && op && op != " "
    res=n.reduce(op.to_sym)
    s+=res
  end
end
p s
