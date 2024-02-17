# Typing Indicator
Simple, awfully optimized typing indicator for FiveM
By awfully optimized, I mean really bad... I tested it with 2 players on my local machine and it was no good, I can't imagine larger server with like 40 people, but hey, I was bored...

# Requirements
* [chat](https://github.com/citizenfx/cfx-server-data/tree/master/resources/%5Bgameplay%5D/chat)

# Installation (PLEASE READ)
* Download/Clone this repo
* Unzip it and add the folder to your `resources/`
* Go to `resources/[cfx-default]/[gameplay]/chat` (or wherever you have your chat resource installed)
* Add the following line to the bottom of **`cl_chat.lua`**
```lua
exports("isActive",function ()
  return chatInputActive
end)
```
* Restart both of the scripts (possibly the whole server)
* Profit???

# Screenshots
## Player 1 (not typing):
![image](https://github.com/nwvh/wx_typingindicator/assets/76164598/41cef199-f1ce-4460-971e-ffad214e2464)
## Player 2 (typing):
![image](https://github.com/nwvh/wx_typingindicator/assets/76164598/7beba58c-ee1c-4872-8c9a-8383fd548ff2)
