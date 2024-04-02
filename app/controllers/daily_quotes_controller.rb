class DailyQuotesController < ApplicationController
    def get_quote
        # TODO replace with Date.today.strftime("%Y-%m-%d")
        quote = DailyQuote.where(date: '2024-04-02')

        if quote
            render json: DailyQuoteBlueprint.render(quote, view: :normal), status: :ok
        else
            render json: quote.errors, status: :unprocessable_entity
        end
    end
end
