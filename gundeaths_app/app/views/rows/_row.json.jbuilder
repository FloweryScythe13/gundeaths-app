json.extract! row, :id, :year, :hg, :sg, :rf, :other, :combo, :noReport, :unknown, :created_at, :updated_at
json.url row_url(row, format: :json)