require 'time'

ping_count = 1
server = "www.google.com"
outfile = "/home/randy/rails_projects/ping_app/pinglog.txt"

def pingx(server="www.google.com",  count=1)
    result = `ping -c #{count} #{server}`

    mtch = result.match(/from .* ttl=[\d]+/)
    time = result.match(/time=[\d]*/)
    return mtch[0] + ' ' + time[0]
end

t = Time.now
File.write(outfile, t.httpdate + "  " + pingx(server, ping_count) + "\n", mode:"a")
