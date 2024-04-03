class DailyQuotesController < ApplicationController
    def get_quote
        quote = DailyQuote.where(date: Date.today.strftime("%Y-%m-%d"))

        if quote.empty?
            quote = [DailyQuote.all.sample]
        end

        render json: DailyQuoteBlueprint.render(quote, view: :normal), status: :ok
    end
end
