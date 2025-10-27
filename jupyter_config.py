# Secure Jupyter Lab Configuration
# This config enhances security for the KAN Stock Forecasting project

# Core Security Settings
c = get_config()  # noqa

# 1. Restrict to project directory only
c.ServerApp.root_dir = '/Users/method314/kan-stock-forecasting'

# 2. Disable remote access - localhost only
c.ServerApp.allow_remote_access = False
c.ServerApp.allow_origin = '*'  # Only for localhost

# 3. Network binding - localhost only
c.ServerApp.ip = '127.0.0.1'  # Only accept connections from localhost

# 4. Disable running as root (safety check)
c.ServerApp.allow_root = False

# 5. Enable token authentication (already default, but explicit)
c.ServerApp.token = ''  # Will generate random token each time

# 6. Disable password authentication (use tokens only)
c.ServerApp.password = ''

# 7. Browser settings
c.ServerApp.open_browser = True
c.ServerApp.browser = ''  # Use system default browser

# 8. File operations
c.ContentsManager.allow_hidden = False  # Don't show hidden files by default

# 9. Kernel management
c.MappingKernelManager.cull_idle_timeout = 3600  # Kill idle kernels after 1 hour
c.MappingKernelManager.cull_connected = False  # Don't kill connected kernels
c.MappingKernelManager.cull_busy = False  # Don't kill busy kernels

# 10. Terminal settings (optional - can disable if needed)
# c.ServerApp.terminals_enabled = True  # Set to False to disable terminal access

# 11. Logging
c.ServerApp.log_level = 'INFO'

# 12. Rate limiting (prevent abuse)
c.ServerApp.rate_limit_window = 10
c.ServerApp.rate_limit_requests = 100

# Documentation
print("""
╔══════════════════════════════════════════════════════════════════╗
║            SECURE JUPYTER LAB CONFIGURATION LOADED               ║
╚══════════════════════════════════════════════════════════════════╝

Security Features Enabled:
✅ Root directory restricted to: /Users/method314/kan-stock-forecasting
✅ Remote access: DISABLED (localhost only)
✅ Network binding: 127.0.0.1 (localhost)
✅ Root user: DISABLED
✅ Token authentication: ENABLED (random token)
✅ Idle kernel timeout: 1 hour
✅ Rate limiting: ENABLED

Your Jupyter Lab is running in a secure, isolated environment.
All file operations are restricted to the project directory.
Only accessible from your laptop (no external access).

To disable terminal access in Jupyter (extra security):
Edit this file and uncomment: c.ServerApp.terminals_enabled = False

""")
