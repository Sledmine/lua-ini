# lua-ini
A lightweight INI library for Lua

# Usage
The **lua.ini** file should be dropped into your project and required by it using:

```lua
local ini = require "lua-ini"
```

# Examples
Encode some values date to a ini string file.

```lua
local ini = require "lua-ini"

-- Data to encode as ini file
local data = {
	configuration = {
		left = 70,
		right = 80,
	},
	screen = {
		width = 960,
		height = 544,
		title = "Window Title",
		focused = true,
	}
}

-- String encoded ini file
print(ini.encode(data))

-- Optional write the file using the library
ini.save("configuration.ini", data)
```
And the *.ini* file created :
```ini
[sound]
left=70
right=80

[screen]
width=960
height=544
title=Window Title
focused=true
```

Now let's get all this data:

```lua
local LIP = require 'LIP';

-- Data loading
local data = LIP.load('savedata.ini');

print(data.sound.right); --> 80
print(data.screen.caption); --> Window's caption
print(data.screen.focused); --> true
````

It is also possible to give indexes instead of keys :

```lua
local data = {
	{
		right = 40,
		50,
	},
	{
		'Some text',
		20,
		true,
	}
}
````

And we have to retrieve data using these indexes :

```lua
print(data[1][1]); --> 50
print(data[1].right) --> 40
print(data[2][1]); --> Some text
print(data[2][3]); --> true
````