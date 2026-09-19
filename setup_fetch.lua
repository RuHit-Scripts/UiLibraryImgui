--[[
	UiLibraryStyleImgui — automatic setup downloader
	Fetches every file from raw GitHub URLs and writes them
	into the correct folder structure. No ZIP needed.

	Requirements: executor with HttpService + writefile/isfolder/makefolder
	Uses the RuHit-Scripts/UiLibraryImgui repository.
]]

local HttpService = game:GetService("HttpService")
local BASE = "https://raw.githubusercontent.com/RuHit-Scripts/UiLibraryImgui/main/"

local FILES = {
	{ url = BASE .. "Library.lua",                    path = "UiLibraryImgui/Library.lua" },
	{ url = BASE .. "README.md",                      path = "UiLibraryImgui/README.md" },
	{ url = BASE .. "LICENSE",                        path = "UiLibraryImgui/LICENSE" },
	{ url = BASE .. "docs/API.md",                    path = "UiLibraryImgui/docs/API.md" },
	{ url = BASE .. "Themes/Themes.lua",              path = "UiLibraryImgui/Themes/Themes.lua" },
	{ url = BASE .. "Examples/Example.lua",           path = "UiLibraryImgui/Examples/Example.lua" },
	{ url = BASE .. "SETUP_INSTRUCTIONS.md",          path = "UiLibraryImgui/SETUP_INSTRUCTIONS.md" },
}

if not (isfolder and makefolder and writefile) then
	error("Executor needs: isfolder(), makefolder(), writefile()")
end

if not isfolder("UiLibraryStyleImgui") then makefolder("UiLibraryStyleImgui") end
if not isfolder("UiLibraryImgui/docs") then makefolder("UiLibraryImgui/docs") end
if not isfolder("UiLibraryImgui/Themes") then makefolder("UiLibraryImgui/Themes") end
if not isfolder("UiLibraryImgui/Examples") then makefolder("UiLibraryImgui/Examples") end

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
	print("Check BASE URL: did you replace RuHit-Scripts with the real GitHub username?")
end
