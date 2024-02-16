require 'rails_helper'

RSpec.describe WatchTitle, type: :model do
  context 'validation' do
    it 'is not valid without a tmdb_id' do
      watch_title = build(:watch_title, tmdb_id: nil)
      expect(watch_title).not_to be_valid
    end

    it 'is not valid without an imdb_id' do
      watch_title = build(:watch_title, imdb_id: nil)
      expect(watch_title).not_to be_valid
    end

    it 'is not valid without a poster_path' do
      watch_title = build(:watch_title, poster_path: nil)
      expect(watch_title).not_to be_valid
    end

    it 'is not valid without a title' do
      watch_title = build(:watch_title, title: nil)
      expect(watch_title).not_to be_valid
    end

    it 'is not valid without a release_date' do
      watch_title = build(:watch_title, release_date: nil)
      expect(watch_title).not_to be_valid
    end

    it 'is not valid without an overview' do
      watch_title = build(:watch_title, overview: nil)
      expect(watch_title).not_to be_valid
    end

    it 'is not valid without a runtime' do
      watch_title = build(:watch_title, runtime: nil)
      expect(watch_title).not_to be_valid
    end
  end

  context 'uniqueness' do
    it 'is not valid without a unique tmdb_id' do
      watch_title1 = create(:watch_title)
      watch_title2 = build(:watch_title, tmdb_id: watch_title1.tmdb_id)
      expect(watch_title2).not_to be_valid
      expect(watch_title2.errors[:tmdb_id]).to include('has already been taken')
    end

    it 'is not valid without a unique imdb_id' do
      watch_title1 = create(:watch_title)
      watch_title2 = build(:watch_title, imdb_id: watch_title1.imdb_id)
      expect(watch_title2).not_to be_valid
      expect(watch_title2.errors[:imdb_id]).to include('has already been taken')
    end

    it 'is not valid without a unique poster_path' do
      watch_title1 = create(:watch_title)
      watch_title2 = build(:watch_title, poster_path: watch_title1.poster_path)
      expect(watch_title2).not_to be_valid
      expect(watch_title2.errors[:poster_path]).to include('has already been taken')
    end
  end

  context 'dependency destruction' do
  end
end
