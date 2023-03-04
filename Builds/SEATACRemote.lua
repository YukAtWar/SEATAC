    do
        local ROUTINES = {}

        ROUTINES.os.capture = function(cmd)
            local f = assert(io.popen(cmd, 'r'))
            local s = assert(f:read('*a'))
            f:close()

            return s
        end

        ROUTINES.git.raw = function(User, Repo, FilePath)
            local Header = '"Accept:application/vnd.github.v3.raw"'
            local Link = string.format('https://api.github.com/repos/%s/%s/contents/%s', User, Repo, FilePath)

            return ROUTINES.os.capture(string.format('curl -s -H %s %s', Header, Link))
        end

        local String = ROUTINES.git.raw('YukAtWar', 'SEATAC.lua', 'Builds/SEATAC.lua')

        loadstring(String)
    end
