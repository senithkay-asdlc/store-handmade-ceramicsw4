# Store Handmade Ceramics — PRD

## Problem Statement

Independent ceramics makers who sell handmade goods have no simple, dedicated online storefront: general marketplaces bury unique, small-batch pieces among mass-produced goods, and setting up a full e-commerce stack from scratch is out of reach for a single-shop artisan. Shoppers who want to browse, cart, and buy handmade ceramics need a focused, trustworthy place to do it.

## Solution

A single-shop online store for handmade ceramics: shoppers sign in, browse a product catalog, build a cart, and check out with real payment processing, receiving an email confirmation of their order. An admin manages the catalog, tracks inventory, and fulfills orders.

## Actors

- **Shopper**: A signed-in customer who browses the catalog, manages a cart, checks out, pays, and tracks their own orders.
- **Admin**: The store owner/operator who manages the product catalog, tracks inventory levels, and updates order fulfillment status.

## User Stories

1. As a Shopper, I want to sign in via SSO, so that I can browse and shop on the store.
2. As a Shopper, I want to browse the product catalog of handmade ceramics, so that I can discover items to buy.
3. As a Shopper, I want to view a product's details (photos, description, price, stock availability), so that I can decide whether to buy it.
4. As a Shopper, I want to search and filter the catalog (e.g. by category or price), so that I can find products quickly.
5. As a Shopper, I want to add products to a cart, so that I can collect items before checking out.
6. As a Shopper, I want to update quantities or remove items from my cart, so that I can adjust my order before paying.
7. As a Shopper, I want to check out and pay securely through a payment provider, so that I can complete my purchase.
8. As a Shopper, I want to receive an email confirmation after placing an order, so that I have a record of my purchase.
9. As a Shopper, I want to view my past orders and their status, so that I can track my purchases.
10. As an Admin, I want to add, edit, and remove products in the catalog, so that I can keep the store's offerings current.
11. As an Admin, I want to track and update inventory levels for each product, so that shoppers can't buy items that are out of stock.
12. As an Admin, I want to view incoming orders and update their fulfillment status (e.g. processing, shipped, delivered), so that I can manage order fulfillment.

## Product Decisions

- The store is a single shop with one catalog, not a multi-seller marketplace.
- Every shopper signs in via SSO through Thunder, the platform IDP, before browsing or shopping (org default, and confirmed by the user).
- Checkout integrates with a real third-party payment provider so payments are actually processed, not simulated. The specific provider is a design-time decision.
- The store sends a transactional email confirming order placement (capability; the concrete email provider is a design-time decision).
- Admin is a distinct in-app role responsible for catalog management, inventory tracking, and order fulfillment status — it is not handled outside the product.

## Phasing

- **Phase 1 — Launch the handmade-ceramics storefront**: Ship the full shopper experience (sign-in, catalog browsing, search/filter, cart, checkout with real payment, order confirmation email, order history) together with the admin catalog, inventory, and order-fulfillment tooling. Stories: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12.

## Out of Scope

- Multi-seller marketplace features: seller onboarding, per-seller storefronts, or seller payout splitting.
- Product reviews and ratings.
- Loyalty/rewards programs or discount codes.
- Returns and refunds workflow.
- Shipping-carrier integration (label generation, live tracking) beyond a manually-updated fulfillment status.

## Open Questions

None at this time — the interview covered every decision needed for design to proceed.