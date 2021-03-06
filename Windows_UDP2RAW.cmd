@echo.
@set PATH=%~dp0;%PATH%

@set SERVER_IP=1.2.3.4
@set PORT=2999
@set PASSWORD=wg2999
@set WG_PORT=8000

@set GATEWAY=192.168.1.1
@route DELETE %SERVER_IP%  && route ADD %SERVER_IP% mask 255.255.255.255 %GATEWAY% METRIC 20
@start /b udp2raw -c -r%SERVER_IP%:%PORT% -l0.0.0.0:8888 -k %PASSWORD% --raw-mode faketcp
@start /b speederv2  -c -l0.0.0.0:%WG_PORT% -r127.0.0.1:8888 -f20:10 -k %PASSWORD% --mode 0

