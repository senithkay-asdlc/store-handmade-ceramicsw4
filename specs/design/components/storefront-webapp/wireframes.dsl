// Ceramics Storefront — shopper-facing screens

screen Catalog "Shopper browses and searches the handmade-ceramics catalog"
  navbar "Ceramics Co. | Catalog -> Catalog | Cart -> Cart | Orders -> OrderHistory"
  row
    heading "Handmade Ceramics"
    right
    search "Search bowls, mugs, vases…"
    select "Category: All"
  row
    card "Glazed Stoneware Mug | $28 | Rustic glaze, 12oz" -> ProductDetail
    card "Speckled Bowl Set | $54 | Set of 4, food-safe" -> ProductDetail
    card "Vase — Terracotta | $42 | Hand-thrown, 10in" -> ProductDetail
    card "Ceramic Plate | $22 | Matte finish, dishwasher safe" -> ProductDetail

screen ProductDetail "Shopper reviews one product before adding it to the cart"
  navbar "Ceramics Co. | Catalog -> Catalog | Cart -> Cart | Orders -> OrderHistory"
  breadcrumb "Catalog / Glazed Stoneware Mug"
  split 60/40
    left
      image "Product photo"
      text "Rustic glaze, hand-thrown, 12oz capacity. Dishwasher and microwave safe."
    right
      heading "Glazed Stoneware Mug"
      text "$28"
      badge "In stock" success
      select "Quantity: 1"
      button "Add to cart" primary -> Cart

screen Cart "Shopper reviews and adjusts items before checking out"
  navbar "Ceramics Co. | Catalog -> Catalog | Cart -> Cart | Orders -> OrderHistory"
  heading "Your Cart"
  table "Product | Price | Quantity | Subtotal"
    row "Glazed Stoneware Mug | $28 | 2 | $56"
    row "Vase — Terracotta | $42 | 1 | $42"
  row
    right
    text "Total: $98"
  row
    right
    button "Continue shopping"
    button "Checkout" primary -> Checkout

screen Checkout "Shopper pays and places the order"
  navbar "Ceramics Co. | Catalog -> Catalog | Cart -> Cart | Orders -> OrderHistory"
  heading "Checkout"
  split 60/40
    left
      input "Shipping address"
      input "Card number"
      row
        input "Expiry"
        input "CVC"
      text "Total due: $98"
    right
      card "Order summary"
        text "Glazed Stoneware Mug x2 — $56"
        text "Vase — Terracotta x1 — $42"
  row
    right
    button "Cancel"
    button "Pay & place order" primary -> OrderHistory

screen OrderHistory "Shopper tracks past orders and their status"
  navbar "Ceramics Co. | Catalog -> Catalog | Cart -> Cart | Orders -> OrderHistory"
  heading "Your Orders"
  table "Order | Placed | Total | Status"
    row "#1042 | Aug 10 | $98 | Processing"
    row "#1031 | Jul 28 | $54 | Delivered"
    row "#1020 | Jul 12 | $70 | Shipped"
