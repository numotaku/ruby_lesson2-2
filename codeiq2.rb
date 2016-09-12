@args = []
i = 0
while line = gets
	ary = line.split("/")
	@args[i] = []
	@args[i][0] = ary[0].to_i
	@args[i][1] = ary[1].to_i
	i += 1
	break if i==2
end
#最大公約数を求めるメソッド
def gcd(a,b)
	a,b=b,a%b while b>0
	a
end
#最大公約数を求める
a=@args[0][1]
b=@args[1][1]
if b>a
	w=a
	a=b
	b=w
end
g=gcd(a,b)
l=g*(a/g)*(b/g)

@args[0][0]=@args[0][0]*l/@args[0][1]
@args[0][1]=l
@args[1][0]=@args[1][0]*l/@args[1][1]
@args[1][1]=l
#分子同士を足す
bunsi=@args[0][0]+@args[1][0]
bunbo=l
#約分する
if bunsi>bunbo
	g=gcd(bunsi,bunbo)
else
	g=gcd(bunbo,bunsi)
end
bunsi=bunsi/g
bunbo=bunbo/g
#答えを表示する
if bunbo==1
	puts bunsi
else
	puts "#{bunsi}/#{bunbo}"
end