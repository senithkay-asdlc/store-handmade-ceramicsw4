# Security design

## Roles → permissions

No unauthenticated surface: every screen in both web apps requires sign-in (Product Decision), and every `ceramics-api` operation requires a valid token.

## Authentication (Thunder)

- Shared platform-resource dependency name: **`user-auth`**, declared identically on `storefront-webapp`, `admin-webapp`, and `ceramics-api`.
- Scopes: `openid profile email` (default).
- Both web apps perform OIDC + PKCE sign-in against Thunder before rendering any screen. `ceramics-api` sits behind the gateway and validates the forwarded bearer token on every request — it issues no tokens of its own.

## Role resolution

`ceramics-api` resolves the caller's role from the Thunder-issued token's claims (mapped to Shopper or Admin) and the gateway-injected `X-User-Id` header identifies the caller for scoping a Shopper's own cart/orders. A caller whose role cannot be resolved, or whose role lacks permission for the requested operation, is denied with `403` — deny by default.