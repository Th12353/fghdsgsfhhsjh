local blacklisted_hwids = {
                        "{a93f0fc9-e82f-11e8-9058-806e6f6e6963}", "788255e3c2058df2203ae3294141e53264decfcdb67b5f273d6560d5cbbfb895430c517be60964386ec805798dac1a8e7aee312e241f665dc03c234a1b2d6831", "0bb713c33d19cff5768a9f5ab4ee56180862d57995cbd4cd75bb6d758d3812f0ce913b6bffab95967296a5c507500a8ddfa6d162d9269b6c581054e5b2885031"
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
