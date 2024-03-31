#Запустить приложение в Docker с ограничением ресурсов в CPU 1, RAM 1Gb

sudo docker run --name gs1 -m=1g --cpus='1' -p 8080:80 gs:1.0
