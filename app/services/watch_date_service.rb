# frozen_string_literal: true

# WatchDateService module
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

  def self.delete_watch_date(username, tmdb_id, date)
    # User.first.user_watch_titles.first.watch_dates.delete(8)

    user = User.find_by(username: username)
    watch_title = WatchTitle.find_by(tmdb_id: tmdb_id)
    user_watch_title = user.user_watch_titles.find_by(watch_title_id: watch_title.id)
    watch_date = user_watch_title.watch_dates.find_by(date: date)
    user_watch_title.watch_dates.delete(watch_date)

    watch_date
  end

  def self.user_watch_dates(params)
    user = User.find_by(username: params[:username])

    user_dates = {}
    response_array = []

    if user.watch_dates.length.positive
      user.watch_dates.reverse_each do |d|
        date = d.date.strftime("%Y-%m-%d")
        titles = []

        d.user_watch_titles.reverse_each do |t|
          titles.push(t.watch_title)
        end

        user_dates[date] = titles
      end

      response_array.push(user_dates)
    end

    response_array
    # TODO: paginate
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

  def self.search_title_dates(params)
    user = User.find_by(username: params[:username])
    search = params[:search]
    watch_titles = WatchTitle.all.select { |w| w.title.downcase.include? search.downcase }
    user_watch_titles = Array.new
    if watch_titles
      watch_titles.each do |t|
        user_watch_titles.push(UserWatchTitle.find_by(user_id: user.id, watch_title_id: t.id))
      end
      # user_watch_title = UserWatchTitle.find_by(user_id: user.id, watch_title_id: watch_title.id)
    end

    title_dates = {}
    response_array = []

    if user_watch_titles
      user_watch_titles.each do |u|
        if u.watch_dates.length.positive
          u.watch_dates.reverse_each do |d|
            date = d.date.strftime("%Y-%m-%d")
            titles = Array.new

            d.user_watch_titles.reverse_each do |t|
              titles.push(t.watch_title)
            end

            title_dates[date] = titles
          end
          response_array.push(title_dates)
        end
      end
    end

    response_array
  end
end