# Airbnb_DB
IU University of Applied Science (Educational Project- Database of Airbnb)


A professionally modeled relational database system inspired by core Airbnb platform functionality. This project demonstrates production-level schema design, relational integrity, data seeding, and query structuring for a modern accommodation marketplace.

[![MySQL](https://img.shields.io/badge/MySQL-8.x-blue.svg)](https://www.mysql.com/)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

# Design
<img width="1275" height="750" alt="image" src="https://github.com/user-attachments/assets/85154590-7309-4208-9ac3-3ba103a78ab3" />



---

## 📋 Table of Contents

- [Purpose & Scope](#purpose--scope)
- [Key Features](#key-features)
- [Repository Structure](#repository-structure)
- [Schema Overview](#schema-overview)
- [Technologies](#technologies)
- [Installation & Usage](#installation--usage)
- [Example Queries](#example-queries)
- [Data Consistency](#data-consistency)
- [Future Enhancements](#future-enhancements)
- [Use Cases](#use-cases)
- [Contributing](#contributing)
- [Contact & Feedback](#contact--feedback)
- [License](#license)

---

## 🎯 Purpose & Scope

This project models the core operational entities and workflows of a booking marketplace, simulating the relationship between **guests**, **hosts**, and **properties**.

### Core Entities Modeled:

- **Users** (Hosts & Guests)
- **Property Listings**
- **Amenities**
- **Availability Calendars**
- **Bookings**
- **Payments & Commissions**
- **Reviews & Ratings**
- **Messaging System**
- **Complaints Management**
- **Wishlists & Favorites**
- **Social Profiles**
- **Referrals & Verifications**

### Implementation Focus:

✔ **Normalized relational schema**  
✔ **Foreign key integrity & cascading rules**  
✔ **Logical constraints based on real booking flows**  
✔ **Synthetic but realistic seed data**  
✔ **Query examples for business analytics**

---

## ⭐ Key Features

### ✓ Realistic Domain Modeling

The schema encodes real-world constraints such as:

- One user can be both host & guest
- Properties belong to hosts
- Guests create bookings
- Payments map to bookings
- Messaging between users
- Host verification workflows
- Review & rating system
- Wishlist + favorites UX features

### ✓ High Referential Integrity

Implemented via:

- `FOREIGN KEY` constraints
- `ON DELETE CASCADE` rules
- Unique indexes for many-to-many tables

### ✓ Clean Data Seeding

The `seed.sql` file provides:

- **20 users**
- **10 hosts**
- **20 guests**
- **20 properties**
- **20 bookings**
- **20 payments**
- Amenities, wishlists, commissions, reviews, etc.

Suitable for analytics queries immediately after seeding.

### ✓ Business Logic Coverage

Includes financial and operational entities:

- `platform_commissions` (platform earnings)
- `incomes` (host earnings)
- `payments` (guest → platform)
- `complaints` (customer support)
- `host_verifications` (trust & safety)

---

## 📁 Repository Structure

```
Airbnb_DB/
│
├── schema.sql      # Full relational schema with constraints
├── seed.sql        # Data seeding for demo + testing
├── queries.sql     # Sample business & analytical queries
└── README.md       # Project documentation
```

---

## 🗄️ Schema Overview

Below is a high-level conceptual view of the database layers:

### **Users Layer**
- `users`
- `hosts`
- `guests`
- `social_profiles`
- `referrals`

### **Property Layer**
- `properties`
- `amenities`
- `property_amenities`
- `calendars`

### **Transaction Layer**
- `bookings`
- `payments`
- `platform_commissions`
- `incomes`

### **Community Layer**
- `reviews`
- `favorites`
- `wishlists`
- `wishlist_items`
- `messages`
- `complaints`
- `host_verifications`

---

## 🛠️ Technologies

No frameworks or stored procedures are required. The system is implemented using:

- **SQL** (MySQL dialect)
- **InnoDB** storage engine for FK support

### Compatibility:
- ✅ Tested on **MySQL 8.x**
- ✅ Should run on **MariaDB ≥ 10.4** with minimal/no adaptation

---

## 🚀 Installation & Usage

### Prerequisites

- MySQL 8.x or MariaDB 10.4+
- Command-line access to MySQL client

### Step 1: Create & Load Schema

```bash
mysql -u root -p < schema.sql
```

### Step 2: Seed the Database

```bash
mysql -u root -p < seed.sql
```

### Step 3: Run Example Queries

```bash
mysql -u root -p < queries.sql
```

---

## 📊 Example Queries

The project includes production-relevant analytical queries such as:

- 🏆 **Top-rated properties per city**
- 💰 **Most profitable hosts**
- 📈 **Monthly platform revenue**
- 📅 **Guest booking frequencies**
- 💬 **Messaging activity**
- 🔥 **Commission vs. payout heatmaps**

These are valuable for **data teams** and **business intelligence**.

---

## ✅ Data Consistency

The database ensures:

- `AUTO_INCREMENT` identities for primary keys
- Cascading deletions for cleanup
- Unique guest-property favorite & wishlist pairs
- Many-to-many amenity relationships
- Check constraints on review ratings

---

## 🔮 Future Enhancements

Potential production-level extensions:

- **Postgres migration** + partitioning
- **Read replicas** for analytics
- **Search indexing** (Elasticsearch)
- **Payments ledger** with double-entry accounting
- **GDPR-compliant** user data retention rules
- **Fraud & abuse analytics** models

---

## 💼 Use Cases

This project is ideal for:

- 📂 **Portfolio presentation**
- 🎯 **Technical interviews**
- 🖥️ **Backend/data engineering demos**
- 📚 **Academic/educational usage**

> ⚠️ **Note:** This project is not intended for commercial marketplace deployment without additional infrastructure, security hardening, and compliance measures.

---

## 🤝 Contributing

Contributions and improvements via Pull Requests are welcome, especially around:

- Advanced analytical queries
- Schema evolution and optimization
- Performance tuning
- Additional real-world constraints
- Migration scripts for other databases (PostgreSQL, etc.)

Please feel free to:

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Open a Pull Request

---

## 📬 Contact & Feedback

For questions, suggestions, or professional use cases:

- 🐛 **Open an Issue** on GitHub
- 🔧 **Submit a Pull Request**
- 💼 **Reach out** via professional channels (LinkedIn/GitHub)

---

## 👨‍💻 Maintainer

Created and maintained by **[Aminos2612](https://github.com/Aminos2612)**

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

**⭐ If you find this project useful, please consider giving it a star on GitHub!**
