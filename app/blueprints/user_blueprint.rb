# frozen_string_literal: true

class UserBlueprint < Blueprinter::Base
    identifier :id

    view :me do
        fields :username
        association :user_watch_titles, blueprint: UserWatchTitleBlueprint, view: :normal
    end
end
