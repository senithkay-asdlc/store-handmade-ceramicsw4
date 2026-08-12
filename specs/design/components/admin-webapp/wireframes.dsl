// Ceramics Admin Portal — store-owner back office

screen AdminProducts "Admin reviews the catalog and manages product listings"
  navbar "Ceramics Admin"
  sidebar "Products -> AdminProducts | Orders -> AdminOrders"
  row
    heading "Products"
    right
    search "Search products…"
    button "Add product" primary -> ProductForm
  table "Product | Category | Price | Stock | Status" -> ProductForm
    row "Glazed Stoneware Mug | Mugs | $28 | 34 | Active"
    row "Speckled Bowl Set | Bowls | $54 | 6 | Low stock"
    row "Vase — Terracotta | Vases | $42 | 0 | Out of stock"

screen ProductForm "Admin creates or edits a product and its stock level"
  navbar "Ceramics Admin"
  sidebar "Products -> AdminProducts | Orders -> AdminOrders"
  breadcrumb "Products / Glazed Stoneware Mug"
  heading "Edit Product"
  input "Name — e.g. Glazed Stoneware Mug"
  textarea "Description"
  row
    input "Price"
    select "Category: Mugs"
  input "Stock quantity: 34"
  row
    right
    button "Delete" danger
    button "Cancel"
    button "Save product" primary -> AdminProducts

screen AdminOrders "Admin reviews incoming orders and updates fulfillment status"
  navbar "Ceramics Admin"
  sidebar "Products -> AdminProducts | Orders -> AdminOrders"
  row
    heading "Orders"
    right
    tabs "All (146) | Processing (12) | Shipped (28) | Delivered (106)"
  table "Order | Customer | Placed | Total | Status" -> OrderStatus
    row "#1042 | J. Alvarez | Aug 10 | $98 | Processing"
    row "#1041 | R. Kim | Aug 10 | $42 | Processing"
    row "#1038 | S. Patel | Aug 9 | $54 | Shipped"

screen OrderStatus "Admin updates one order's fulfillment status"
  navbar "Ceramics Admin"
  sidebar "Products -> AdminProducts | Orders -> AdminOrders"
  breadcrumb "Orders / #1042"
  row
    heading "Order #1042"
    badge "Processing" warning
  text "J. Alvarez — placed Aug 10 — Total $98"
  table "Product | Quantity | Unit price"
    row "Glazed Stoneware Mug | 2 | $28"
    row "Vase — Terracotta | 1 | $42"
  select "Status: Processing"
  row
    right
    button "Cancel"
    button "Update status" primary -> AdminOrders
