require 'date'

args = ARGV;

def log(args)

  logsLocation  = Dir.home + '/Dropbox/worklog/'
  fileExtension = 'txt'
  separator     = ' - ' 
  dateFormat    = '%Y-%m-%d'
  timeFormat    = '%H:%M:%S'

  message     = args[0]
  currentDate = Time.now.strftime(dateFormat)
  currentTime = Time.now.strftime(timeFormat)

  filePath = logsLocation + currentDate + '.' + fileExtension

  newEntry = currentTime + separator + message
  newFileContent = File.exists?(filePath) ? File.read(filePath)+newEntry : newEntry;

  File.open(filePath,'w+') do |file|
    
    file.puts newFileContent

    successMsgLine1 = 'Log written in ' + filePath
    successMsgLine2 = 'Your log: ' + newEntry
    puts successMsgLine1.colorize(32)
    puts successMsgLine2.colorize(90)
  
  end

end

class String
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end
end

log(args)
