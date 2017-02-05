speed = 0.2
interrupt(speed, "Scroll")

if(event.type == "interrupt" and event.iid == "Scroll") then
  if(pin.c) then
    port.d = not port.d

  end

else
  port.d = false

end