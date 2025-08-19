# Smart Hostel System - Deployment Guide

## 🚀 Quick Start

### Local Development
```bash
# Windows (Command Prompt)
.\start-server.cmd

# Windows (PowerShell)
node server/index.js

# Linux/Mac
npm start
```

## ✅ Fixed Issues

### 1. 404 NOT_FOUND Error - RESOLVED ✅
**Issue:** The server was showing 404 errors during deployment.

**Root Causes Fixed:**
- **CORS Configuration:** Updated CORS to allow all origins in development mode
- **Missing Environment Variables:** Added comprehensive `.env` file
- **Database Path:** Fixed database path configuration to use existing `server/db.sqlite`

**Solutions Applied:**
- ✅ Updated CORS to be permissive in development
- ✅ Added multiple port configurations (3001, 8080, 8081, etc.)
- ✅ Fixed database path in both `.env` and enhanced database config
- ✅ Added PowerShell execution policy bypass with `.cmd` file
- ✅ Enhanced error handling for bcrypt password comparison

### 2. System Configuration - OPTIMIZED ✅
**Features Added:**
- ✅ Cross-platform compatibility (Windows/Linux/Mac)
- ✅ Automatic port detection and fallback
- ✅ Environment variable configuration
- ✅ Database schema validation and initialization
- ✅ Comprehensive error logging
- ✅ Health check endpoints

## 📍 Server URLs

When your server starts, you'll see these URLs:

```
🚀 Smart Hostel System Server Started Successfully!
📍 Server listening on http://localhost:3001
🔍 Health check: http://localhost:3001/api/health
🏠 Main site: http://localhost:3001/0.1.html/home1.html
🔑 Admin panel: http://localhost:3001/0.1.html/admin.html
📱 Host onboarding: http://localhost:3001/0.1.html/host-onboarding.html
🔍 Explore listings: http://localhost:3001/0.1.html/explore.html
```

## 🔐 Default Login Credentials

### Admin Access
- **Email:** `admin@hostel.com`
- **Password:** `password`

### Sample Host
- **Email:** `host@example.com`
- **Password:** `host123`

## 🛠️ Troubleshooting

### Issue: PowerShell Execution Policy Error
**Error:** "running scripts is disabled on this system"
**Solution:** Use `.\start-server.cmd` instead of `npm start`

### Issue: Port Already in Use
**Error:** "EADDRINUSE"
**Solution:** The server automatically tries alternative ports (8081, 8082, 3000, 5000, 8000)

### Issue: Database Errors
**Error:** "Database initialization failed"
**Solution:** 
- Check if `server/db.sqlite` exists
- Verify database permissions
- Check if port conflicts exist

### Issue: CORS Errors
**Error:** "CORS not allowed from this origin"
**Solution:** ✅ Fixed - Development mode now allows all origins

### Issue: Login Errors
**Error:** "Illegal arguments: string, undefined"
**Solution:** ✅ Fixed - Added null password checks and better error handling

## 🌍 Environment Variables

The `.env` file includes:

```env
# Core Configuration
NODE_ENV=development
PORT=8080
DB_PATH=server/db.sqlite

# CORS (Updated to include all common ports)
CORS_ORIGINS=http://localhost:3000,http://localhost:3001,http://localhost:8080,http://localhost:8081,http://localhost:8082,http://127.0.0.1:3001,https://your-domain.com

# JWT Security
JWT_SECRET=your-very-strong-jwt-secret-key-change-in-production-make-it-at-least-64-characters-long
```

## 📊 System Status

### Health Check
Visit: `http://localhost:3001/api/health`

Expected Response:
```json
{
  "ok": true,
  "status": "healthy",
  "timestamp": "2025-08-19T08:47:00.000Z",
  "database": "connected",
  "uptime": 123.45,
  "memory": {...},
  "version": "v18.x.x"
}
```

### API Endpoints
- ✅ `/api/auth` - Authentication routes
- ✅ `/api/listings` - Hostel listings
- ✅ `/api/bookings` - Booking management
- ✅ `/api/reviews` - Review system
- ✅ `/api/payments` - Stripe integration
- ✅ `/api/uploads` - Image uploads
- ✅ `/api/admin` - Admin panel

## 🔧 Production Deployment

For production deployment:

1. **Update Environment Variables:**
```env
NODE_ENV=production
JWT_SECRET=your-super-secure-64-character-production-secret-key
CORS_ORIGINS=https://yourdomain.com,https://www.yourdomain.com
```

2. **Configure Database:**
```env
DB_PATH=/var/www/hostel/server/db.sqlite
```

3. **Set up Process Manager:**
```bash
# Using PM2
npm install -g pm2
pm2 start server/index.js --name "smart-hostel"
pm2 startup
pm2 save
```

## 📝 File Structure

```
SMART HOSTEL SYSTEM/
├── server/
│   ├── index.js          # Main server file
│   └── db.sqlite         # SQLite database
├── routes/               # API routes
├── middleware/           # Authentication & validation
├── config/               # Database & configuration
├── utils/                # Helper utilities
├── .dist/                # Frontend files
│   └── 0.1.html/         # HTML pages
├── .env                  # Environment variables
└── start-server.cmd      # Windows startup script
```

## ✅ Success Indicators

When everything is working:
1. ✅ Server starts without CORS errors
2. ✅ Database initializes successfully
3. ✅ Health check returns `{"ok": true}`
4. ✅ Admin panel loads at `/0.1.html/admin.html`
5. ✅ Login works with default credentials
6. ✅ API endpoints respond correctly

## 🆘 Support

If you encounter any issues:
1. Check the server logs for error messages
2. Verify all files are in the correct locations
3. Ensure no other applications are using the same ports
4. Check database file permissions
5. Verify environment variables are set correctly

The Smart Hostel System is now fully deployed and ready for use! 🎉
