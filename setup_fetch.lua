--[[
	UiLibraryStyleImgui — automatic setup downloader
	Fetches every file from raw GitHub URLs and writes them
	into the correct folder structure. No ZIP needed.

	Requirements: executor with HttpService + writefile/isfolder/makefolder
	Replace YOUR_USERNAME with the real GitHub username.
]]

local HttpService = game:GetService("HttpService")
local BASE = "https://raw.githubusercontent.com/YOUR_USERNAME/UiLibraryStyleImgui/main/"

local FILES = {
	{ url = BASE .. "Library.lua",                    path = "UiLibraryStyleImgui/Library.lua" },
	{ url = BASE .. "README.md",                      path = "UiLibraryStyleImgui/README.md" },
	{ url = BASE .. "LICENSE",                        path = "UiLibraryStyleImgui/LICENSE" },
	{ url = BASE .. "docs/API.md",                    path = "UiLibraryStyleImgui/docs/API.md" },
	{ url = BASE .. "Themes/Themes.lua",              path = "UiLibraryStyleImgui/Themes/Themes.lua" },
	{ url = BASE .. "Examples/Example.lua",           path = "UiLibraryStyleImgui/Examples/Example.lua" },
	{ url = BASE .. "SETUP_INSTRUCTIONS.md",          path = "UiLibraryStyleImgui/SETUP_INSTRUCTIONS.md" },
}

if not (isfolder and makefolder and writefile) then
	error("Executor needs: isfolder(), makefolder(), writefile()")
end

if not isfolder("UiLibraryStyleImgui") then makefolder("UiLibraryStyleImgui") end
if not isfolder("UiLibraryStyleImgui/docs") then makefolder("UiLibraryStyleImgui/docs") end
if not isfolder("UiLibraryStyleImgui/Themes") then makefolder("UiLibraryStyleImgui/Themes") end
if not isfolder("UiLibraryStyleImgui/Examples") then makefolder("UiLibraryStyleImgui/Examples") end

local okCount, failCount = 0, 0
for _, f in ipairs(FILES) do
	local ok, res = pcall(function()
		return HttpService:GetAsync(f.url)
	end)
	if ok and type(res) == "string" and #res > 0 then
		writefile(f.path, res)
		print("[OK]   " .. f.path .. "  (" .. #res .. " bytes)")
		okCount = okCount + 1
	else
		print("[FAIL] " .. f.path .. "  <- " .. f.url)
		failCount = failCount + 1
	end
	task.wait(0.2)
end

print(string.format("Setup finished: %d ok, %d failed.", okCount, failCount))
if failCount > 0 then
	print("Check BASE URL: did you replace YOUR_USERNAME with the real GitHub username?")
end
