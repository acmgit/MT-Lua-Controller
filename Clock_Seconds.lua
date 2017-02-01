interrupt(.5,"Clock")

if(event.type == "interrupt" and event.iid == "Clock") then

 -- Get the Time from the Server
  time = os.datetable()
  currtime = time.sec  % 2

  if(currtime == 1)  then
    port.d = true
    port.b = true

  else
    port.d = false
    port.b = false
  end

end