@echo off
rem Allan Alves Amancio - 22/09/2023 - Levantando Informacoes sobre Desktop - Seguranca de Dados - 2023.2 - IFPB
chcp 65001
title Varredura de vulnerabilidades

set "ip=169.254.198.115"

for /f "tokens=1-3 delims=/ " %%a in ('echo %date%') do (
    set "day=%%a"
    set "month=%%b"
    set "year=%%c"
)

set "data=%day%-%month%-%year%"
echo %data%

set "relatorioArq=VARREDURA_%data%.txt"
echo Varredura do dia %data% > %relatorioArq%

:menu
cls
echo [1] Verificar atualizacoes do Windows no IP
echo [2] Verificar sessoes ativas no computador atual (como Admin)
echo [3] Verificar hosts NetBIOS do computador atual
echo [4] Verificar portas abertas (Nmap)
echo [5] Verificar contas de usuario
echo [6] Verificar configuracao de firewall
echo [7] Verificar configuracoes de rede do computador atual
echo [8] Verificar compartilhamentos de arquivos
echo [9] Verificar processos em execucao
echo [10] Sair
set /p opcao=Digite o numero da opcao desejada: 

if "%opcao%"=="1" goto :verificar_atualizacoes
if "%opcao%"=="2" goto :verificar_sessoes_computador
if "%opcao%"=="3" goto :verificar_vulnerabilidades
if "%opcao%"=="4" goto :verificar_portas
if "%opcao%"=="5" goto :verificar_contas
if "%opcao%"=="6" goto :verificar_firewall
if "%opcao%"=="7" goto :verificar_registros
if "%opcao%"=="8" goto :verificar_compartilhamentos
if "%opcao%"=="9" goto :verificar_processos
if "%opcao%"=="10" goto :sair

:verificar_atualizacoes
echo Realizando verificacao de atualizacoes do Windows no IP %ip%...
wmic qfe list >> %relatorioArq%
pause
goto :menu

:verificar_sessoes_computador
echo Realizando verificacao de sessoes ativas no computador atual...
net session >> %relatorioArq
pause
goto :menu

:verificar_vulnerabilidades
echo Hosts NetBIOS do computador atual...
nbtstat -c >> %relatorioArq%
pause
goto :menu

:verificar_portas
echo Realizando verificacao de portas abertas...
nmap -p 1-65535 %ip% >> %relatorioArq%
pause
goto :menu

:verificar_contas
echo Realizando verificacao de contas de usuario...
net user >> %relatorioArq%
pause
goto :menu

:verificar_firewall
echo Realizando verificacao de configuracao de firewall...
netsh advfirewall show all >> %relatorioArq%
pause
goto :menu

:verificar_registros
echo Verificando configurações de rede do computador...
ipconfig /all >> %relatorioArq%
pause
goto :menu

:verificar_compartilhamentos
echo Realizando verificacao de compartilhamentos de arquivos...
net share >> %relatorioArq%
pause
goto :menu

:verificar_processos
echo Realizando verificacao de processos em execucao...
tasklist >> %relatorioArq%
pause
goto :menu

:sair
echo Saindo do programa...