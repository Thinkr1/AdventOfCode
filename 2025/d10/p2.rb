require 'z3'
tot=0
File.readlines('input.txt',chomp:true).each do |l|
  parts=l.split(' ')
  btns=parts[1..-2].map {|b| b[1..-2].split(',').map(&:to_i)}
  targets=parts[-1][1..-2].split(',').map(&:to_i)
  solver=Z3::Optimize.new
  vars=btns.each_index.map {|i| Z3.Int("p#{i}")}
  vars.each {|v| solver.assert v>=0}

  targets.each_with_index do |target,c|
    affecting=btns.each_with_index.select {|btn,_| btn.include?(c)}.map(&:last)
    if affecting.any?
      s=affecting.map {|i| vars[i]}.inject(:+)
      solver.assert s==target
    end
  end

  totvar=vars.inject(:+)
  solver.minimize totvar
  if solver.satisfiable?
    model=solver.model
    tot+=vars.map {|v| model[v].to_i}.sum
  end
end
p tot
