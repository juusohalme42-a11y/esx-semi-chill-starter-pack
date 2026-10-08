# ESX Clothing Shop

A simple ESX clothing shop with a modern glass UI and ox_inventory compatibility.

## Features
- ESX money handling
- NUI-based clothing shop menu
- modern glassmorphism menu styling
- simple outfit purchase flow
- easy to customize clothing packs

## Installation
1. Extract the `esx_clothing_shop` folder into your `resources` folder.
2. Add to `server.cfg`:
   ```cfg
   ensure es_extended
   ensure ox_inventory
   ensure esx_clothing_shop
   ```
3. Restart your server or run `refresh` and `ensure esx_clothing_shop`.
4. Go to the shop location (default: LS Customs area).
5. Press `E` to open the clothing shop menu.

## Configuration
Edit `config.lua` to:
- Change shop location
- Add/remove outfits
- Adjust prices
- Update shop name

## Notes
This is a starter script intended for semi-chill RP servers.
The clothing values are configurable in `config.lua`. Component variations can be customized to create unique outfits.
