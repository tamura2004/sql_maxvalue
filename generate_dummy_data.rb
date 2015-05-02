require "csv"

def cha;
  xs = %w(a i u e o)
  ys = %w(k s t n h m r g z d b p)
  ys << ""
  ys.sample + xs.sample
end

def word(n)
  ret = ""
  n.times{ret+=cha}
  ret
end

def name;word(3);end

def color
  %w(red green blue yellow orange pink black white gray purple).sample
end

open("c:/users/tamura/data.csv","w") do |oFile|
  1000000.times do
    oFile.puts [name,rand(100)/10.0,color].to_csv
  end
end

