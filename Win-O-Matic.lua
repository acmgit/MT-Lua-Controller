--mem.running = 0  -- Reset the Machine
mem.duration = 2 -- How long to "calculate"?
mem.chance = 4 -- Chance to win

if(event.type == "interrupt" and event.iid == "Calculating" and mem.running == 1) then

  mem.running = 0
  interrupt(0, "Calculating") -- Delete Interrupt
  port.c, port.d, port.a, port.b = false  -- Turn off the lights

  rnd1 = math.floor(math.random(1,mem.chance))  -- Get a Random-Number
  rnd2 = os.datetable() -- Take the Seconds
  rnd2 = math.floor(rnd2.sec % mem.chance) + 1 -- and calculate the Modulo of 4, +1 and you don't get 0 but 4 too

  if(rnd1 == rnd2) then -- Both Number are equal, you've won
    port.b = true  -- Green Light is on, Injector transports a Item

  else
    port.a = true -- You lose, Red light is on

  end

elseif (pin.c) then -- Switch on?
  interrupt(mem.duration, "Calculating") -- Simulate calculating Prozess
  mem.running = 1
  port.d = true -- Maschine is calculating (Grey Light)
  port.b, port.a = false -- Turn off Win and Lose-Light

end