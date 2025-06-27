#!/bin/bash

# Каталог для шаблонов
TEMPLATES_DIR="/usr/share/flyfm/templates"
SOURCE_DIR="$TEMPLATES_DIR/.source"

# Создание каталога .source
echo "Создаём каталог $SOURCE_DIR..."
sudo mkdir -p "$SOURCE_DIR"

# Создание файлов шаблонов документов
echo "Создаём файлы шаблонов документов..."
sudo touch "$SOURCE_DIR/new.docx"
sudo touch "$SOURCE_DIR/new.pptx"
sudo touch "$SOURCE_DIR/new.xlsx"

# Создание ярлыка МойОфис Текст
TEXT_DESKTOP="$TEMPLATES_DIR/myoffice-text.desktop"
echo "Создаём ярлык для МойОфис Текст: $TEXT_DESKTOP..."
sudo bash -c "cat > $TEXT_DESKTOP <<EOL
[Desktop Entry]
Name=MyOffice Text Home Edition
Name[ru]=МойОфис Текст
Comment=Enter MyOffice Writer filename: 
Comment[ru]=Введите имя файла для документа МойОфис:
Type=Link
URL=.source/new.docx
Icon=myoffice-text
TryExec=myoffice-text
MimeType=application
EOL"

# Создание ярлыка МойОфис Таблица
SPREADSHEET_DESKTOP="$TEMPLATES_DIR/myoffice-spreadsheet.desktop"
echo "Создаём ярлык для МойОфис Таблица: $SPREADSHEET_DESKTOP..."
sudo bash -c "cat > $SPREADSHEET_DESKTOP <<EOL
[Desktop Entry]
Name=МойОфис Таблица
Name[ru]=МойОфис Таблица
Comment[ru]=Введите имя таблицы МойОфис:
Type=Link
URL=.source/new.xlsx
Icon=myoffice-spreadsheet
TryExec=myoffice-spreadsheet
MimeType=application
EOL"

# Создание ярлыка МойОфис Презентация
PRESENTATION_DESKTOP="$TEMPLATES_DIR/myoffice-presentation.desktop"
echo "Создаём ярлык для МойОфис Презентация: $PRESENTATION_DESKTOP..."
sudo bash -c "cat > $PRESENTATION_DESKTOP <<EOL
[Desktop Entry]
Name=МойОфис Презентация
Name[ru]=МойОфис Презентация
Comment[ru]=Введите имя таблицы МойОфис:
Type=Link
URL=.source/new.pptx
Icon=myoffice-presentation-editor
TryExec=myoffice-presentation-editor
MimeType=application
EOL"

# Завершение
echo "Все действия выполнены."
echo "Сейчас будет выполнен выход из текущей сессии, чтобы изменения вступили в силу."

# Выход из сессии
fly-wmfunc FLYWM_LOGOUT
