module manytimespad

export setup, solve

function setup()
  target = b"The key for one time pad should only be used once, otherwise everything is exposed."
  txt1 =   b"This book is largely concerned with Hobbits, and from its pages a reader may discover much of their character"
  txt2 =   b"As for the Hobbits of the Shire, with whom these tales are concerned, in the days of their peace and prosperity"
  txt3 =   b"But so far trouble had not come; and as Mr. Baggins was generous with his money, most people were willing to forgive"
  txt4 =   b"Frodo woke and found himself lying in bed. At first he thought that he had slept late, after a long unpleasant dream"
  txt5 =   b"This tale grew in the telling, until it became a history of the Great War of the Ring"
  txt6 =   b"When Mr. Bilbo Baggins of Bag End announced that he would shortly be celebrating his"
  txt7 =   b"The sun was sinking behind the mountains, and the shadows were deepening in the woods"
  txt8 =   b"Suddenly they came out into the open again and found themselves under a pale evening sky"
  txt9 =   b"The chamber was filled with a soft light; its walls were green and silver and its roof of gold."

  key = b"cjjlsarpowur9ur02iyfc hskfhiwdyrxrbyruiqyrw8233ry8yfehbuwy832ryuewr9274823rxqbyrwieayiwxksgk2874hghj2vtaahsiy82y832f1jhsoo77"
  
  texts = [target, txt1,txt2,txt3,txt4,txt5,txt6,txt7,txt8,txt9]
  ctshex = map(texts[2:end]) do t
      map(⊻, t, key) |> bytes2hex
  end
  ct = map(⊻, target, key)
  (bytes2hex(ct), ctshex, texts)
end

function solve(targethex, ciphertxtshex)
  cts = map(hex2bytes, ciphertxtshex)
  findmessage(hex2bytes(targethex), cts)
end

function findmessage(ct, cts)
  target = guess(ct, cts)
  key = map(⊻, ct, target)
  ps = map(cts) do t
      map(⊻, key, t)
  end
  (target, ps)
end

function guess(ct, cts)
  result = Vector{UInt8}[]
  for t in cts
      push!(result, map(⊻, ct, t))
  end

  newtarget = UInt8[]
  for i in 1:length(ct)
      found = Set{UInt8}()
      for t in result
          if in(t[i], UInt8('A'):UInt8('Z'))
              push!(found, xor(t[i], UInt8(' ')))
          end
      end
      if length(found) == 1
          push!(newtarget, collect(found)[1])
      elseif length(found) > 1
          push!(newtarget, UInt8(' '))
      else
          push!(newtarget, UInt8('*'))            
      end
  end
  newtarget
end

end # module manytimespad
