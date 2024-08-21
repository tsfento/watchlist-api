# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin Ajax requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # origins "*"
    origins'localhost:4200',
      'localhost:5173',
      'https://watchlist-client-neon.vercel.app',
      'https://watchlist-client-neon.vercel.app',
      'https://watchlist-client-9nwvsh5zp-tyler-fentons-projects.vercel.app'


    resource "*",
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
