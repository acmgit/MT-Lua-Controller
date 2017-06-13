-- Pattern of the current line
mem.digit = {}

mem.digit[0] = {a = true, b = true, c = true}
mem.digit[1] = {a = false, b = true, c = false}
mem.digit[2] = {a = true, b = true, c = true} 
mem.digit[3] = {a = true, b = true, c = true}
mem.digit[4] = {a = true, b = false, c = true}
mem.digit[5] = {a = true, b = true, c = true}
mem.digit[6] = {a = true, b = true, c = true}
mem.digit[7] = {a = true, b = true, c = true}
mem.digit[8] = {a = true, b = true, c = true}
mem.digit[9] = {a = true, b = true, c = true}

mem.digit[" "] = {a = false, b = false, c = false}

mem.digit["A"] = {a = true, b = true, c = true}
mem.digit["B"] = {a = false, b = true, c = true}
mem.digit["C"] = {a = false, b = true, c = false}
mem.digit["D"] = {a = false, b = true, c = true}
mem.digit["E"] = {a = true, b = true, c = true}
mem.digit["F"] = {a = true, b = true, c = true}
mem.digit["G"] = {a = true, b = true, c = true}
mem.digit["H"] = {a = true, b = false, c = true}
mem.digit["I"] = {a = false, b = true, c = false}
mem.digit["J"] = {a = true, b = false, c = false}
mem.digit["K"] = {a = true, b = false, c = true}
mem.digit["L"] = {a = false, b = false, c = true}
mem.digit["M"] = {a = true, b = false, c = true}
mem.digit["N"] = {a = true, b = false, c = true}
mem.digit["O"] = {a = false, b = true, c = false}
mem.digit["P"] = {a = false, b = true, c = true}
mem.digit["Q"] = {a = false, b =true, c = false}
mem.digit["R"] = {a = false, b = true, c = true}
mem.digit["S"] = {a = true, b = true, c = false}
mem.digit["T"] = {a = true, b = true, c = true}
mem.digit["U"] = {a = true, b = false, c = true}
mem.digit["V"] = {a = true, b = false, c = true}
mem.digit["W"] = {a = true, b = false, c = true}
mem.digit["X"] = {a = true, b = false, c = true}
mem.digit["Y"] = {a = true, b = false, c = true}
mem.digit["Z"] = {a = true, b = true, c = true}

mem.digit["+"] = {a = false, b = false, c = false}
mem.digit["-"] = {a = false, b = false, c = false}
mem.digit["'"] = {a = false, b = true, c = false}
mem.digit[")"] = {a = false, b = true, c = false}
mem.digit["("] = {a = false, b = true, c = false}
mem.digit["."] = {a = false, b = false, c = false}
mem.digit[","] = {a = false, b = false, c = false}
mem.digit[":"] = {a = false, b = false, c = false}
mem.digit["!"] = {a = false, b = true, c = false}
mem.digit["?"] = {a = true, b = true, c = true}
mem.digit["/"] = {a = false, b = false, c = true}
mem.digit["\\"] = {a = true, b = false, c = false}

-- End of Pattern

mem.tz = {}
zones = 4
mem.tz[1] = {hou = 1, min = 00, name = "CET"  } -- MEZ
mem.tz[2] = {hou =  3, min = 30, name = "IRT" } -- IRT
mem.tz[3] = {hou  = 5, min = 30, name = "IST" } -- IST
mem.tz[4] = {hou = 7, min = 0, name = "ICT" }
mem.range = math.floor(60 / zones) -- every x Second change the TZ

interrupt(2, "Clock")

if(event.type == "interrupt" and event.iid == "Clock") then

  -- Get the Time from the Server
  time = os.datetable()

  -- curr_tz = (math.floor(time.sec / mem.range)) + 1 -- get the current Timezone  
  curr_tz = 1

  day_min = time.hour * 60 + time.min -- Calculate the elapsed Minutes
  day_min = day_min - 60 -- Correct to WEZ TZ + 0

  tz_min = mem.tz[curr_tz].hou * 60 + mem.tz[curr_tz].min -- Calculate the Minutes of the current TZ
  day_min = day_min + tz_min -- and add it to the current Time

  if(day_min >= 1440) then  -- 1440 = max. Minutes of a whole Day (24*60)
    day_min = day_min - 1440

  elseif(day_min < 0) then
    day_min = day_min + 1440

  end

  if(day_min == 0) then  -- Division through 0 is not allowed
    time.hour = 0
    time.min = 0

  else
    time.hour = math.floor(day_min / 60)
    time.min = day_min % 60

  end

  -- Get the Minutes under 10 from the Time
   currtime = time.min  % 10

  port.a = mem.digit[currtime].c
  port.d = mem.digit[currtime].b
  port.c = mem.digit[currtime].a

-- if you have to mirror the Display, then swap port.c with port.a and maybe you have to swap port.d with port.b

end