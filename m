Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 111021611F7
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 13:24:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9D3A53C242F
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 13:24:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 41A7E3C03C2
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 13:24:53 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 74B40600128
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 13:24:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581942289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zUt0kczWUslZmG4vkg0T5H9xl1U5V3iv73iEAxd3i/0=;
 b=hPSwAB/8S6J39zEOdZVEUBS0+WxLvE+2VxlMw1jPV22JhXkT4P541XO9eja7U9mLTHZPLx
 NLcUA4aF0HNDrFEO7iDf1jxEOw8b6psICJmv9C8mxE3THzGZQWFg55WGMyGRU3F2GSDUku
 /mxInREjSvIWBrdlOF+YV51dygjXT7E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-egvh5ts-PeOk9pYSt6EXVA-1; Mon, 17 Feb 2020 07:24:47 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9874107ACCC;
 Mon, 17 Feb 2020 12:24:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C533919E9C;
 Mon, 17 Feb 2020 12:24:45 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id B7E841803C33;
 Mon, 17 Feb 2020 12:24:45 +0000 (UTC)
Date: Mon, 17 Feb 2020 07:24:45 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>
Message-ID: <688644958.7809325.1581942285691.JavaMail.zimbra@redhat.com>
In-Reply-To: <MAXPR0101MB1468A92491FB531F33F10A36EE160@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
References: <MAXPR0101MB14687E3C724A815D2857EA14EE1A0@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
 <333767604.7805569.1581940614115.JavaMail.zimbra@redhat.com>
 <MAXPR0101MB1468A92491FB531F33F10A36EE160@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.5]
Thread-Topic: [LTP] min_free_kbytes.c:134: FAIL: child unexpectedly failed: 139
Thread-Index: AQHV4mZtdlpcIR01/E2nMHLN6pJmPrc5w5Tp8OWOEejzESWd3Q==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: egvh5ts-PeOk9pYSt6EXVA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] min_free_kbytes.c:134: FAIL: child unexpectedly failed:
 139
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0069891769=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0069891769==
Content-Type: multipart/alternative; 
	boundary="----=_Part_7809324_357678073.1581942285690"

------=_Part_7809324_357678073.1581942285690
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----

> Hi,
> sure! i will remeber
> Jan i am using linux 5.4.3 with custom Yocto distribution on RISC v
> architecture.Actually i tried with strace but i didnt got clue for it..

What LTP version is it? This one has different line numbers. 

> This is result with strace

Trace child processes as well: -f 

> root@exaleapsemi:~/pankaj_ltp_new/ltp/testcases/kernel/mem/tunable# strace
> ./min_free_kbytes
> execve("./min_free_kbytes", ["./min_free_kbytes"], 0x3fffaabc80 /* 15 vars
> */) = 0
> brk(NULL) = 0x2c000
> uname({sysname="Linux", nodename="exaleapsemi", ...}) = 0
> faccessat(AT_FDCWD, "/etc/ld.so.preload", R_OK) = -1 ENOENT (No such file or
> directory)
> openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
> fstat(3, {st_mode=S_IFREG|0644, st_size=66866, ...}) = 0
> mmap(NULL, 66866, PROT_READ, MAP_PRIVATE, 3, 0) = 0x3fbe84f000
> close(3) = 0
> openat(AT_FDCWD, "/usr/lib/libnuma.so.1", O_RDONLY|O_CLOEXEC) = 3
> read(3,
> "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\363\0\1\0\0\0\2002\0\0\0\0\0\0"...,
> 832) = 832
> fstat(3, {st_mode=S_IFREG|0755, st_size=35664, ...}) = 0
> mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
> 0x3fbe84d000
> mmap(NULL, 54992, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
> 0x3fbe83f000
> mprotect(0x3fbe846000, 4096, PROT_NONE) = 0
> mmap(0x3fbe847000, 8192, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x7000) = 0x3fbe847000
> mmap(0x3fbe849000, 14032, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x3fbe849000
> close(3) = 0
> openat(AT_FDCWD, "/lib/libpthread.so.0", O_RDONLY|O_CLOEXEC) = 3
> read(3,
> "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\363\0\1\0\0\0\204p\0\0\0\0\0\0"...,
> 832) = 832
> fstat(3, {st_mode=S_IFREG|0755, st_size=89264, ...}) = 0
> mmap(NULL, 107632, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
> 0x3fbe824000
> mprotect(0x3fbe838000, 4096, PROT_NONE) = 0
> mmap(0x3fbe839000, 8192, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x14000) = 0x3fbe839000
> mmap(0x3fbe83b000, 13424, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x3fbe83b000
> close(3) = 0
> openat(AT_FDCWD, "/lib/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
> read(3,
> "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0\363\0\1\0\0\0\2005\2\0\0\0\0\0"...,
> 832) = 832
> fstat(3, {st_mode=S_IFREG|0755, st_size=1061392, ...}) = 0
> mmap(NULL, 1072656, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
> 0x3fbe71e000
> mmap(0x3fbe81b000, 24576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xfc000) = 0x3fbe81b000
> mmap(0x3fbe821000, 11792, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x3fbe821000
> close(3) = 0
> mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
> 0x3fbe71c000
> mprotect(0x3fbe81b000, 12288, PROT_READ) = 0
> mprotect(0x3fbe839000, 4096, PROT_READ) = 0
> mprotect(0x3fbe847000, 4096, PROT_READ) = 0
> mprotect(0x28000, 4096, PROT_READ) = 0
> mprotect(0x3fbe879000, 4096, PROT_READ) = 0
> munmap(0x3fbe84f000, 66866) = 0
> set_tid_address(0x3fbe71c0e0) = 15895
> set_robust_list(0x3fbe71c0f0, 24) = 0
> rt_sigaction(SIGRTMIN, {sa_handler=0x3fbe82ac52, sa_mask=[],
> sa_flags=SA_SIGINFO}, NULL, 8) = 0
> rt_sigaction(SIGRT_1, {sa_handler=0x3fbe82acd2, sa_mask=[],
> sa_flags=SA_RESTART|SA_SIGINFO}, NULL, 8) = 0
> rt_sigprocmask(SIG_UNBLOCK, [RTMIN RT_1], NULL, 8) = 0
> prlimit64(0, RLIMIT_STACK, NULL, {rlim_cur=8192*1024,
> rlim_max=RLIM64_INFINITY}) = 0
> brk(NULL) = 0x2c000
> brk(0x4d000) = 0x4d000
> openat(AT_FDCWD, "/proc/self/status", O_RDONLY) = 3
> fstat(3, {st_mode=S_IFREG|0444, st_size=0, ...}) = 0
> read(3, "Name:\tmin_free_kbytes\nUmask:\t002"..., 1024) = 960
> read(3, "", 1024) = 0
> close(3) = 0
> get_mempolicy(0x3fffcd0b6c, 0x2c920, 33, NULL, 0) = -1 ENOSYS (Function not
> implemented)
> openat(AT_FDCWD, "/sys/devices/system/node",
> O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = -1 ENOENT (No such file or
> directory)
> sched_getaffinity(0, 512, [0, 1, 2, 3]) = 8
> openat(AT_FDCWD, "/sys/devices/system/cpu",
> O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 3
> fstat(3, {st_mode=S_IFDIR|0755, st_size=0, ...}) = 0
> getdents64(3, /* 14 entries */, 32768) = 400
> getdents64(3, /* 0 entries */, 32768) = 0
> close(3) = 0
> openat(AT_FDCWD, "/proc/self/status", O_RDONLY) = 3
> fstat(3, {st_mode=S_IFREG|0444, st_size=0, ...}) = 0
> read(3, "Name:\tmin_free_kbytes\nUmask:\t002"..., 1024) = 960
> read(3, "", 1024) = 0
> close(3) = 0
> getpid() = 15895
> geteuid() = 0
> faccessat(AT_FDCWD, "/dev/shm", F_OK) = 0
> getpid() = 15895
> openat(AT_FDCWD, "/dev/shm/ltp_min_free_kbytes_15895", O_RDWR|O_CREAT|O_EXCL,
> 0600) = 3
> fchmodat(AT_FDCWD, "/dev/shm/ltp_min_free_kbytes_15895", 0666) = 0
> ftruncate(3, 4096) = 0
> mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_SHARED, 3, 0) = 0x3fbe85f000
> unlinkat(AT_FDCWD, "/dev/shm/ltp_min_free_kbytes_15895", 0) = 0
> close(3) = 0
> rt_sigaction(SIGALRM, {sa_handler=0x14f90, sa_mask=[ALRM],
> sa_flags=SA_RESTART}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
> rt_sigaction(SIGUSR1, {sa_handler=0x14e74, sa_mask=[USR1],
> sa_flags=SA_RESTART}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
> ioctl(2, TCGETS, {B38400 opost isig icanon echo ...}) = 0
> write(2, "tst_test.c:1206: \33[1;34mINFO: \33["..., 62tst_test.c:1206: INFO:
> Timeout per run is disabled
> ) = 62
> rt_sigaction(SIGINT, {sa_handler=0x14f54, sa_mask=[INT],
> sa_flags=SA_RESTART}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
> clone(child_stack=NULL,
> flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD,
> child_tidptr=0x3fbe71c0e0) = 15897
> wait4(15897, 0x3fffcd09c8, 0, NULL) = ? ERESTARTSYS (To be restarted if
> SA_RESTART is set)
> --- SIGUSR1 {si_signo=SIGUSR1, si_code=SI_USER, si_pid=15897, si_uid=0} ---
> setitimer(ITIMER_REAL, {it_interval={tv_sec=0, tv_usec=0},
> it_value={tv_sec=0, tv_usec=0}}, {it_interval={tv_sec=0, tv_usec=0},
> it_value={tv_sec=0, tv_usec=0}}) = 0
> rt_sigreturn({mask=[]}mem.c:817: INFO: set overcommit_memory to 2
> mem.c:817: INFO: set min_free_kbytes to 163644
> ) = 15897
> wait4(15897, memfree is 7983108 kB before eatup mem
> memfree is 4128232 kB after eatup mem
> mem.c:817: INFO: set min_free_kbytes to 327288
> memfree is 7982824 kB before eatup mem
> memfree is 4133524 kB after eatup mem
> mem.c:817: INFO: set min_free_kbytes to 163644
> memfree is 7982076 kB before eatup mem
> memfree is 4133776 kB after eatup mem
> mem.c:817: INFO: set overcommit_memory to 0
> mem.c:817: INFO: set min_free_kbytes to 163644
> memfree is 7981320 kB before eatup mem
> min_free_kbytes.c:170: FAIL: child unexpectedly failed: 256
> mem.c:817: INFO: set min_free_kbytes to 327288
> memfree is 8052960 kB before eatup mem
> min_free_kbytes.c:170: FAIL: child unexpectedly failed: 256
> mem.c:817: INFO: set min_free_kbytes to 163644
> memfree is 8052960 kB before eatup mem
> min_free_kbytes.c:170: FAIL: child unexpectedly failed: 256
> mem.c:817: INFO: set overcommit_memory to 1
> mem.c:817: INFO: set min_free_kbytes to 163644
> memfree is 8056456 kB before eatup mem
> min_free_kbytes.c:158: FAIL: child unexpectedly failed: 11
> mem.c:817: INFO: set min_free_kbytes to 327288
> memfree is 8055044 kB before eatup mem
> mem.c:817: INFO: set min_free_kbytes to 163644
> memfree is 8052000 kB before eatup mem
> min_free_kbytes.c:106: PASS: min_free_kbytes test pass
> mem.c:817: INFO: set min_free_kbytes to 163644
> mem.c:817: INFO: set overcommit_memory to 1
> 0x3fffcd09c8, 0, NULL) = ? ERESTARTSYS (To be restarted if SA_RESTART is set)
> --- SIGUSR1 {si_signo=SIGUSR1, si_code=SI_USER, si_pid=15897, si_uid=0} ---
> --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=15897, si_uid=0,
> si_status=0, si_utime=0, si_stime=2} ---
> setitimer(ITIMER_REAL, {it_interval={tv_sec=0, tv_usec=0},
> it_value={tv_sec=0, tv_usec=0}}, {it_interval={tv_sec=0, tv_usec=0},
> it_value={tv_sec=0, tv_usec=0}}) = 0
> rt_sigreturn({mask=[]}) = 15897
> wait4(15897, [{WIFEXITED(s) && WEXITSTATUS(s) == 0}], 0, NULL) = 15897
> setitimer(ITIMER_REAL, {it_interval={tv_sec=0, tv_usec=0},
> it_value={tv_sec=0, tv_usec=0}}, {it_interval={tv_sec=0, tv_usec=0},
> it_value={tv_sec=0, tv_usec=0}}) = 0
> rt_sigaction(SIGINT, {sa_handler=SIG_DFL, sa_mask=[INT],
> sa_flags=SA_RESTART}, {sa_handler=0x14f54, sa_mask=[INT],
> sa_flags=SA_RESTART}, 8) = 0
> fstat(1, {st_mode=S_IFCHR|0620, st_rdev=makedev(0x88, 0), ...}) = 0
> write(1, "\n", 1
> ) = 1
> write(1, "Summary:\n", 9Summary:
> ) = 9
> write(1, "passed 1\n", 11passed 1
> ) = 11
> write(1, "failed 4\n", 11failed 4
> ) = 11
> write(1, "skipped 0\n", 11skipped 0
> ) = 11
> write(1, "warnings 0\n", 11warnings 0
> ) = 11
> faccessat(AT_FDCWD, "/dev/shm/ltp_min_free_kbytes_15895", F_OK) = -1 ENOENT
> (No such file or directory)
> msync(0x3fbe85f000, 4096, MS_SYNC) = 0
> munmap(0x3fbe85f000, 4096) = 0
> exit_group(1) = ?
> +++ exited with 1 +++

> From: Jan Stancek <jstancek@redhat.com>
> Sent: Monday, February 17, 2020 5:26 PM
> To: Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>
> Cc: ltp@lists.linux.it <ltp@lists.linux.it>
> Subject: Re: [LTP] min_free_kbytes.c:134: FAIL: child unexpectedly failed:
> 139

> ----- Original Message -----
> > Hi,
> > i am running min_free_kbytes test,6 test cases are failing with error
> > message
> > min_free_kbytes.c:134: FAIL: child unexpectedly failed: 139.
> > i am attaching the test result

> Hi,

> for future, can you just paste the test output to email, instead of sending
> screenshots of text?

> You're not providing much information, such as LTP version, kernel,
> architecture or distro.
> Or if it worked previously and started failing only now. So it's difficult
> for anyone to
> try reproduce your steps.

> Output is unusual, status codes suggest child running into SIGSEGV and SIGILL
> at some
> point after eatup_mem(). Did you try to run this with gdb, strace or look at
> core files?

> [EXT]

------=_Part_7809324_357678073.1581942285690
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"font-family: times new roman, new york, times, se=
rif; font-size: 12pt; color: #000000"><div><br></div><div><br></div><hr id=
=3D"zwchr"><blockquote style=3D"border-left:2px solid #1010FF;margin-left:5=
px;padding-left:5px;color:#000;font-weight:normal;font-style:normal;text-de=
coration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;"><styl=
e style=3D"display:none;"> P {margin-top:0;margin-bottom:0;} </style><div s=
tyle=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt=
; color: rgb(0, 0, 0);">
Hi,</div><div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; =
font-size: 12pt; color: rgb(0, 0, 0);">
sure! i will remeber <br></div><div style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Jan i am using linux 5.4.3 with custom Yocto distribution on RISC v archite=
cture.Actually i tried with strace but i didnt got clue for it..</div></blo=
ckquote><div>What LTP version is it? This one has different line numbers.<b=
r></div><blockquote style=3D"border-left:2px solid #1010FF;margin-left:5px;=
padding-left:5px;color:#000;font-weight:normal;font-style:normal;text-decor=
ation:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;"><div sty=
le=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; =
color: rgb(0, 0, 0);"><br></div><div style=3D"font-family: Calibri, Arial, =
Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
This is result with strace</div></blockquote><div>Trace child processes as =
well: -f <br></div><blockquote style=3D"border-left:2px solid #1010FF;margi=
n-left:5px;padding-left:5px;color:#000;font-weight:normal;font-style:normal=
;text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt=
;"><div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);"><br></div><div style=3D"font-family: Calib=
ri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);"><s=
pan>root@exaleapsemi:~/pankaj_ltp_new/ltp/testcases/kernel/mem/tunable# str=
ace ./min_free_kbytes<br>
</span><div>execve("./min_free_kbytes", ["./min_free_kbytes"], 0x3fffaabc80=
 /* 15 vars */) =3D 0<br></div><div>brk(NULL) &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 =3D 0x2c000<br></div><div>uname({sysname=3D"Linux", nodename=3D"exaleapsem=
i", ...}) =3D 0<br></div><div>faccessat(AT_FDCWD, "/etc/ld.so.preload", R_O=
K) =3D -1 ENOENT (No such file or directory)<br></div><div>openat(AT_FDCWD,=
 "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) =3D 3<br></div><div>fstat(3, {st_m=
ode=3DS_IFREG|0644, st_size=3D66866, ...}) =3D 0<br></div><div>mmap(NULL, 6=
6866, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0x3fbe84f000<br></div><div>close(3)=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br></div><div>openat(AT_FDCWD, "=
/usr/lib/libnuma.so.1", O_RDONLY|O_CLOEXEC) =3D 3<br></div><div>read(3, "\1=
77ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\363\0\1\0\0\0\2002\0\0\0\0\0\0"..., 832) =
=3D 832<br></div><div>fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D35664, ..=
.}) =3D 0<br></div><div>mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|=
MAP_ANONYMOUS, -1, 0) =3D 0x3fbe84d000<br></div><div>mmap(NULL, 54992, PROT=
_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D 0x3fbe83f000<br></div=
><div>mprotect(0x3fbe846000, 4096, PROT_NONE) =3D 0<br></div><div>mmap(0x3f=
be847000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, =
3, 0x7000) =3D 0x3fbe847000<br></div><div>mmap(0x3fbe849000, 14032, PROT_RE=
AD|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) =3D 0x3fbe849000=
<br></div><div>close(3) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br></div>=
<div>openat(AT_FDCWD, "/lib/libpthread.so.0", O_RDONLY|O_CLOEXEC) =3D 3<br>=
</div><div>read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\363\0\1\0\0\0\204p\=
0\0\0\0\0\0"..., 832) =3D 832<br></div><div>fstat(3, {st_mode=3DS_IFREG|075=
5, st_size=3D89264, ...}) =3D 0<br></div><div>mmap(NULL, 107632, PROT_READ|=
PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D 0x3fbe824000<br></div><div>=
mprotect(0x3fbe838000, 4096, PROT_NONE) =3D 0<br></div><div>mmap(0x3fbe8390=
00, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1=
4000) =3D 0x3fbe839000<br></div><div>mmap(0x3fbe83b000, 13424, PROT_READ|PR=
OT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) =3D 0x3fbe83b000<br><=
/div><div>close(3) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br></div><div>=
openat(AT_FDCWD, "/lib/libc.so.6", O_RDONLY|O_CLOEXEC) =3D 3<br></div><div>=
read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0\363\0\1\0\0\0\2005\2\0\0\0\0\0=
"..., 832) =3D 832<br></div><div>fstat(3, {st_mode=3DS_IFREG|0755, st_size=
=3D1061392, ...}) =3D 0<br></div><div>mmap(NULL, 1072656, PROT_READ|PROT_EX=
EC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D 0x3fbe71e000<br></div><div>mmap(0x=
3fbe81b000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRIT=
E, 3, 0xfc000) =3D 0x3fbe81b000<br></div><div>mmap(0x3fbe821000, 11792, PRO=
T_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) =3D 0x3fbe82=
1000<br></div><div>close(3) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br></=
div><div>mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, =
-1, 0) =3D 0x3fbe71c000<br></div><div>mprotect(0x3fbe81b000, 12288, PROT_RE=
AD) =3D 0<br></div><div>mprotect(0x3fbe839000, 4096, PROT_READ) =3D 0<br></=
div><div>mprotect(0x3fbe847000, 4096, PROT_READ) =3D 0<br></div><div>mprote=
ct(0x28000, 4096, PROT_READ) &nbsp; &nbsp; &nbsp;=3D 0<br></div><div>mprote=
ct(0x3fbe879000, 4096, PROT_READ) =3D 0<br></div><div>munmap(0x3fbe84f000, =
66866) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br></div><div>set_ti=
d_address(0x3fbe71c0e0) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 15895<br></d=
iv><div>set_robust_list(0x3fbe71c0f0, 24) &nbsp; &nbsp; &nbsp; =3D 0<br></d=
iv><div>rt_sigaction(SIGRTMIN, {sa_handler=3D0x3fbe82ac52, sa_mask=3D[], sa=
_flags=3DSA_SIGINFO}, NULL, 8) =3D 0<br></div><div>rt_sigaction(SIGRT_1, {s=
a_handler=3D0x3fbe82acd2, sa_mask=3D[], sa_flags=3DSA_RESTART|SA_SIGINFO}, =
NULL, 8) =3D 0<br></div><div>rt_sigprocmask(SIG_UNBLOCK, [RTMIN RT_1], NULL=
, 8) =3D 0<br></div><div>prlimit64(0, RLIMIT_STACK, NULL, {rlim_cur=3D8192*=
1024, rlim_max=3DRLIM64_INFINITY}) =3D 0<br></div><div>brk(NULL) &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; =3D 0x2c000<br></div><div>brk(0x4d000) &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;=3D 0x4d000<br></div><div>openat(AT_FDCWD, "/proc/self/status", O_RDO=
NLY) =3D 3<br></div><div>fstat(3, {st_mode=3DS_IFREG|0444, st_size=3D0, ...=
}) =3D 0<br></div><div>read(3, "Name:\tmin_free_kbytes\nUmask:\t002"..., 10=
24) =3D 960<br></div><div>read(3, "", 1024) &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br></div><div>close(3) =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br></div><div>get_mempolicy(0x3ff=
fcd0b6c, 0x2c920, 33, NULL, 0) =3D -1 ENOSYS (Function not implemented)<br>=
</div><div>openat(AT_FDCWD, "/sys/devices/system/node", O_RDONLY|O_NONBLOCK=
|O_CLOEXEC|O_DIRECTORY) =3D -1 ENOENT (No such file or directory)<br></div>=
<div>sched_getaffinity(0, 512, [0, 1, 2, 3]) =3D 8<br></div><div>openat(AT_=
FDCWD, "/sys/devices/system/cpu", O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY=
) =3D 3<br></div><div>fstat(3, {st_mode=3DS_IFDIR|0755, st_size=3D0, ...}) =
=3D 0<br></div><div>getdents64(3, /* 14 entries */, 32768) &nbsp;=3D 400<br=
></div><div>getdents64(3, /* 0 entries */, 32768) &nbsp; =3D 0<br></div><di=
v>close(3) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br></div><div>openat(A=
T_FDCWD, "/proc/self/status", O_RDONLY) =3D 3<br></div><div>fstat(3, {st_mo=
de=3DS_IFREG|0444, st_size=3D0, ...}) =3D 0<br></div><div>read(3, "Name:\tm=
in_free_kbytes\nUmask:\t002"..., 1024) =3D 960<br></div><div>read(3, "", 10=
24) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; =3D 0<br></div><div>close(3) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D =
0<br></div><div>getpid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 15895<br><=
/div><div>geteuid() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0<br></div><div>facce=
ssat(AT_FDCWD, "/dev/shm", F_OK) &nbsp; =3D 0<br></div><div>getpid() &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;=3D 15895<br></div><div>openat(AT_FDCWD, "/de=
v/shm/ltp_min_free_kbytes_15895", O_RDWR|O_CREAT|O_EXCL, 0600) =3D 3<br></d=
iv><div>fchmodat(AT_FDCWD, "/dev/shm/ltp_min_free_kbytes_15895", 0666) =3D =
0<br></div><div>ftruncate(3, 4096) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br></div><div>mmap(NULL, 4096, PR=
OT_READ|PROT_WRITE, MAP_SHARED, 3, 0) =3D 0x3fbe85f000<br></div><div>unlink=
at(AT_FDCWD, "/dev/shm/ltp_min_free_kbytes_15895", 0) =3D 0<br></div><div>c=
lose(3) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br></div><div>rt_sigactio=
n(SIGALRM, {sa_handler=3D0x14f90, sa_mask=3D[ALRM], sa_flags=3DSA_RESTART},=
 {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br></div><div=
>rt_sigaction(SIGUSR1, {sa_handler=3D0x14e74, sa_mask=3D[USR1], sa_flags=3D=
SA_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<b=
r></div><div>ioctl(2, TCGETS, {B38400 opost isig icanon echo ...}) =3D 0<br=
></div><div>write(2, "tst_test.c:1206: \33[1;34mINFO: \33["..., 62tst_test.=
c:1206: INFO: Timeout per run is disabled<br></div><div>) =3D 62<br></div><=
div>rt_sigaction(SIGINT, {sa_handler=3D0x14f54, sa_mask=3D[INT], sa_flags=
=3DSA_RESTART}, {sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D =
0<br></div><div>clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLON=
E_CHILD_SETTID|SIGCHLD, child_tidptr=3D0x3fbe71c0e0) =3D 15897<br></div><di=
v>wait4(15897, 0x3fffcd09c8, 0, NULL) &nbsp; &nbsp; =3D ? ERESTARTSYS (To b=
e restarted if SA_RESTART is set)<br></div><div>--- SIGUSR1 {si_signo=3DSIG=
USR1, si_code=3DSI_USER, si_pid=3D15897, si_uid=3D0} ---<br></div><div>seti=
timer(ITIMER_REAL, {it_interval=3D{tv_sec=3D0, tv_usec=3D0}, it_value=3D{tv=
_sec=3D0, tv_usec=3D0}}, {it_interval=3D{tv_sec=3D0, tv_usec=3D0}, it_value=
=3D{tv_sec=3D0, tv_usec=3D0}}) =3D 0<br></div><div>rt_sigreturn({mask=3D[]}=
mem.c:817: INFO: set overcommit_memory to 2<br></div><div>mem.c:817: INFO: =
set min_free_kbytes to 163644<br></div><div>) &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; =3D 15897<br></div><div>wait4(15897, memfree is =
7983108 kB before eatup mem<br></div><div>memfree is 4128232 kB after eatup=
 mem<br></div><div>mem.c:817: INFO: set min_free_kbytes to 327288<br></div>=
<div>memfree is 7982824 kB before eatup mem<br></div><div>memfree is 413352=
4 kB after eatup mem<br></div><div>mem.c:817: INFO: set min_free_kbytes to =
163644<br></div><div>memfree is 7982076 kB before eatup mem<br></div><div>m=
emfree is 4133776 kB after eatup mem<br></div><div>mem.c:817: INFO: set ove=
rcommit_memory to 0<br></div><div>mem.c:817: INFO: set min_free_kbytes to 1=
63644<br></div><div>memfree is 7981320 kB before eatup mem<br></div><div>mi=
n_free_kbytes.c:170: FAIL: child unexpectedly failed: 256<br></div><div>mem=
.c:817: INFO: set min_free_kbytes to 327288<br></div><div>memfree is 805296=
0 kB before eatup mem<br></div><div>min_free_kbytes.c:170: FAIL: child unex=
pectedly failed: 256<br></div><div>mem.c:817: INFO: set min_free_kbytes to =
163644<br></div><div>memfree is 8052960 kB before eatup mem<br></div><div>m=
in_free_kbytes.c:170: FAIL: child unexpectedly failed: 256<br></div><div>me=
m.c:817: INFO: set overcommit_memory to 1<br></div><div>mem.c:817: INFO: se=
t min_free_kbytes to 163644<br></div><div>memfree is 8056456 kB before eatu=
p mem<br></div><div>min_free_kbytes.c:158: FAIL: child unexpectedly failed:=
 11<br></div><div>mem.c:817: INFO: set min_free_kbytes to 327288<br></div><=
div>memfree is 8055044 kB before eatup mem<br></div><div>mem.c:817: INFO: s=
et min_free_kbytes to 163644<br></div><div>memfree is 8052000 kB before eat=
up mem<br></div><div>min_free_kbytes.c:106: PASS: min_free_kbytes test pass=
<br></div><div>mem.c:817: INFO: set min_free_kbytes to 163644<br></div><div=
>mem.c:817: INFO: set overcommit_memory to 1<br></div><div>0x3fffcd09c8, 0,=
 NULL) &nbsp; &nbsp; =3D ? ERESTARTSYS (To be restarted if SA_RESTART is se=
t)<br></div><div>--- SIGUSR1 {si_signo=3DSIGUSR1, si_code=3DSI_USER, si_pid=
=3D15897, si_uid=3D0} ---<br></div><div>--- SIGCHLD {si_signo=3DSIGCHLD, si=
_code=3DCLD_EXITED, si_pid=3D15897, si_uid=3D0, si_status=3D0, si_utime=3D0=
, si_stime=3D2} ---<br></div><div>setitimer(ITIMER_REAL, {it_interval=3D{tv=
_sec=3D0, tv_usec=3D0}, it_value=3D{tv_sec=3D0, tv_usec=3D0}}, {it_interval=
=3D{tv_sec=3D0, tv_usec=3D0}, it_value=3D{tv_sec=3D0, tv_usec=3D0}}) =3D 0<=
br></div><div>rt_sigreturn({mask=3D[]}) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; =3D 15897<br></div><div>wait4(15897, [{WIFEXITED(s) &a=
mp;&amp; WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 15897<br></div><div>setiti=
mer(ITIMER_REAL, {it_interval=3D{tv_sec=3D0, tv_usec=3D0}, it_value=3D{tv_s=
ec=3D0, tv_usec=3D0}}, {it_interval=3D{tv_sec=3D0, tv_usec=3D0}, it_value=
=3D{tv_sec=3D0, tv_usec=3D0}}) =3D 0<br></div><div>rt_sigaction(SIGINT, {sa=
_handler=3DSIG_DFL, sa_mask=3D[INT], sa_flags=3DSA_RESTART}, {sa_handler=3D=
0x14f54, sa_mask=3D[INT], sa_flags=3DSA_RESTART}, 8) =3D 0<br></div><div>fs=
tat(1, {st_mode=3DS_IFCHR|0620, st_rdev=3Dmakedev(0x88, 0), ...}) =3D 0<br>=
</div><div>write(1, "\n", 1<br></div><div>) &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 1<br></div><div>write(1, =
"Summary:\n", 9Summary:<br></div><div>) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; =3D 9<br></div><div>write(1, "passed &nbsp; 1\n", 11passed &n=
bsp; 1<br></div><div>) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 11<br><=
/div><div>write(1, "failed &nbsp; 4\n", 11failed &nbsp; 4<br></div><div>) &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 11<br></div><div>write(1, "skip=
ped &nbsp;0\n", 11skipped &nbsp;0<br></div><div>) &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;=3D 11<br></div><div>write(1, "warnings 0\n", 11warnings 0<=
br></div><div>) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 11<br></div><d=
iv>faccessat(AT_FDCWD, "/dev/shm/ltp_min_free_kbytes_15895", F_OK) =3D -1 E=
NOENT (No such file or directory)<br></div><div>msync(0x3fbe85f000, 4096, M=
S_SYNC) &nbsp; &nbsp; &nbsp;=3D 0<br></div><div>munmap(0x3fbe85f000, 4096) =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0<br></div><div>exit_gr=
oup(1) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; =3D ?<br></div><div>+++ exited with 1 +++<br></div><=
br></div><hr style=3D"display:inline-block;width:98%"><div id=3D"divRplyFwd=
Msg" dir=3D"ltr"><span data-mce-style=3D"font-size: 11pt; color: #000000; f=
ont-family: Calibri, sans-serif;" style=3D"font-size: 11pt; color: #000000;=
 font-family: Calibri, sans-serif;" face=3D"Calibri, sans-serif"><b>From:</=
b> Jan Stancek &lt;jstancek@redhat.com&gt;<br>
<b>Sent:</b> Monday, February 17, 2020 5:26 PM<br>
<b>To:</b> Pankaj Vinadrao Joshi &lt;Pankaj.VJ@exaleapsemi.com&gt;<br>
<b>Cc:</b> ltp@lists.linux.it &lt;ltp@lists.linux.it&gt;<br>
<b>Subject:</b> Re: [LTP] min_free_kbytes.c:134: FAIL: child unexpectedly f=
ailed: 139</span></div><div class=3D"BodyFragment"><span data-mce-style=3D"=
font-size: small;" style=3D"font-size: small;"><span style=3D"font-size:11p=
t;">
<div class=3D"PlainText"><br>
----- Original Message -----<br>
&gt; Hi,<br>
&gt; i am running min_free_kbytes test,6 test cases are failing with error =
message<br>
&gt; min_free_kbytes.c:134: FAIL: child unexpectedly failed: 139.<br>
&gt; i am attaching the test result<br><br>
Hi,<br><br>
for future, can you just paste the test output to email, instead of sending=
 screenshots of text?<br><br>
You're not providing much information, such as LTP version, kernel, archite=
cture or distro.<br>
Or if it worked previously and started failing only now. So it's difficult =
for anyone to<br>
try reproduce your steps.<br><br>
Output is unusual, status codes suggest child running into SIGSEGV and SIGI=
LL at some<br>
point after eatup_mem(). Did you try to run this with gdb, strace or look a=
t core files?<br><br>
[EXT]<br></div>
</span></span></div></blockquote><div><br></div></div></body></html>
------=_Part_7809324_357678073.1581942285690--


--===============0069891769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0069891769==--

