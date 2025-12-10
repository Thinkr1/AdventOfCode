res=File.readlines("input.txt", chomp:true).map do |l|
  lights=l[/\[([.#]+)\]/,1].chars.map {|c| c=='#' ? 1 : 0}
  btns=l.scan(/\(([0-9,]+)\)/).map {|b| b[0].split(',').map(&:to_i)}
  target=lights.each_with_index.sum {|v,i| v<<i}
  (0...(1<<btns.size)).map do |m|
    state=0
    press=0
    btns.each_with_index do |b,j|
      if m[j]==1
        b.each {|i| state ^= (1<<i)}
        press+=1
      end
    end
    state==target ? press : Float::INFINITY
  end.min
end
p res.sum
