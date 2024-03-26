# frozen_string_literal: true

class WatchTitleBlueprint < Blueprinter::Base
    identifier :id
    fields :tmdb_id, :title
end
