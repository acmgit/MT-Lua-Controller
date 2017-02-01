-- Pattern of the current line
digit = {}
digit[0] = {a = true, b = true, c = true}
digit[1] = {a = false, b = true, c = false}
digit[2] = {a = true, b = true, c = true} 
digit[3] = {a = true, b = true, c = true}
digit[4] = {a = false, b = false, c = true}
digit[5] = {a = true, b = true, c = true}
digit[6] = {a = true, b = true, c = true}
digit[7] = {a = false, b = false, c = true}
digit[8] = {a = true, b = true, c = true}
digit[9] = {a = true, b = true, c = true}

interrupt(5, "Clock")

if(event.type == "interrupt" and event.iid == "Clock") then

  -- Get the Time from the Server
  time = os.datetable()

  -- Get the Minutes under 10 from the Time
   currtime = time.min  % 10

  port.c = digit[currtime].c
  port.d = digit[currtime].b
  port.a = digit[currtime].a

-- if you have to mirror the Display, then swap port.c with port.a and maybe you have to swap port.d with port.b
end