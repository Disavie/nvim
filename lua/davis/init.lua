require("davis.set")
require("davis.remap")
require("davis.lazy_init")



-- Function to check if it's time to run ColorMyPencils
function Check_time()
  local current_time = os.date("*t") -- Get the current time
  local hour = current_time.hour

  -- light mode between 9am and 6pm 
  if (hour > 6 and hour < 18) then
    vim.cmd.colorscheme("dawnfox")
    vim.o.background = "light"
  else
    vim.cmd.colorscheme("brightburn")
    vim.o.background = "dark"
  end
end

-- Function to set up the periodic timer
function Schedule_check()
  vim.defer_fn(function()
    Check_time()
    Schedule_check() -- Schedule the next check
  end, 60000) -- Check every minute (60000 milliseconds)
end

-- Start the timer
Check_time()
Schedule_check()
 
