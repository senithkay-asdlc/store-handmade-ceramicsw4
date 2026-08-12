# Handmade Ceramics Online Store — Design

## Overview

A single-shop e-commerce system split into two customer-facing surfaces and one backend. Shoppers sign in via Thunder SSO and use the **Ceramics Storefront** web app to browse the catalog, manage a cart, check out with real payment processing through Stripe, and track their own orders. The store owner uses the separate **Ceramics Admin Portal** to manage products, inventory, and order fulfillment. Both web apps call the **Ceramics API**, the single backend service that owns the catalog, cart, checkout/payment orchestration, and order data, and that sends order-confirmation email on successful checkout.

## Context (C1)

```mermaid
graph TD
  Shopper((Shopper))
  Admin((Admin))
  Storefront[Ceramics Storefront]
  AdminPortal[Ceramics Admin Portal]
  API[Ceramics API]
  Thunder[(Thunder Auth)]
  Stripe[(Stripe)]
  Email[(Email Provider)]

  Shopper --> Storefront
  Admin --> AdminPortal
  Storefront --> API
  AdminPortal --> API
  Storefront --> Thunder
  AdminPortal --> Thunder
  API --> Thunder
  API --> Stripe
  API --> Email
```

## Domain model (ER)

```mermaid
erDiagram
  PRODUCT {
    string id
    string name
    string description
    decimal price
    string category
    int stockQuantity
    string[] imageUrls
  }
  CART {
    string id
    string shopperId
  }
  CART_ITEM {
    string id
    string productId
    int quantity
  }
  ORDER {
    string id
    string shopperId
    string status
    decimal total
    datetime placedAt
  }
  ORDER_ITEM {
    string id
    string productId
    int quantity
    decimal unitPrice
  }
  PAYMENT {
    string id
    string orderId
    string provider
    string status
    decimal amount
  }

  CART ||--o{ CART_ITEM : contains
  CART_ITEM }o--|| PRODUCT : references
  ORDER ||--o{ ORDER_ITEM : contains
  ORDER_ITEM }o--|| PRODUCT : references
  ORDER ||--|| PAYMENT : "paid by"
```

## Key flows

### Shopper checkout

```mermaid
sequenceDiagram
  actor Shopper
  participant Storefront
  participant API as Ceramics API
  participant Stripe

  Shopper->>Storefront: Add products to cart
  Storefront->>API: POST /cart/items
  Shopper->>Storefront: Proceed to checkout
  Storefront->>API: POST /checkout
  API->>Stripe: Create & confirm payment intent
  Stripe-->>API: Payment succeeded
  API->>API: Create order, decrement stock, clear cart
  API-->>Storefront: Order confirmation
  API->>API: Send order-confirmation email
  Storefront-->>Shopper: Show order confirmation
```

### Admin fulfills an order

```mermaid
sequenceDiagram
  actor Admin
  participant AdminPortal
  participant API as Ceramics API

  Admin->>AdminPortal: Open Orders queue
  AdminPortal->>API: GET /orders
  API-->>AdminPortal: Orders list
  Admin->>AdminPortal: Update order status
  AdminPortal->>API: PATCH /orders/{orderId}/status
  API-->>AdminPortal: Updated order
```