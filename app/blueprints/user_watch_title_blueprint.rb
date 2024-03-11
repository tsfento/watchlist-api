# frozen_string_literal: true

class UserWatchTitleBlueprint < Blueprinter::Base
    identifier :id

    view :normal do
        fields :watched, :review
        association :watch_title, blueprint: WatchTitleBlueprint
    end
end
