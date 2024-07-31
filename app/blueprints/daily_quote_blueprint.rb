# frozen_string_literal: true

# DailyQuoteBlueprint
class DailyQuoteBlueprint < Blueprinter::Base
  identifier :id

  view :normal do
    fields :date, :quote
    association :watch_title, blueprint: WatchTitleBlueprint, view: :long
  end
end
