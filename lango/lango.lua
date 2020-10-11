url = require("socket.url")
lunajson = require 'lunajson'

-- get API key or fail
access_key=os.getenv("API_KEY")
if access_key == nil or access_key == '' then
    print("API_KEY not set")
    os.exit(1)
end

hc = require('httpclient').new()
-- cerner_2^5_2020
function search(q)
    -- cheap way of making our url call without interpolation
    call_url='http://api.languagelayer.com/detect?access_key='..access_key..'&query='..url.escape(query)
    res = hc:get(call_url)
    if res.body then
        local json = lunajson.decode(res.body)
        -- iterate over the results
        for _, result in ipairs(json["results"]) do
            -- Print a nice formatted message
            print("Language is "..result["language_name"])
            print("  Confidence "..result["percentage"].."% with identification "..result["probability"].." and match confidence "..tostring(result["reliable_result"]))
        end
    else
      print(res.err)
    end
end

-- combine all args into a single string
query=table.concat(arg, " ")
if query==nil or query=='' then
  print("No arguments")
  os.exit(1)
else
    search(query)
end
