const shopMenu = document.getElementById("shopMenu");
const outfitList = document.getElementById("outfitList");
const shopTitle = document.getElementById("shopTitle");
const closeBtn = document.getElementById("closeBtn");

function renderOutfits(outfits) {
    outfitList.innerHTML = "";

    outfits.forEach((outfit) => {
        const item = document.createElement("div");
        item.className = "outfit";
        item.dataset.outfit = outfit.id;

        const info = document.createElement("div");
        info.className = "outfit-info";

        const name = document.createElement("div");
        name.className = "outfit-name";
        name.textContent = outfit.label;

        const price = document.createElement("div");
        price.className = "outfit-price";
        price.textContent = "$" + outfit.price;

        info.appendChild(name);
        info.appendChild(price);

        const buyBtn = document.createElement("button");
        buyBtn.className = "buy-btn";
        buyBtn.textContent = "Buy";

        buyBtn.addEventListener("click", () => {
            fetch(`https://${GetParentResourceName()}/buyOutfit`, {
                method: "POST",
                headers: { "Content-Type": "application/json; charset=UTF-8" },
                body: JSON.stringify({ outfit: outfit.id })
            });
        });

        item.appendChild(info);
        item.appendChild(buyBtn);
        outfitList.appendChild(item);
    });
}

window.addEventListener("message", (event) => {
    const data = event.data;

    if (data.action === "open") {
        shopTitle.textContent = data.shopName || "Vogue Clothing";
        renderOutfits(data.outfits || []);
        shopMenu.classList.remove("hidden");
    }

    if (data.action === "close") {
        shopMenu.classList.add("hidden");
    }
});

closeBtn.addEventListener("click", () => {
    fetch(`https://${GetParentResourceName()}/closeMenu`, {
        method: "POST",
        headers: { "Content-Type": "application/json; charset=UTF-8" },
        body: JSON.stringify({})
    });
});
