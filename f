local blacklisted_hwids = {
                        "d248c92ad467a5def1c1a172b18c35ba92308e216e14c578c48bace2231648d4fb2a267e5df010802e764066f272f4a93d4634b1206e7a428eb560ef3da7c98d", "788255e3c2058df2203ae3294141e53264decfcdb67b5f273d6560d5cbbfb895430c517be60964386ec805798dac1a8e7aee312e241f665dc03c234a1b2d6831", "dcfd0876389aeb7d1fa51afb86c769f917c018663feac27a47f05dda4ac042abab1be162b96a9e7c821cff30c10e969f46b3333587a5add8db9df942fb812315"
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
