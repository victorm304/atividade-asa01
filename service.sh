#!/usr/bin/bash

if [ $# -ne 2 ]; then
  echo "Modo de uso: <serviço> <ação>"
  exit 1
fi

servico=$1
acao=$2

# SERVIDOR WEB
if [ "$servico" == "web" ]; then
  if [ "$acao" == "build" ]; then
     docker build -t app-web ./web
     docker run -d --name app-web -p 80:80 app-web
  
  elif [ "$acao" == "start" ]; then
    docker start app-web

  elif [ "$acao" == "stop" ]; then
    docker stop app-web

  elif [ "$acao" == "kill" ]; then
    docker rm app-web
    docker rmi app-web
  
  else
    echo "Modo de uso: <serviço> <ação>"
    exit 1 
  fi

# DNS
elif [ "$servico" == "dns" ]; then
  if [ "$acao" == "build" ]; then
    docker build -t dns-server ./dns
    docker run -d --name dns-server -p 53:53/udp -p 53:53/tcp dns-server
  
  elif [ "$acao" == "start" ]; then
    docker start dns-server
  
  elif [ "$acao" == "stop" ]; then
    docker stop dns-server
  
  elif [ "$acao" == "kill" ]; then
    docker rm dns-server
    docker rmi dns-server
   
  else
    echo "Modo de uso: <serviço> <ação>"
    exit 1
  fi

else
    echo "Modo de uso: <serviço> <ação>"
  exit 1
fi
