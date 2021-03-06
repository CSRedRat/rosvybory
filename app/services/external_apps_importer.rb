# При импорте сторонней базы необходимо указывать источник (НО) из следующих значений: ГН ("Гражданин Наблюдатель"), Сонар, Голос.
# Пользователи однозначно идентифицируются по номеру мобильного телефона, существующий пользователь обновляется импортируемыми данными. НО пользователя тоже обновляется наряду с другими данными (да, это может привести к переходу пользователя из одного НО в другой).
# Импортируемые телефон и почта автоматически считаются верифицированными.
# В импортируемых таблицах могут быть пустые ячейки (например, у кого-то может не быть отчества).
# Из столбца "Компетенции" необходимо рассматривать только значения "ЮР" и "АС", т.к. других компетенций у нас пока не заведено.
# Утилита должна выводить для каждой строки, которую не удалось распознать/сохранить, номер строки и хоть какое-то описание причины проблем (понадобится впоследствии, когда будем наворачивать на утилиту web-интерфейс).

class ExternalAppsImporter
  include SpreadsheetParser

  attr_accessor :organisation

  def initialize(file_path, file_type = File.extname(file_path), update_existing = false)
    @file_path = file_path
    @file_type = file_type
    @update_existing = update_existing
  end

  def import
    spreadsheet_rows(@file_path, @file_type).each do |row|
      if (attrs = attributes_from_row(row))
        if (model = build(attrs))
          if block_given?
            yield attrs, model
          else
            persist model
          end
        end
      end
    end
  end

  def build(attrs)
    model = ExcelUserAppRow.new(attrs, @update_existing)
    if model.minimally_valid?
      model.organisation ||= organisation
      model
    else
      logger.warn("Invalid data: #{attrs.inspect}")
      false
    end
  end

  def persist(model)
    ok = model.save
    logger.warn("Error: #{model.errors.inspect}") unless ok
    ok
  end

  private

  def attributes_from_row(row)
    if row.all?(&:blank?)
      nil
    else
      Hash[ExcelUserAppRow.columns.map { |name, i| [name, row[i]] }]
    end
  end

  def logger
    @logger ||= begin
      stamp = Time.now.strftime("%d_%m_%Y_%H_%M")
      Logger.new(Rails.root.join("log/user_apps_xls_import-#{stamp}.log"))
    end
  end
end
