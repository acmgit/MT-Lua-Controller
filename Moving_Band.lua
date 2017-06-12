light = {}

light[0] = {a = true, b = false, c = false}
light[1] = {a = false, b = true, c = false}
light[2] = {a = false, b = false, c = true}

interrupt(1, "Work")

if(event.type == "interrupt" and event.iid == "Work") then

  time = os.datetable() -- Get Systemtime
  time = time.sec -- Get current Second
  step = time % 3 -- take 0, 1 or  2

  port.a = light[step].a
  port.b = light[step].b
  port.d = light[step].c

end
