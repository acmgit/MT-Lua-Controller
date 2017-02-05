-- if you use the backslash, you've to write it double, like \\
mem.text = " 0123456789 abcdefghijklmnopqrstuvwxyz .,-+!?()/\\"

--mem.pos = 1             -- Position in the Moving-Text
-- Before you Start the Text for the first time, uncomment the Line above, execute it and then comment the Line again.
mem.direction = -1    -- Direction in which the Moving-Text is running, valid Values are -1 or 1

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

mem.digit["+"] = {a = false, b = false, c = false}
mem.digit["-"] = {a = false, b = false, c = false}
mem.digit["'"] = {a = false, b = false, c = false}
mem.digit[")"] = {a = false, b = true, c = false}
mem.digit["("] = {a = false, b = true, c = false}
mem.digit["."] = {a = false, b = true, c = false}
mem.digit[","] = {a = false, b = true, c = false}
mem.digit[":"] = {a = false, b = false, c = false}
mem.digit["!"] = {a = false, b = true, c = false}
mem.digit["?"] = {a = false, b = true, c = false}
mem.digit["/"] = {a = true, b = false, c = false}
mem.digit["\\"] = {a = false, b = false, c = true}

-- End of Pattern

if(pin.d) then  -- Received a Signal
  mem.pos = mem.pos + mem.direction  -- Next Char of the Text

  if(mem.direction == -1) then  -- Check out of Text
    if(mem.pos < 1) then
      mem.pos = string.len(mem.text)  -- Set the Position at the End of the Text

    elseif(mem.pos > string.len(mem.text)) then
      mem.pos = 1 -- Set the Position at the Start of the Text

    end

  end

  char = string.sub(mem.text, mem.pos, mem.pos) -- Calculate the Char

  -- if you have to mirror the Display, then swap port.c with port.a and maybe you have to swap port.d with port.b
  port.a = mem.digit[string.upper(char)].a  -- take the Pattern from the Array
  port.b = mem.digit[string.upper(char)].b
  port.c = mem.digit[string.upper(char)].c

end