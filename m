Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F035295071
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Oct 2020 18:12:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E8FD53C56BB
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Oct 2020 18:12:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id B13FA3C253A
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 18:12:38 +0200 (CEST)
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D609B1400BC3
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 18:12:37 +0200 (CEST)
Received: by mail-il1-x142.google.com with SMTP id p16so3057055ilq.5
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 09:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=4TUU6hGGI9Z94LbatnJF8LAX/xchi+VJPPQ2WB0pkiA=;
 b=X4IV+nUsCYkk1vFe9xS8Jm3ZYugYDe7pbFXAmRInA7rBSgbvuHiayEK+i3chwYxRAV
 BTE0Vl4w70eARrayWkfwMDXCZigXAi/0X0oIcCQtlZgBLdnibFbR4waujxJvAEPZPVGV
 URjmwlV/WaApBIsB6NGSkdet2TRPKDVOmjY5BsIl5cKyxqCDeUXKMZLFz2Sb7teV7cTj
 5zV5skOaIMYXUpp+wJT2CLbz7vnCKWetokTivIBiYHU9FG2DOIym/qGdDHr3iwUb9TDa
 D8rf1ZIU87JzVD7sPqrJANTvBDugPUMAK4zSM+cAr+8BvrRX+gF5WN/MLLKXPBGy/irA
 xNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=4TUU6hGGI9Z94LbatnJF8LAX/xchi+VJPPQ2WB0pkiA=;
 b=KzwbmTPo+I+s+m1vu30nsOOuSta4bW3dI+DlKzeYzywMt27QPklf5JDTcbhmSHnrui
 JwchOCzcsqQk+gXGY3ljWZLm7XekiKxX2zsv1fZTuj9GJFcPsl2uO/UbPa2VMAX3PxVo
 Pu2Nnh2xGJTicGBE5C49a6RBgb2YgsbcWJz1sR6HbEvyYxlVym7TCLEvkD3Ks1gVAiS7
 c3WqaG8RwqArbzMsdSvbKia/xEaIxQvufrfS6LMZWCtpgY2w12amTIgmSHC/Qpbm1tqB
 UAV9rE+oVCFlW5uIA1GqkhhlTWOTzrPzJ7FvQ5G78qbjbJQEGgVUtoWbePejTPCtjypq
 q6Og==
X-Gm-Message-State: AOAM530zM8dhCniM3NMv9VxqKUK+brxHJfVKFyERfcR8J3J+m/DdLgvP
 yyGWcJvGHooaueRo4JNr8gYRQSr5pyIlQ9ehJT5htQ==
X-Google-Smtp-Source: ABdhPJz/ApjGKwRy8S99DcxVGawKQn5hiW1QKCDLCWkbzoXpW83eMI0U2jHt2ZzRsg33h08fQ6RREaznv5WzjW79QLk=
X-Received: by 2002:a05:6e02:664:: with SMTP id
 l4mr3209239ilt.81.1603296756271; 
 Wed, 21 Oct 2020 09:12:36 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 21 Oct 2020 21:42:25 +0530
Message-ID: <CA+G9fYsZJXU+BDkhAXqxq=fq5hNr1RJaenDDW8P4gC6-=Q=dQg@mail.gmail.com>
To: open list <linux-kernel@vger.kernel.org>, linux-m68k@lists.linux-m68k.org, 
 X86 ML <x86@kernel.org>, LTP List <ltp@lists.linux.it>,
 lkft-triage@lists.linaro.org, 
 Linux-Next Mailing List <linux-next@vger.kernel.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] FAIL: LTP: clone08.c:135: FAIL: ctid != getpid() (0 != 1008)
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, zenglg.jy@cn.fujitsu.com,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

LTP syscalls clone08 and clone301 FAILED on x86_64 KASAN enabled build
But tests are getting PASS on Non KASAN build.
This regression started happening from Linux next-20201015 nowards
Please refer to the strace output at the bottom of this email.

There are few more regression on linux next i will share those failure
in a separate email,
 ltp-syscalls-tests:
    * clone08
    * clone301
    * fcntl34
    * fcntl34_64
    * fcntl36
    * fcntl36_64
    * keyctl02
    * rt_tgsigqueueinfo01

metadata:
  git branch: master
  git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git describe: next-20201015
  kernel-config:
https://builds.tuxbuild.com/SCI7Xyjb7V2NbfQ2lbKBZw/kernel.config

steps to reproduce:
  # boot x86_64 with KASAN enabled kernel and run tests
  # cd /opt/ltp/testcases/bin
  # ./clone08
  # ./clone301

clone08:
---------
clone08.c:71: INFO: running CLONE_PARENT
clone08.c:115: PASS: clone and forked child has the same parent
clone08.c:71: INFO: running CLONE_CHILD_SETTID
clone08.c:135: FAIL: ctid != getpid() (0 != 1008)
clone08.c:71: INFO: running CLONE_PARENT_SETTID
clone08.c:145: FAIL: ptid != getpid() (0 != 1009)
clone08.c:71: INFO: running CLONE_THREAD
clone08.c:222: PASS: clone has the same thread id
clone08.c:212: PASS: futex exit on ctid change, ctid: 0

clone301:
----------
clone301.c:159: PASS: Parent got correct signal SIGCHLD
clone301.c:159: PASS: Parent got correct signal SIGUSR2
clone301.c:159: PASS: Parent got correct signal SIGCHLD
clone301.c:159: PASS: Parent got correct signal SIGCHLD
clone301.c:138: FAIL: pidfd_send_signal() failed: EBADF (9)
clone301.c:79: FAIL: Child haven't got signal

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

full test log link,
https://lkft.validation.linaro.org/scheduler/job/1844087

strace output:
+ strace -f ./clone08
execve(\"./clone08\", [\"./clone08\"], 0x7ffe70dccb78 /* 22 vars */) = 0
brk(NULL)                               = 0x2531000
access(\"/etc/ld.so.preload\", R_OK)      = -1 ENOENT (No such file or
directory)
openat(AT_FDCWD, \"/etc/ld.so.cache\", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=19408, ...}) = 0
mmap(NULL, 19408, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f7e61446000
close(3)                                = 0
openat(AT_FDCWD, \"/lib/libc.so.6\", O_RDONLY|O_CLOEXEC) = 3
read(3, \"\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0p\2\0\0\0\0\0\"...,
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=1771456, ...}) = 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x7f7e61444000
mmap(NULL, 3877600, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) = 0x7f7e60e74000
mprotect(0x7f7e6101e000, 2093056, PROT_NONE) = 0
mmap(0x7f7e6121d000, 24576, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1a9000) = 0x7f7e6121d000
mmap(0x7f7e61223000, 15072, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f7e61223000
close(3)                                = 0
arch_prctl(ARCH_SET_FS, 0x7f7e61445580) = 0
mprotect(0x7f7e6121d000, 16384, PROT_READ) = 0
mprotect(0x61c000, 4096, PROT_READ)     = 0
mprotect(0x7f7e6144b000, 4096, PROT_READ) = 0
munmap(0x7f7e61446000, 19408)           = 0
getpid()                                = 525
access(\"/dev/shm\", F_OK)                = 0
getpid()                                = 525
openat(AT_FDCWD, \"/dev/shm/ltp_clone08_525\", O_RDWR|O_CREAT|O_EXCL, 0600) = 3
chmod(\"/dev/shm/ltp_clone08_525\", 0666) = 0
ftruncate(3, 4096)                      = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_SHARED, 3, 0) = 0x7f7e6144a000
unlink(\"/dev/shm/ltp_clone08_525\")      = 0
close(3)                                = 0
rt_sigaction(SIGALRM, {sa_handler=0x403e40, sa_mask=[ALRM],
sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7f7e60ea85b0},
{sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
rt_sigaction(SIGUSR1, {sa_handler=0x403ce0, sa_mask=[USR1],
sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7f7e60ea85b0},
{sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
ioctl(2, TCGETS, {B115200 opost isig icanon echo ...}) = 0
write(2, \"tst_test.c:1246: INFO: [\"..., 64tst_test.c:1246: INFO:
Timeout per run is 0h 05m 00s
) = 64
getpid()                                = 525
alarm(300)                              = 0
rt_sigaction(SIGINT, {sa_handler=0x403df0, sa_mask=[INT],
sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7f7e60ea85b0},
{sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
clone(strace: Process 526 attached
child_stack=NULL,
flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD,
child_tidptr=0x7f7e61445850) = 526
[pid   525] wait4(526,  <unfinished ...>
[pid   526] rt_sigaction(SIGALRM, {sa_handler=SIG_DFL, sa_mask=[ALRM],
sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7f7e60ea85b0},
{sa_handler=0x403e40, sa_mask=[ALRM], sa_flags=SA_RESTORER|SA_RESTART,
sa_restorer=0x7f7e60ea85b0}, 8) = 0
[pid   526] rt_sigaction(SIGUSR1, {sa_handler=SIG_DFL, sa_mask=[USR1],
sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7f7e60ea85b0},
{sa_handler=0x403ce0, sa_mask=[USR1], sa_flags=SA_RESTORER|SA_RESTART,
sa_restorer=0x7f7e60ea85b0}, 8) = 0
[pid   526] rt_sigaction(SIGINT, {sa_handler=SIG_DFL, sa_mask=[INT],
sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7f7e60ea85b0},
{sa_handler=0x403df0, sa_mask=[INT], sa_flags=SA_RESTORER|SA_RESTART,
sa_restorer=0x7f7e60ea85b0}, 8) = 0
[pid   526] setpgid(0, 0)               = 0
[pid   526] clock_gettime(CLOCK_MONOTONIC, {tv_sec=248, tv_nsec=252551861}) = 0
[pid   526] getppid()                   = 525
[pid   526] kill(525, SIGUSR1)          = 0
[pid   525] <... wait4 resumed> 0x7ffc8bca80d8, 0, NULL) = ?
ERESTARTSYS (To be restarted if SA_RESTART is set)
[pid   525] --- SIGUSR1 {si_signo=SIGUSR1, si_code=SI_USER,
si_pid=526, si_uid=0} ---
[pid   525] alarm(300 <unfinished ...>
[pid   526] brk(NULL <unfinished ...>
[pid   525] <... alarm resumed> )       = 300
[pid   526] <... brk resumed> )         = 0x2531000
[pid   525] rt_sigreturn({mask=[]} <unfinished ...>
[pid   526] brk(0x2552000 <unfinished ...>
[pid   525] <... rt_sigreturn resumed> ) = 61
[pid   526] <... brk resumed> )         = 0x2552000
[pid   525] wait4(526,  <unfinished ...>
[pid   526] getpid()                    = 526
[pid   526] mmap(NULL, 1052672, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f7e61343000
[pid   526] getpid()                    = 526
[pid   526] write(2, \"clone08.c:71: INFO: r\"..., 52clone08.c:71:
INFO: running CLONE_PARENT
) = 52
[pid   526] clone(child_stack=NULL,
flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD,
child_tidptr=0x7f7e61445850) = 527
strace: Process 527 attached
[pid   526] wait4(-1,  <unfinished ...>
[pid   527] getppid()                   = 526
[pid   527] clone(strace: Process 528 attached
 <unfinished ...>
[pid   528] getppid( <unfinished ...>
[pid   527] <... clone resumed> child_stack=0x7f7e61443000,
flags=CLONE_PARENT|SIGCHLD) = 528
[pid   528] <... getppid resumed> )     = 526
[pid   527] exit_group(0)               = ?
[pid   528] write(2, \"clone08.c:115: PASS: "..., 75clone08.c:115:
PASS: clone and forked child has the same parent
) = 75
[pid   528] exit(0)                     = ?
[pid   527] +++ exited with 0 +++
[pid   526] <... wait4 resumed> [{WIFEXITED(s) && WEXITSTATUS(s) ==
0}], 0, NULL) = 527
[pid   526] --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED,
si_pid=527, si_uid=0, si_status=0, si_utime=0, si_stime=0} ---
[pid   526] wait4(-1,  <unfinished ...>
[pid   528] +++ exited with 0 +++
[pid   526] <... wait4 resumed> [{WIFEXITED(s) && WEXITSTATUS(s) ==
0}], 0, NULL) = 528
[pid   526] --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED,
si_pid=528, si_uid=0, si_status=0, si_utime=0, si_stime=0} ---
[pid   526] wait4(-1, 0x7ffc8bca809c, 0, NULL) = -1 ECHILD (No child processes)
[pid   526] getpid()                    = 526
[pid   526] wait4(-1, 0x7ffc8bca809c, 0, NULL) = -1 ECHILD (No child processes)
[pid   526] write(2, \"clone08.c:71: INFO: r\"..., 58clone08.c:71:
INFO: running CLONE_CHILD_SETTID
) = 58
[pid   526] clone(strace: Process 529 attached
child_stack=0x7f7e61443000, flags=CLONE_CHILD_SETTID|SIGCHLD,
child_tidptr=0x61d2e4) = 529
[pid   529] getpid( <unfinished ...>
[pid   526] wait4(-1,  <unfinished ...>
[pid   529] <... getpid resumed> )      = 529
[pid   529] getpid()                    = 529
[pid   529] write(2, \"clone08.c:135: FAIL: "..., 60clone08.c:135:
FAIL: ctid != getpid() (0 != 529)
) = 60
[pid   529] exit(0)                     = ?
[pid   529] +++ exited with 0 +++
[pid   526] <... wait4 resumed> [{WIFEXITED(s) && WEXITSTATUS(s) ==
0}], 0, NULL) = 529
[pid   526] --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED,
si_pid=529, si_uid=0, si_status=0, si_utime=0, si_stime=0} ---
[pid   526] wait4(-1, 0x7ffc8bca809c, 0, NULL) = -1 ECHILD (No child processes)
[pid   526] getpid()                    = 526
[pid   526] wait4(-1, 0x7ffc8bca809c, 0, NULL) = -1 ECHILD (No child processes)
[pid   526] write(2, \"clone08.c:71: INFO: r\"..., 59clone08.c:71:
INFO: running CLONE_PARENT_SETTID
) = 59
[pid   526] clone(strace: Process 530 attached
child_stack=0x7f7e61443000,
flags=CLONE_VM|CLONE_PARENT_SETTID|SIGCHLD, parent_tidptr=0x61d2e8) =
530
[pid   530] getpid( <unfinished ...>
[pid   526] wait4(-1,  <unfinished ...>
[pid   530] <... getpid resumed> )      = 530
[pid   530] getpid()                    = 530
[pid   530] write(2, \"clone08.c:145: FAIL: "..., 60clone08.c:145:
FAIL: ptid != getpid() (0 != 530)
) = 60
[pid   530] exit(0)                     = ?
[pid   530] +++ exited with 0 +++
[pid   526] <... wait4 resumed> [{WIFEXITED(s) && WEXITSTATUS(s) ==
0}], 0, NULL) = 530
[pid   526] --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED,
si_pid=530, si_uid=0, si_status=0, si_utime=0, si_stime=0} ---
[pid   526] wait4(-1, 0x7ffc8bca809c, 0, NULL) = -1 ECHILD (No child processes)
[pid   526] getpid()                    = 526

strace output log link,
https://lkft.validation.linaro.org/scheduler/job/1865313#L2121

Test case links:
https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/syscalls/clone/clone08.c
https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/syscalls/clone3/clone301.c

-- 
Linaro LKFT
https://lkft.linaro.org

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
