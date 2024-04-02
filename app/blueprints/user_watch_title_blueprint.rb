# frozen_string_literal: true

class UserWatchTitleBlueprint < Blueprinter::Base
    identifier :id

    view :normal do
        fields :watched, :review, :rating
        association :watch_title, blueprint: WatchTitleBlueprint, view: :short
    end
end
