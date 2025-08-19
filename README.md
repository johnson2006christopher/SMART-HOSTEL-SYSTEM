# Smart Hostel System

A comprehensive hostel management platform similar to Airbnb/Booking.com, built with Node.js, Express, SQLite, and modern HTML/CSS/JavaScript.

## Features

### 🏠 **Host Onboarding**
- Complete hostel listing creation form
- Image upload with drag & drop
- Amenities and house rules management
- Contact information and location details
- Real-time form validation

### 🔍 **Search & Discovery**
- Browse available hostel listings
- Search by city, title, or room type
- Filter by room type and price range
- Responsive grid layout with images

### 👥 **User Management**
- Student registration and login
- Role-based access control (User, Host, Admin)
- Secure authentication with JWT tokens
- Password hashing with bcrypt

### 🛡️ **Admin Panel**
- Comprehensive dashboard with statistics
- User management (view, edit, delete)
- Listing management (view, edit, delete)
- Search and filter capabilities
- Modal-based editing interface

### 📱 **Modern UI/UX**
- Responsive design for all devices
- Beautiful gradient backgrounds
- Interactive navigation
- Font Awesome icons
- Smooth transitions and hover effects

## Quick Start

### Prerequisites
- Node.js (v16 or higher)
- npm or yarn

### Installation

1. **Clone or download the project**
   ```bash
   cd "C:\Users\johns\OneDrive\Desktop\SMART HOSTEL SYSTEM"
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Start the server**
   ```bash
   npm start
   ```

4. **Open in browser**
   - Main site: `http://localhost:8080/home1.html`
   - Explore listings: `http://localhost:8080/explore.html`
   - Host onboarding: `http://localhost:8080/host-onboarding.html`
   - Admin panel: `http://localhost:8080/admin.html`
   - Payments demo: `http://localhost:8080/0.1.html/payment.html`
   - My bookings: `http://localhost:8080/0.1.html/my-bookings.html`

## Default Admin Access

- **Email**: `admin@hostel.com`
- **Password**: `password`

## API Endpoints

### Authentication
- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - User login

### Listings
- `GET /api/listings` - Get all listings with search/filter
- `GET /api/listings/:id` - Get single listing
- `POST /api/listings` - Create new listing (hosts only)
- `PUT /api/listings/:id` - Update listing
- `DELETE /api/listings/:id` - Delete listing

### Admin
- `GET /api/admin/users` - Get all users
- `GET /api/admin/listings` - Get all listings with host info
- `DELETE /api/admin/users/:id` - Delete user

### Bookings
- `POST /api/bookings` - Create booking
- `GET /api/bookings` - Get user's bookings
- `DELETE /api/bookings/:id` - Cancel a pending booking

### Payments
- `GET /api/payments/config` - Returns publishable key for frontend (uses STRIPE_PUBLISHABLE_KEY)
- `POST /api/payments/create-intent` - Create Stripe PaymentIntent for a booking (requires STRIPE_SECRET_KEY)
- `POST /api/payments/webhook` - Stripe webhook to auto-confirm bookings (requires STRIPE_WEBHOOK_SECRET)

### Notifications
- Email notifications are sent on booking create/cancel (in dev, emails are logged unless SMTP env is configured).

## Database Schema

### Users Table
- Basic info (name, email, phone)
- Student details (institution, program)
- Role-based access control
- Password hashing

### Listings Table
- Hostel information (title, description, price)
- Location and room type
- Images, amenities, and rules
- Host relationship

### Bookings Table
- User and listing relationships
- Check-in/out dates
- Guest count and status

## File Structure

```
SMART HOSTEL SYSTEM/
├── 0.1.html/                 # Frontend HTML files
│   ├── home1.html           # Homepage
│   ├── about1.html          # About page
│   ├── registration1.html   # User registration
│   ├── login.html           # User login
│   ├── explore.html         # Browse listings
│   ├── host-onboarding.html # Host listing creation
│   ├── admin.html           # Admin dashboard
│   └── Impact1.html         # Impact page
├── server/                   # Backend files
│   ├── index.js             # Express server
│   ├── schema.sql           # Database schema
│   └── seed.sql             # Sample data
├── package.json              # Dependencies and scripts
└── README.md                 # This file
```

## How to Use

### For Students
1. **Register** at `/registration1.html`
2. **Login** at `/login.html`
3. **Browse hostels** at `/explore.html`
4. **Book rooms** (coming soon)

### For Hosts
1. **Register and login** as a regular user
2. **Go to** `/host-onboarding.html`
3. **Fill out** the comprehensive hostel form
4. **Upload images** and set amenities
5. **Submit** your listing

### For Admins
1. **Login** with admin credentials
2. **Access** `/admin.html`
3. **Manage** users, listings, and system data
4. **Monitor** platform statistics

## Development

### Run with Docker
- Build and run:
  - docker compose up --build
- Open http://localhost:8080/home1.html
- Data persistence:
  - uploads/ and server/db.sqlite are mounted to the container for persistence.

### CI
- GitHub Actions workflow (.github/workflows/ci.yml) runs lint and builds the Docker image on pushes/PRs to main/master.

### Adding New Features
- **Frontend**: Edit HTML files in `0.1.html/`
- **Backend**: Modify `server/index.js`
- **Database**: Update `server/schema.sql`

### Running in Development
```bash
npm run dev
```

### Database Reset
Delete `server/db.sqlite` and restart the server to recreate the database.

## Security Features

- JWT token authentication
- Password hashing with bcrypt
- Role-based access control
- Input validation and sanitization
- CORS protection
- Helmet security headers

## Future Enhancements

- [ ] Payment integration (Stripe)
- [ ] Real-time messaging
- [ ] Review and rating system
- [ ] Map integration
- [ ] Mobile app (React Native)
- [ ] Advanced search filters
- [ ] Booking calendar
- [ ] Email notifications
- [ ] Image optimization
- [ ] Analytics dashboard

## Troubleshooting

### Common Issues

1. **Port already in use**
   - Change port in `server/index.js` or kill existing process

2. **Database errors**
   - Delete `server/db.sqlite` and restart

3. **Image upload issues**
   - Check file size and format
   - Ensure proper permissions

4. **Admin access denied**
   - Verify admin credentials
   - Check user role in database

### Logs
Check console output for detailed error messages and database initialization status.

## Support

For technical support or feature requests, contact the development team.

---

**Built with ❤️ for Tanzania's student community**
