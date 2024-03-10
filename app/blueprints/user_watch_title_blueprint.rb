# frozen_string_literal: true

class UserWatchTitleBlueprint < Blueprinter::Base
    identifier :id
    fields :watched, :review
end
