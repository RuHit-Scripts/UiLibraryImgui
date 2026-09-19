# SETUP INSTRUCTIONS

This file tells the setup AI exactly how to fetch and place every file of the `UiLibraryStyleImgui` repository.

> ⚠ The setup tool does NOT accept ZIP. Fetch each file individually from its raw GitHub URL and write it to the destination path below.

---

## Repository

- Owner repo name: `UiLibraryStyleImgui`
- Replace `RuHit-Scripts` below with the actual GitHub username.

---

## File map

| # | Raw URL | Destination |
|---|---------|-------------|
| 1 | `https://raw.githubusercontent.com/RuHit-Scripts/UiLibraryImgui/main/Library.lua` | `/UiLibraryImgui/Library.lua` |
| 2 | `https://raw.githubusercontent.com/RuHit-Scripts/UiLibraryImgui/main/README.md` | `/UiLibraryImgui/README.md` |
| 3 | `https://raw.githubusercontent.com/RuHit-Scripts/UiLibraryImgui/main/LICENSE` | `/UiLibraryImgui/LICENSE` |
| 4 | `https://raw.githubusercontent.com/RuHit-Scripts/UiLibraryImgui/main/docs/API.md` | `/UiLibraryImgui/docs/API.md` |
| 5 | `https://raw.githubusercontent.com/RuHit-Scripts/UiLibraryImgui/main/Themes/Themes.lua` | `/UiLibraryImgui/Themes/Themes.lua` |
| 6 | `https://raw.githubusercontent.com/RuHit-Scripts/UiLibraryImgui/main/Examples/Example.lua` | `/UiLibraryImgui/Examples/Example.lua` |

---

## Folder structure (final result)

```
UiLibraryImgui/
├── Library.lua              <-- main library (required)
├── README.md                <-- GitHub readme
├── LICENSE                  <-- MIT license
├── docs/
│   └── API.md               <-- full API reference
├── Themes/
│   └── Themes.lua           <-- theme colors (Ocean, Night, Candy, Mint, Light)
└── Examples/
    └── Example.lua          <-- usage example
```

---

## Steps

1. Fetch each file from the **Raw URL** column using the tool's network fetch (HttpGet / curl / download).
2. Write the downloaded content to the **Destination** path exactly as shown.
3. Create any missing parent folders (`docs`, `Themes`, `Examples`).
4. Do NOT merge, minify, or modify the files.

---

## Replace placeholders

After all files are placed, replace `RuHit-Scripts` with the real GitHub username in these files:

- `README.md` — line `loadstring(game:HttpGet("https://raw.githubusercontent.com/RuHit-Scripts/..."))()`
- `Examples/Example.lua` — the same raw URL at the top
- `SETUP_INSTRUCTIONS.md` — all `RuHit-Scripts` occurrences in the File map table

Search for `RuHit-Scripts` and replace every occurrence.

---

## Optional: automatic downloader

If the tool can execute Roblox Lua (has `HttpService` + `writefile`), run `setup_fetch.lua` instead of manual placement. It downloads all files and writes them into the correct folder structure automatically.

---

## Verification checklist

- [ ] `UiLibraryImgui/Library.lua` exists and is non-empty
- [ ] `UiLibraryImgui/Themes/Themes.lua` exists and is non-empty
- [ ] `UiLibraryImgui/docs/API.md` exists and is non-empty
- [ ] `UiLibraryImgui/Examples/Example.lua` exists and is non-empty
- [ ] `UiLibraryImgui/README.md` exists and is non-empty
- [ ] No `RuHit-Scripts` placeholders left (except in this file)
