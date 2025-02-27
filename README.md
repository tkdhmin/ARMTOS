# ARMTOS
1. QEMU 실행 (-S -gdb tcp::1234)
먼저, QEMU를 -S -gdb tcp::1234 옵션과 함께 실행하여 GDB 디버깅을 위한 서버를 오픈.
(⚠️ GUI 관련 오류 방지를 위해 -nographic 또는 -display none 추가)

```gdb
qemu-system-arm -M realview-pb-a8 -kernel navilos.axf -S -gdb tcp::1234,ipv4 -nographic
```
이제 QEMU가 실행되었고, GDB가 연결될 때까지 멈춘 상태가 된다.

2. GDB 실행 (gdb-multiarch)
새로운 터미널을 열고 다음 명령을 실행하여 GDB를 실행.
```gdb
gdb-multiarch navilos.axf
```
이후 GDB 프롬프트가 나타남.

3. 원격 타겟 연결
GDB 프롬프트에서 아래 명령을 입력하여 QEMU에 연결.
```gdb
target remote localhost:1234
```

정상적으로 연결되면, 다음과 비슷한 메시지가 출력

```cpp
Remote debugging using localhost:1234
0x00000000 in ?? ()
```

4. QEMU 프로세스 종료
```bash
pkill qemu-system-arm
```