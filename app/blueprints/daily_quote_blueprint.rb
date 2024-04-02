# frozen_string_literal: true

class DailyQuoteBlueprint < Blueprinter::Base
    identifier :id

    view :normal do
        fields :date, :quote
        association :watch_title, blueprint: WatchTitleBlueprint, view: :long
    end
end
