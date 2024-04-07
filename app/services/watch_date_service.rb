module WatchDateService
    def self.create_watch_date(date_params, title_params, user_id)
        watch_title = WatchTitle.create_with(title_params).find_or_create_by!(tmdb_id: title_params[:tmdb_id])

        user_watch_title = UserWatchTitle.find_or_create_by!(user_id: user_id, watch_title_id: watch_title.id)
        watch_date = WatchDate.find_or_create_by!(date: date_params[:date])

        # begin rescue https://stackoverflow.com/a/3694229
        # user_watch_title.watch_dates << watch_date unless user_watch_title.watch_dates.include?(watch_date)
        user_watch_title.watch_dates << watch_date
        watch_date
    end

    def self.user_watch_dates(params)
        user = User.find_by(username: params[:username])

        user_dates = Hash.new

        user.watch_dates.reverse_each do |d|
            date = d.date.strftime("%Y-%m-%d")
            titles = Array.new

            d.user_watch_titles.reverse_each do |t|
                titles.push(t.watch_title)
            end

            user_dates[date] = titles
        end

        response_array = Array.new
        response_array.push(user_dates)
        # TODO paginate
    end

    def self.search_watch_date(params)
        user = User.find_by(username: params[:username])

        result_date = Hash.new

        user_date = user.watch_dates.where(date: params[:date])
        if user_date.count != 0
            titles = Array.new

            user_date.first.user_watch_titles.reverse_each do |t|
                titles.push(t.watch_title)
            end

            result_date[params[:date]] = titles

            response_array = Array.new
            response_array.push(result_date)
        else
            user_date
        end
    end
end