module WatchDateService
    def self.create_watch_date(date_params, title_params, user_id)
        if watch_title = WatchTitle.find_by(tmdb_id: title_params[:tmdb_id])
        else
            watch_title = WatchTitle.create(title_params)
        end
        user_watch_title = UserWatchTitle.find_or_create_by(user_id: user_id, watch_title_id: watch_title.id)
        watch_date = WatchDate.find_or_create_by(date: date_params[:date])

        # begin rescue https://stackoverflow.com/a/3694229
        # user_watch_title.watch_dates << watch_date unless user_watch_title.watch_dates.include?(watch_date)
        user_watch_title.watch_dates << watch_date
        watch_date
    end

    def self.user_watch_dates(params)
        user = User.find_by(username: params[:username])

        user_dates = Hash.new

        user.watch_dates.each do |d|
            titles = Array.new

            d.user_watch_titles.each do |t|
                titles.push(t.watch_title)
            end

            user_dates[d.date] = titles
        end

        user_dates.sort_by {|k| k}.reverse
    end
end