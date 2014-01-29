require 'time'

ping_count = 1
server = "www.google.com"
outfile = "pinglog.txt"

def pingx(server="www.google.com",  count=1)
    result = `ping -n #{count} #{server}`

    mtch = result.match(/Reply .* TTL=[\d]+/)
    time = result.match(/time=[\d]*/)
    return mtch[0]
end

t = Time.now
File.write(outfile, t.httpdate + "  " + pingx(server, ping_count) + "\n", mode:"a")