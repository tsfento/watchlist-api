# frozen_string_literal: true

class UserBlueprint < Blueprinter::Base
    identifier :id

    view :me do
        fields :username
    end
end
