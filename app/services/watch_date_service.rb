module WatchDateService
    def self.create_watch_date(date_params, title_params, user_id)
        watch_title = WatchTitle.find_or_create_by(title_params)
        user_watch_title = UserWatchTitle.find_or_create_by(user_id: user_id, watch_title_id: watch_title.id)
        watch_date = WatchDate.find_or_create_by(date: date_params[:date])

        user_watch_title.watch_dates << watch_date
        watch_date
    end
end