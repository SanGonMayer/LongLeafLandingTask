# app/services/pdf_formatter.rb
module PdfFormatter
  def self.add_section_header(pdf, title)
    pdf.text title, size: 18, style: :bold, color: '006400'
    pdf.move_down 10
  end

  def self.add_table(pdf, data, document_width)
    style_options = {
      width: document_width,
      row_colors: ["E8F5E9", "ffffff"],
      cell_style: {
        border_width: 1,
        borders: [:bottom],
        border_color: "C8E6C9",
        padding: [10, 15],
        inline_format: true
      }
    }

    pdf.table(data, style_options) do |table|
      table.row(0).background_color = "A5D6A7"
      table.row(0).font_style = :bold
      table.column(1).rows(1..-1).font_style = :bold
      table.column(1).rows(1..-1).text_color = "2E7D32"
    end
  end
end
