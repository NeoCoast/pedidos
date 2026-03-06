# Secom - Office Food Ordering

Secom is a group food ordering app for offices. It allows teams to coordinate group orders from restaurants, track individual meals with toppings and extras, split costs with automatic discount calculations, and manage payments.

## Features

- **Group Orders** — Create group orders tied to a restaurant and date, then advance them through statuses: open → closed → ordered → delivered.
- **Individual Orders** — Each person adds their meal (menu item + toppings + extras) to a group order. Totals are calculated automatically.
- **Restaurant & Menu Management** — Manage restaurants with nested menu items, toppings, and extras, each with prices.
- **Discount Calculation** — Apply a percentage discount directly, or enter the total amount paid to auto-calculate the discount.
- **Payment Tracking** — Track who has paid, set bank account info for transfers, and see per-person totals after discount.
- **User Switching** — Session-based user selector (no authentication), designed for shared office use.
- **Mobile-Friendly** — Responsive layout with hamburger menu, touch-friendly controls, and icon buttons on small screens.

## Tech Stack

| Layer | Technology |
|-------|------------|
| Framework | Ruby on Rails 8.1 |
| Ruby | 3.2.2 |
| Database | PostgreSQL |
| Frontend | Hotwire (Turbo + Stimulus) |
| CSS | Tailwind CSS v4 |
| Asset Pipeline | Propshaft + Importmap |
| Server | Puma |
| Deployment | Kamal (Docker) |

## Getting Started

### Prerequisites

- Ruby 3.2.2
- PostgreSQL

### Setup

```bash
bundle install
bin/rails db:create db:migrate db:seed
bin/dev
```

The seed file includes sample users, restaurants with full menus (including items parsed from PedidosYa and Reorder.io), and demo data.

### Running Tests

```bash
bundle exec rspec
```

## Project Structure

```
app/
  controllers/     # GroupOrders, IndividualOrders, Restaurants, Users, Sessions
  models/          # GroupOrder, IndividualOrder, Meal, Restaurant, MenuItem, Topping, Extra, User
  views/           # ERB templates with Tailwind CSS
  javascript/
    controllers/   # Stimulus controllers (custom-select, mobile-menu, inline-edit, etc.)
  assets/
    tailwind/      # application.css with custom component styles
```
