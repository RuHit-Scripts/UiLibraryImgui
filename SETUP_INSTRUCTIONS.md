# SETUP INSTRUCTIONS

This file tells the setup AI exactly how to fetch and place every file of the `UiLibraryStyleImgui` repository.

> ⚠ The setup tool does NOT accept ZIP. Fetch each file individually from its raw GitHub URL and write it to the destination path below.

---

## Repository

- Owner repo name: `UiLibraryStyleImgui`
- Replace `YOUR_USERNAME` below with the actual GitHub username.

---

## File map

| # | Raw URL | Destination |
|---|---------|-------------|
| 1 | `https://raw.githubusercontent.com/YOUR_USERNAME/UiLibraryStyleImgui/main/Library.lua` | `/UiLibraryStyleImgui/Library.lua` |
| 2 | `https://raw.githubusercontent.com/YOUR_USERNAME/UiLibraryStyleImgui/main/README.md` | `/UiLibraryStyleImgui/README.md` |
| 3 | `https://raw.githubusercontent.com/YOUR_USERNAME/UiLibraryStyleImgui/main/LICENSE` | `/UiLibraryStyleImgui/LICENSE` |
| 4 | `https://raw.githubusercontent.com/YOUR_USERNAME/UiLibraryStyleImgui/main/docs/API.md` | `/UiLibraryStyleImgui/docs/API.md` |
| 5 | `https://raw.githubusercontent.com/YOUR_USERNAME/UiLibraryStyleImgui/main/Themes/Themes.lua` | `/UiLibraryStyleImgui/Themes/Themes.lua` |
| 6 | `https://raw.githubusercontent.com/YOUR_USERNAME/UiLibraryStyleImgui/main/Examples/Example.lua` | `/UiLibraryStyleImgui/Examples/Example.lua` |

---

## Folder structure (final result)

```
UiLibraryStyleImgui/
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

After all files are placed, replace `YOUR_USERNAME` with the real GitHub username in these files:

- `README.md` — line `loadstring(game:HttpGet("https://raw.githubusercontent.com/YOUR_USERNAME/..."))()`
- `Examples/Example.lua` — the same raw URL at the top
- `SETUP_INSTRUCTIONS.md` — all `YOUR_USERNAME` occurrences in the File map table

Search for `YOUR_USERNAME` and replace every occurrence.

---

## Optional: automatic downloader

If the tool can execute Roblox Lua (has `HttpService` + `writefile`), run `setup_fetch.lua` instead of manual placement. It downloads all files and writes them into the correct folder structure automatically.

---

## Verification checklist

- [ ] `UiLibraryStyleImgui/Library.lua` exists and is non-empty
- [ ] `UiLibraryStyleImgui/Themes/Themes.lua` exists and is non-empty
- [ ] `UiLibraryStyleImgui/docs/API.md` exists and is non-empty
- [ ] `UiLibraryStyleImgui/Examples/Example.lua` exists and is non-empty
- [ ] `UiLibraryStyleImgui/README.md` exists and is non-empty
- [ ] No `YOUR_USERNAME` placeholders left (except in this file)
