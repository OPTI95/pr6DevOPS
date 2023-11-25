# докерфайл для глазяк 0-0

# Базовый образ, на основе которого будет создаваться новый образ. 
# В инструкции FROM задается образ Ubuntu:latest. 
# latest здесь означает последнюю стабильную версию Ubuntu.
FROM ubuntu:latest

# Инструкция RUN позволяет выполнить команды внутри создаваемого образа. 
# В данном случае команда выполняет обновление пакетов операционной системы 
# и устанавливает два пакета: x11-apps (пакет, содержащий набор базовых графических утилит X11) и xauth (утилита для управления списком доступа X server).
# Затем выполнено удаление содержимого каталога /var/lib/apt/lists/ для уменьшения размера образа.
RUN apt-get update && apt-get install -y \
    x11-apps \
    xauth \
    && rm -rf /var/lib/apt/lists/*

# Устанавливает переменную окружения DISPLAY в значение :0. 
# Это означает, что по умолчанию все графические приложения (в контексте X Window System) будут отправлять свой вывод на локальный дисплей.
ENV DISPLAY=:0

# Задает команду, которая будет выполняться при запуске контейнера. 
# В данном случае будет запущена программа xeyes, которая показывает два больших глаза, следящих за курсором мыши.
CMD ["xeyes"]