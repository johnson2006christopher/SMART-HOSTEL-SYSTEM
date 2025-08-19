# Smart Hostel System - Project Structure

## 🏗️ New Modular Architecture

The Smart Hostel System has been completely restructured to follow modern, scalable architecture patterns. This new structure makes the system more maintainable, testable, and professional.

## 📁 Directory Structure

```
SMART HOSTEL SYSTEM/
├── 📁 config/                 # Configuration files
│   ├── database.js           # Database connection and settings
│   └── upload.js             # File upload configuration (multer)
├── 📁 middleware/            # Express middleware
│   └── auth.js               # Authentication and authorization middleware
├── 📁 routes/                # API route handlers
│   ├── auth.js               # User authentication routes
│   ├── listings.js           # Hostel listing routes
│   └── admin.js              # Administrative routes
├── 📁 controllers/            # Business logic controllers (future use)
├── 📁 utils/                  # Utility functions
│   └── imageProcessor.js     # Image processing with Sharp
├── 📁 uploads/                # File storage
│   ├── images/               # Original uploaded images
│   └── thumbnails/           # Generated thumbnails
├── 📁 server/                 # Core server files
│   ├── index.js              # Main server entry point
│   ├── schema.sql            # Database schema
│   └── seed.sql              # Sample data
├── 📁 0.1.html/              # Frontend HTML files
├── 📁 node_modules/           # Dependencies
├── package.json               # Project configuration
└── README.md                  # Project documentation
```

## 🔧 Key Improvements

### 1. **Modular Architecture**
- **Separation of Concerns**: Each component has a single responsibility
- **Scalability**: Easy to add new features without affecting existing code
- **Maintainability**: Code is organized and easy to navigate
- **Testability**: Individual modules can be tested independently

### 2. **Enhanced Image Handling**
- **File Uploads**: Proper file upload handling with multer
- **Image Processing**: Automatic thumbnail generation with Sharp
- **Storage Management**: Organized file storage with cleanup
- **Validation**: File type and size validation

### 3. **Security Enhancements**
- **JWT Authentication**: Secure token-based authentication
- **Role-Based Access Control**: User, Host, and Admin roles
- **Input Validation**: Comprehensive form and file validation
- **CORS & Helmet**: Security headers and cross-origin protection

### 4. **Database Improvements**
- **Better Schema**: Improved table structure with proper relationships
- **Migration Support**: Automatic database initialization and updates
- **Performance**: Optimized queries with proper indexing
- **Data Integrity**: Foreign key constraints and validation

## 🚀 Getting Started

### Prerequisites
- Node.js 18+ installed
- npm or yarn package manager

### Installation
1. **Install Dependencies**
   ```bash
   npm install
   ```

2. **Environment Setup**
   Create a `.env` file in the root directory:
   ```env
   JWT_SECRET=your-super-secret-jwt-key-change-this-in-production
   NODE_ENV=development
   PORT=8080
   ```

3. **Start the Server**
   ```bash
   npm start
   # or
   node server/index.js
   ```

### Alternative Startup
Use the provided batch file for Windows:
```bash
start-server.bat
```

## 🔑 Default Credentials

### Admin User
- **Email**: admin@smarthostel.com
- **Password**: admin123
- **Role**: Administrator

### Sample Host User
- **Email**: host@example.com
- **Password**: host123
- **Role**: Host

## 📡 API Endpoints

### Authentication (`/api/auth`)
- `POST /register` - User registration
- `POST /login` - User login
- `GET /profile` - Get user profile
- `PUT /profile` - Update user profile
- `PUT /change-password` - Change password

### Listings (`/api/listings`)
- `GET /` - Get all listings with filtering
- `GET /:id` - Get single listing
- `POST /` - Create new listing (hosts only)
- `PUT /:id` - Update listing
- `DELETE /:id` - Delete listing
- `DELETE /:id/images/:imageName` - Delete specific image

### Admin (`/api/admin`)
- `GET /users` - Get all users
- `GET /listings` - Get all listings
- `DELETE /users/:id` - Delete user
- `PUT /users/:id/role` - Update user role
- `GET /stats` - Get system statistics
- `DELETE /listings/:id` - Admin delete listing

## 🖼️ Image Upload Features

### Supported Formats
- JPEG (.jpg, .jpeg)
- PNG (.png)
- WebP (.webp)

### File Limits
- **Maximum file size**: 10MB per image
- **Maximum files**: 10 images per listing
- **Automatic thumbnails**: 300x200px generated automatically

### Image Processing
- **Thumbnail Generation**: Automatic thumbnail creation
- **Optimization**: Image optimization for web display
- **Storage Management**: Organized file storage with cleanup
- **URL Generation**: Automatic URL generation for frontend

## 🔐 Authentication Flow

1. **Registration**: Users create accounts with email/password
2. **Login**: Users authenticate and receive JWT token
3. **Authorization**: Token validated on protected routes
4. **Role Management**: Different access levels based on user role

### User Roles
- **User**: Basic access, can browse and book
- **Host**: Can create and manage listings
- **Admin**: Full system access and management

## 🗄️ Database Schema

### Users Table
```sql
CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  role TEXT DEFAULT 'user' CHECK (role IN ('user', 'host', 'admin')),
  created_at TEXT NOT NULL,
  updated_at TEXT
);
```

### Listings Table
```sql
CREATE TABLE listings (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  price_per_night REAL NOT NULL,
  city TEXT NOT NULL,
  room_type TEXT NOT NULL,
  images TEXT,
  amenities TEXT,
  rules TEXT,
  contact_info TEXT,
  host_id INTEGER NOT NULL,
  status TEXT DEFAULT 'active' CHECK (status IN ('active', 'inactive', 'pending')),
  created_at TEXT NOT NULL,
  updated_at TEXT,
  FOREIGN KEY (host_id) REFERENCES users (id) ON DELETE CASCADE
);
```

### Bookings Table
```sql
CREATE TABLE bookings (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER NOT NULL,
  listing_id INTEGER NOT NULL,
  check_in TEXT NOT NULL,
  check_out TEXT NOT NULL,
  total_price REAL NOT NULL,
  status TEXT DEFAULT 'pending' CHECK (status IN ('pending', 'confirmed', 'cancelled', 'completed')),
  created_at TEXT NOT NULL,
  updated_at TEXT,
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  FOREIGN KEY (listing_id) REFERENCES listings (id) ON DELETE CASCADE
);
```

## 🎯 Frontend Integration

### Image Upload Form
The host onboarding form now includes:
- **Drag & Drop**: Modern file upload interface
- **File Validation**: Size and type checking
- **Preview**: File information display
- **Progress**: Upload status feedback

### Authentication Integration
- **Token Storage**: JWT tokens stored in localStorage
- **Protected Routes**: Automatic redirect for unauthenticated users
- **User Context**: User information available throughout the app

## 🚀 Performance Features

### Database Optimization
- **WAL Mode**: Write-Ahead Logging for better performance
- **Prepared Statements**: Optimized query execution
- **Indexing**: Proper database indexing for fast queries

### Image Optimization
- **Thumbnails**: Fast-loading image previews
- **Compression**: Optimized image storage
- **Lazy Loading**: Efficient image loading

## 🔧 Development Features

### Hot Reloading
```bash
npm run dev
```
Server automatically restarts on file changes.

### Error Handling
- **Comprehensive Logging**: Detailed error tracking
- **Graceful Degradation**: System continues working on non-critical errors
- **User Feedback**: Clear error messages for users

### Port Management
- **Automatic Port Selection**: Server finds available ports automatically
- **Port Conflict Resolution**: Handles port conflicts gracefully
- **Multiple Port Support**: Tries alternative ports if primary is busy

## 📊 Monitoring & Health

### Health Check Endpoint
- **URL**: `/api/health`
- **Response**: System status, uptime, memory usage
- **Database**: Connection status verification

### System Status Dashboard
- **URL**: `/system-status.html`
- **Features**: Real-time system monitoring
- **Metrics**: Performance and health indicators

## 🚀 Future Enhancements

### Planned Features
- **Booking System**: Complete reservation management
- **Payment Integration**: Online payment processing
- **Review System**: User ratings and feedback
- **Notification System**: Email and SMS alerts
- **Mobile App**: React Native mobile application

### Scalability Improvements
- **Microservices**: Service-oriented architecture
- **Load Balancing**: Multiple server instances
- **Caching**: Redis-based caching system
- **CDN**: Content delivery network for images

## 🐛 Troubleshooting

### Common Issues

1. **Port Already in Use**
   - Solution: Server automatically tries alternative ports
   - Manual: Kill existing processes or change PORT in .env

2. **Database Errors**
   - Solution: Delete `server/db.sqlite` and restart
   - Check: Database file permissions

3. **Image Upload Failures**
   - Check: File size and type restrictions
   - Verify: Upload directory permissions
   - Solution: Ensure uploads folder exists

4. **Authentication Issues**
   - Check: JWT_SECRET in environment
   - Verify: Token expiration
   - Solution: Clear localStorage and re-login

### Debug Mode
Set `NODE_ENV=development` in `.env` for detailed error messages.

## 📚 Additional Resources

- **API Documentation**: See individual route files for detailed endpoint information
- **Database Schema**: Check `server/schema.sql` for complete table definitions
- **Frontend Code**: HTML files in `0.1.html/` directory
- **System Status**: Monitor system health at `/system-status.html`

---

This new architecture transforms the Smart Hostel System into a professional, scalable, and maintainable application ready for production use and future growth.
