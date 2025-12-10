const fs=require('fs')
const {init}=require('z3-solver')
fs.readFile('input.txt','utf8',async (err,data)=>{
	if(err) throw err
	const ctx=await init()
	const {Optimize,Int} = new ctx.Context()
	let tot=0
	for(const l of data.trim().split('\n')){
		const p=l.split(' ')
		const btns=p.slice(1,-1).map(b=>b.slice(1,-1).split(',').map(Number))
		const targets=p.at(-1).slice(1,-1).split(',').map(Number)
		const solver=new Optimize()
		const vars=btns.map((_,i) => Int.const(`p${i}`))
		vars.forEach(v=>solver.add(v.ge(0)))
		targets.forEach((target,c)=>{
			const s=vars.filter((_,i)=>btns[i].includes(c)).reduce((acc,v)=>acc.add(v), Int.val(0))
			solver.add(s.eq(Int.val(target)))
		})
		
		solver.minimize(vars.reduce((acc,v) => acc.add(v), Int.val(0)))
		if (await solver.check()==='sat') {
			const model=solver.model()
			tot+= +model.eval(vars.reduce((acc,v)=>acc.add(v), Int.val(0))).toString()
		}
	}
	console.log(tot)
})
