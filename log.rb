require 'date'

args = ARGV;

def log(args)
  
  logs_location     = Dir.home + '/Dropbox/Logs/'
  file_extension    = 'txt'
  date_format       = '%Y-%m-%d'
  time_format       = '%H:%M:%S'
  separator         = ' - ' 

  message           = args[0]
  current_date      = Time.now.strftime(date_format)
  current_time      = Time.now.strftime(time_format)

  file_path         = logs_location + current_date + '.' + file_extension

  new_entry         = current_time + separator + message
  new_file_content  = File.exists?(file_path) ? File.read(file_path)+new_entry : new_entry;

  File.open(file_path,'w+') do |file| 
    
    file.puts new_file_content

    success_msg_1 = 'Log written in ' + file_path
    success_msg_2 = 'Your log: ' + new_entry
    puts success_msg_1.colorize(32)
    puts success_msg_2.colorize(90)
    
  end

end

class String
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end
end

log(args)
