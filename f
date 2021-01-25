local blacklisted_hwids = {
                        "{a93f0fc9-e82f-11e8-9058-806e6f6e6963}", "788255e3c2058df2203ae3294141e53264decfcdb67b5f273d6560d5cbbfb895430c517be60964386ec805798dac1a8e7aee312e241f665dc03c234a1b2d6831", ""
                         }

local body = https_request({Url = 'https://creativehell.xyz/api/gethwid.php'; Method = 'GET'}).Body;
local json_decode = game:GetService('HttpService'):JSONDecode(body)
local Fingerprnit_list = {"Syn-Fingerprint", "proto-user-identifier"};
local hwid = "";

for i, v in next, Fingerprnit_list do
if json_decode[v] then
for i1, v1 in next, blacklisted_hwids do
if  v1 == json_decode[v] then
game:Shutdown()
game.Players.LocalPlayer:Destroy()
end
end
end
end
