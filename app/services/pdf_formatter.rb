# app/services/pdf_formatter.rb
module PdfFormatter
  def self.add_logo(pdf)
    # Ajusta la imagen y su tamaño
    pdf.image "#{Rails.root}/app/assets/images/longleaf_lending_logo-8876db04fa683bf88fe05494b2833eab76e7052a01f70454ede211cd01c3ea77-removebg-preview.png", at: [0, pdf.cursor], width: 100
    pdf.move_down 10
  end

  def self.add_section_header(pdf, title)
    pdf.move_down 20
    pdf.text title, size: 18, style: :bold, color: '20212a', align: :center
    pdf.move_down 10
  end

  def self.format_currency(value)
    ActionController::Base.helpers.number_to_currency(value, unit: "$", delimiter: ",", precision: 2)
  end

  def self.add_table(pdf, data, document_width)
    style_options = {
      width: document_width,
      row_colors: ["758150", "e7e7e5"],  # Colores alternados para las filas
      cell_style: {
        border_width: 1,
        borders: [:bottom],
        border_color: "B2B69A",
        padding: [10, 15],
        inline_format: true
      }
    }

    pdf.table(data, style_options) do |table|
      table.row(0).background_color = "858f66" # Encabezado color 758150
      table.row(0).text_color = "20212a"       # Texto del encabezado color 20212a
      table.row(0).font_style = :bold          # Encabezado en negrita

      # Las filas de datos con colores alternados
      (1...table.row_length).each do |i|
        table.row(i).background_color = i.even? ? "b5bba4" : "e7e7e5"
        table.row(i).text_color = "000000"
        table.column(1).rows(1..-1).font_style = :bold
      end
    end
  end
end
