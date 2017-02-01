mem.text = "0123456789 abcdefghijklmnopqrstuvwxyz"

-- mem.pos = nil

-- Pattern of the current line
mem.digit = {}
mem.digit["0"] = {a = true, b = true, c = true}
mem.digit["1"] = {a = false, b = true, c = false}
mem.digit["2"] = {a = true, b = true, c = true} 
mem.digit["3"] = {a = true, b = true, c = true}
mem.digit["4"] = {a = true, b = false, c = false}
mem.digit["5"] = {a = true, b = true, c = true}
mem.digit["6"] = {a = true, b = true, c = true}
mem.digit["7"] = {a = true, b = false, c = false}
mem.digit["8"] = {a = true, b = true, c = true}
mem.digit["9"] = {a = true, b = true, c = true}
mem.digit[" "] = {a = false, b = false, c = false}
mem.digit["A"] = {a = true, b = false, c = true}
mem.digit["B"] = {a = false, b = true, c = true}
mem.digit["C"] = {a = false, b = true, c = false}
mem.digit["D"] = {a = false, b = true, c = true}
mem.digit["E"] = {a = true, b = true, c = true}
mem.digit["F"] = {a = false, b = false, c = true}
mem.digit["G"] = {a = false, b = true, c = true}
mem.digit["H"] = {a = true, b = false, c = true}
mem.digit["I"] = {a = false, b = true, c = false}
mem.digit["J"] = {a = true, b = true, c = true}
mem.digit["K"] = {a = true, b = false, c = true}
mem.digit["L"] = {a = true, b = true, c = true}
mem.digit["M"] = {a = true, b = false, c = true}
mem.digit["N"] = {a = true, b = false, c = true}
mem.digit["O"] = {a = false, b = true, c = false}
mem.digit["P"] = {a = false, b = false, c = true}
mem.digit["Q"] = {a = true, b =false, c = false}
mem.digit["R"] = {a = true, b = false, c = true}
mem.digit["S"] = {a = false, b = true, c = true}
mem.digit["T"] = {a = false, b = true, c = false}
mem.digit["U"] = {a = true, b = true, c = true}
mem.digit["V"] = {a = false, b = true, c = false}
mem.digit["W"] = {a = true, b = false, c = true}
mem.digit["X"] = {a = true, b = false, c = true}
mem.digit["Y"] = {a = false, b = true, c = false}
mem.digit["Z"] = {a = true, b = true, c = true}

if(pin.d) then  -- Signal from Button?
  
  if(mem.pos == nil) then  -- Running through all chars
    mem.pos = 1                -- Start again with the first char

  end

  char = string.sub(mem.text, mem.pos, mem.pos)  
  -- Calculate the Character from the String mem.text and write it to char

  port.a = mem.digit[string.upper(char)].a  -- take the Pattern from the Array
  port.b = mem.digit[string.upper(char)].b
  port.c = mem.digit[string.upper(char)].c
  -- if you have to mirror the Display, then swap port.c with port.a and maybe you have to swap port.d with port.b

  mem.pos = mem.pos + 1 
  -- set to next Character

  if(mem.pos > string.len(mem.text)) then -- was it the last Character of the String?
    mem.pos = nil
    -- yes, then reset the Counter

  end

end