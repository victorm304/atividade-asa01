## Como usar

**Modo de uso:**

~~~
./service.sh <serviço> <ação>
~~~

**Cria um container com serviço de DNS e o inicia**
~~~
./service.sh dns build
~~~

**Cria um container de servidor web e o inicia**

~~~
./service.sh web build
~~~

**Encerra um container em execução**

~~~
./service.sh <serviço> stop
~~~

**Inicia um serviço que está parado**
~~~
./service.sh <serviço> start
~~~


**Remove o container e sua imagem**

~~~
./service.sh <serviço> kill
~~~

**Nota:**
Para que o serviço de DNS funcione corretamente, certifique-se de definir "nameserver 127.0.0.1" em /etc/resolv.conf

