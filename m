Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DA916FC43
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 11:31:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9949F3C253E
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 11:30:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id BB61F3C1ABA
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 11:30:57 +0100 (CET)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E8C0C1402015
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 11:30:51 +0100 (CET)
Received: by mail-pl1-x644.google.com with SMTP id g6so1126645plp.6
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 02:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HrtkXn8AVzvd9+aYmY9nJ/48RIVg47F2u8m3ZPg1zoI=;
 b=WkXOvEu8uM4ZXmEdPHKR73RPb14cXyPjEoL1x9fibTavFJcx5c9sMxFw1yebAk9I5B
 9xtEljaBhwqwLbb5mqkRvh9n9zUUefCfuxBuPObvy1SjBkmWrkiyjN+UaDKzMqgDJQg9
 iVfNZvr5kvJFnxUU8HTALtOw0KotzCOGhzK2CiGd6J/ZHljzqkY7JNkZ2p3g4IB+9rkZ
 vw0gvOxK4sVqopyun28BkyzvdyhPotT7+877Q3eva2ZKuUP9tPwwmkS/IEOLreuXBdnj
 1VKYdtW7MKHSxPSV5FIAHPARoiFdrZ7PeQXGCvFyCXEGHqp7MPHtLbZJGDZEwwaiklpx
 e2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HrtkXn8AVzvd9+aYmY9nJ/48RIVg47F2u8m3ZPg1zoI=;
 b=eh+ZcxaylZrWIW9qieEPI7P/Hu9auxQdEnzV+gpqXN41EjcDgPqTCzaiJNfMa8ivGR
 jU7sAwT6TdCWXhcPYbWXe/DaCaHaMNtLRSs4TDCVNLwJU86HtO5jLxX6Cl10k46eCWVf
 ZmbLjoxzJB4V48sY78xJk8bh2KYdPYlsgT8zPU2ffVkXWwF0N8z8AsYo+phK8V78mprG
 cwOebQUs+ro/b/syX6FshzVqiq6y/JtG+MIsisYPFFLIQgBc7APNVEDjB3ryR6DoKPvf
 N1Jc0hgx4esXrRy/VvGM3N7ArUegMSa7hbzMqMrV0+tiq7LRjF2fIoWxG1HFHcuukemX
 KNMA==
X-Gm-Message-State: APjAAAXBUowkBRS75ttu5qgz5IU+TpwsOe5UUEwLFCb45GYzWofS9p7u
 sBWdm7lShiJhWAICuftSnG0HKbeueXM=
X-Google-Smtp-Source: APXvYqxoxx0p3t99/+nk24R1TFQWzKtrlQpJ2NLiNUZgceuCLk8lh50xbWidpJmH/imn0m5ZcixWQg==
X-Received: by 2002:a17:90a:8c0f:: with SMTP id
 a15mr4585677pjo.86.1582713048352; 
 Wed, 26 Feb 2020 02:30:48 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id a17sm2242524pgv.11.2020.02.26.02.30.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Feb 2020 02:30:47 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 26 Feb 2020 16:00:43 +0530
Message-Id: <7834dc480f13650fdd1bb0c29e3ba989d73883dc.1582713016.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] Get Syscall numbers in sync with latest Linux kernel
 source
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This gets the Syscall numbers in sync with latest kernel source.

As this was performed in some sort of automated way, few extra changes
may be noticed while converting from kernel files to ltp, like a
different format of defining syscalls or removal of obsolete syscalls.

The diff generated against sh.in file is enormous and looks like someone
did a mistake while adding the syscall numbers there as they look to be
mostly incorrect from 220 to 393. They are fixed as a consequence of
this exercise.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/lapi/syscalls/aarch64.in   |  33 ++-
 include/lapi/syscalls/arm.in       |  48 +++-
 include/lapi/syscalls/i386.in      |  89 +++++--
 include/lapi/syscalls/ia64.in      |  21 +-
 include/lapi/syscalls/mips_n32.in  |   3 +
 include/lapi/syscalls/mips_n64.in  |   3 +
 include/lapi/syscalls/mips_o32.in  |   3 +
 include/lapi/syscalls/powerpc.in   |  62 ++++-
 include/lapi/syscalls/powerpc64.in |  60 ++++-
 include/lapi/syscalls/s390.in      | 242 ++++++++++++-------
 include/lapi/syscalls/s390x.in     | 242 ++++++++++++-------
 include/lapi/syscalls/sh.in        | 371 +++++++++++++++--------------
 include/lapi/syscalls/sparc.in     |  59 ++++-
 include/lapi/syscalls/sparc64.in   |  75 +++++-
 include/lapi/syscalls/x86_64.in    |  51 ++++
 15 files changed, 974 insertions(+), 388 deletions(-)

diff --git a/include/lapi/syscalls/aarch64.in b/include/lapi/syscalls/aarch64.in
index 4a3b4981df99..07556933f037 100644
--- a/include/lapi/syscalls/aarch64.in
+++ b/include/lapi/syscalls/aarch64.in
@@ -256,12 +256,17 @@ sendmmsg 269
 process_vm_readv 270
 process_vm_writev 271
 kcmp 272
+finit_module 273
+sched_setattr 274
+sched_getattr 275
+renameat2 276
+seccomp 277
 getrandom 278
 memfd_create 279
 bpf 280
+execveat 281
 userfaultfd 282
 membarrier 283
-execveat 281
 mlock2 284
 copy_file_range 285
 preadv2 286
@@ -269,7 +274,30 @@ pwritev2 287
 pkey_mprotect 288
 pkey_alloc 289
 pkey_free 290
+statx 291
 io_pgetevents 292
+rseq 293
+kexec_file_load 294
+clock_gettime64 403
+clock_settime64 404
+clock_adjtime64 405
+clock_getres_time64 406
+clock_nanosleep_time64 407
+timer_gettime64 408
+timer_settime64 409
+timerfd_gettime64 410
+timerfd_settime64 411
+utimensat_time64 412
+pselect6_time64 413
+ppoll_time64 414
+io_pgetevents_time64 416
+recvmmsg_time64 417
+mq_timedsend_time64 418
+mq_timedreceive_time64 419
+semtimedop_time64 420
+rt_sigtimedwait_time64 421
+futex_time64 422
+sched_rr_get_interval_time64 423
 pidfd_send_signal 424
 io_uring_setup 425
 io_uring_enter 426
@@ -281,4 +309,7 @@ fsconfig 431
 fsmount 432
 fspick 433
 pidfd_open 434
+clone3 435
+openat2 437
+pidfd_getfd 438
 _sysctl 1078
diff --git a/include/lapi/syscalls/arm.in b/include/lapi/syscalls/arm.in
index 8720a982a159..395d53a68f5c 100644
--- a/include/lapi/syscalls/arm.in
+++ b/include/lapi/syscalls/arm.in
@@ -10,21 +10,16 @@ link (__NR_SYSCALL_BASE+  9)
 unlink (__NR_SYSCALL_BASE+ 10)
 execve (__NR_SYSCALL_BASE+ 11)
 chdir (__NR_SYSCALL_BASE+ 12)
-time (__NR_SYSCALL_BASE+ 13)
 mknod (__NR_SYSCALL_BASE+ 14)
 chmod (__NR_SYSCALL_BASE+ 15)
 lchown (__NR_SYSCALL_BASE+ 16)
 lseek (__NR_SYSCALL_BASE+ 19)
 getpid (__NR_SYSCALL_BASE+ 20)
 mount (__NR_SYSCALL_BASE+ 21)
-umount (__NR_SYSCALL_BASE+ 22)
 setuid (__NR_SYSCALL_BASE+ 23)
 getuid (__NR_SYSCALL_BASE+ 24)
-stime (__NR_SYSCALL_BASE+ 25)
 ptrace (__NR_SYSCALL_BASE+ 26)
-alarm (__NR_SYSCALL_BASE+ 27)
 pause (__NR_SYSCALL_BASE+ 29)
-utime (__NR_SYSCALL_BASE+ 30)
 access (__NR_SYSCALL_BASE+ 33)
 nice (__NR_SYSCALL_BASE+ 34)
 sync (__NR_SYSCALL_BASE+ 36)
@@ -59,20 +54,16 @@ sigsuspend (__NR_SYSCALL_BASE+ 72)
 sigpending (__NR_SYSCALL_BASE+ 73)
 sethostname (__NR_SYSCALL_BASE+ 74)
 setrlimit (__NR_SYSCALL_BASE+ 75)
-getrlimit (__NR_SYSCALL_BASE+ 76)
 getrusage (__NR_SYSCALL_BASE+ 77)
 gettimeofday (__NR_SYSCALL_BASE+ 78)
 settimeofday (__NR_SYSCALL_BASE+ 79)
 getgroups (__NR_SYSCALL_BASE+ 80)
 setgroups (__NR_SYSCALL_BASE+ 81)
-select (__NR_SYSCALL_BASE+ 82)
 symlink (__NR_SYSCALL_BASE+ 83)
 readlink (__NR_SYSCALL_BASE+ 85)
 uselib (__NR_SYSCALL_BASE+ 86)
 swapon (__NR_SYSCALL_BASE+ 87)
 reboot (__NR_SYSCALL_BASE+ 88)
-readdir (__NR_SYSCALL_BASE+ 89)
-mmap (__NR_SYSCALL_BASE+ 90)
 munmap (__NR_SYSCALL_BASE+ 91)
 truncate (__NR_SYSCALL_BASE+ 92)
 ftruncate (__NR_SYSCALL_BASE+ 93)
@@ -82,7 +73,6 @@ getpriority (__NR_SYSCALL_BASE+ 96)
 setpriority (__NR_SYSCALL_BASE+ 97)
 statfs (__NR_SYSCALL_BASE+ 99)
 fstatfs (__NR_SYSCALL_BASE+100)
-socketcall (__NR_SYSCALL_BASE+102)
 syslog (__NR_SYSCALL_BASE+103)
 setitimer (__NR_SYSCALL_BASE+104)
 getitimer (__NR_SYSCALL_BASE+105)
@@ -90,11 +80,9 @@ stat (__NR_SYSCALL_BASE+106)
 lstat (__NR_SYSCALL_BASE+107)
 fstat (__NR_SYSCALL_BASE+108)
 vhangup (__NR_SYSCALL_BASE+111)
-syscall (__NR_SYSCALL_BASE+113)
 wait4 (__NR_SYSCALL_BASE+114)
 swapoff (__NR_SYSCALL_BASE+115)
 sysinfo (__NR_SYSCALL_BASE+116)
-ipc (__NR_SYSCALL_BASE+117)
 fsync (__NR_SYSCALL_BASE+118)
 sigreturn (__NR_SYSCALL_BASE+119)
 clone (__NR_SYSCALL_BASE+120)
@@ -113,7 +101,9 @@ sysfs (__NR_SYSCALL_BASE+135)
 personality (__NR_SYSCALL_BASE+136)
 setfsuid (__NR_SYSCALL_BASE+138)
 setfsgid (__NR_SYSCALL_BASE+139)
+_llseek (__NR_SYSCALL_BASE+140)
 getdents (__NR_SYSCALL_BASE+141)
+_newselect (__NR_SYSCALL_BASE+142)
 flock (__NR_SYSCALL_BASE+143)
 msync (__NR_SYSCALL_BASE+144)
 readv (__NR_SYSCALL_BASE+145)
@@ -334,15 +324,23 @@ accept4 (__NR_SYSCALL_BASE+366)
 fanotify_init (__NR_SYSCALL_BASE+367)
 fanotify_mark (__NR_SYSCALL_BASE+368)
 prlimit64 (__NR_SYSCALL_BASE+369)
+name_to_handle_at (__NR_SYSCALL_BASE+370)
+open_by_handle_at (__NR_SYSCALL_BASE+371)
+clock_adjtime (__NR_SYSCALL_BASE+372)
 syncfs (__NR_SYSCALL_BASE+373)
+sendmmsg (__NR_SYSCALL_BASE+374)
+setns (__NR_SYSCALL_BASE+375)
 process_vm_readv (__NR_SYSCALL_BASE+376)
 process_vm_writev (__NR_SYSCALL_BASE+377)
 kcmp (__NR_SYSCALL_BASE+378)
+finit_module (__NR_SYSCALL_BASE+379)
 sched_setattr (__NR_SYSCALL_BASE+380)
 sched_getattr (__NR_SYSCALL_BASE+381)
 renameat2 (__NR_SYSCALL_BASE+382)
+seccomp (__NR_SYSCALL_BASE+383)
 getrandom (__NR_SYSCALL_BASE+384)
 memfd_create (__NR_SYSCALL_BASE+385)
+bpf (__NR_SYSCALL_BASE+386)
 execveat (__NR_SYSCALL_BASE+387)
 userfaultfd (__NR_SYSCALL_BASE+388)
 membarrier (__NR_SYSCALL_BASE+389)
@@ -354,7 +352,30 @@ pkey_mprotect (__NR_SYSCALL_BASE+394)
 pkey_alloc (__NR_SYSCALL_BASE+395)
 pkey_free (__NR_SYSCALL_BASE+396)
 statx (__NR_SYSCALL_BASE+397)
+rseq (__NR_SYSCALL_BASE+398)
 io_pgetevents (__NR_SYSCALL_BASE+399)
+migrate_pages (__NR_SYSCALL_BASE+400)
+kexec_file_load (__NR_SYSCALL_BASE+401)
+clock_gettime64 (__NR_SYSCALL_BASE+403)
+clock_settime64 (__NR_SYSCALL_BASE+404)
+clock_adjtime64 (__NR_SYSCALL_BASE+405)
+clock_getres_time64 (__NR_SYSCALL_BASE+406)
+clock_nanosleep_time64 (__NR_SYSCALL_BASE+407)
+timer_gettime64 (__NR_SYSCALL_BASE+408)
+timer_settime64 (__NR_SYSCALL_BASE+409)
+timerfd_gettime64 (__NR_SYSCALL_BASE+410)
+timerfd_settime64 (__NR_SYSCALL_BASE+411)
+utimensat_time64 (__NR_SYSCALL_BASE+412)
+pselect6_time64 (__NR_SYSCALL_BASE+413)
+ppoll_time64 (__NR_SYSCALL_BASE+414)
+io_pgetevents_time64 (__NR_SYSCALL_BASE+416)
+recvmmsg_time64 (__NR_SYSCALL_BASE+417)
+mq_timedsend_time64 (__NR_SYSCALL_BASE+418)
+mq_timedreceive_time64 (__NR_SYSCALL_BASE+419)
+semtimedop_time64 (__NR_SYSCALL_BASE+420)
+rt_sigtimedwait_time64 (__NR_SYSCALL_BASE+421)
+futex_time64 (__NR_SYSCALL_BASE+422)
+sched_rr_get_interval_time64 (__NR_SYSCALL_BASE+423)
 pidfd_send_signal (__NR_SYSCALL_BASE+424)
 io_uring_setup (__NR_SYSCALL_BASE+425)
 io_uring_enter (__NR_SYSCALL_BASE+426)
@@ -366,3 +387,6 @@ fsconfig (__NR_SYSCALL_BASE+431)
 fsmount (__NR_SYSCALL_BASE+432)
 fspick (__NR_SYSCALL_BASE+433)
 pidfd_open (__NR_SYSCALL_BASE+434)
+clone3 (__NR_SYSCALL_BASE+435)
+openat2 (__NR_SYSCALL_BASE+437)
+pidfd_getfd (__NR_SYSCALL_BASE+438)
diff --git a/include/lapi/syscalls/i386.in b/include/lapi/syscalls/i386.in
index 35162a251e86..d6773abcb061 100644
--- a/include/lapi/syscalls/i386.in
+++ b/include/lapi/syscalls/i386.in
@@ -125,6 +125,7 @@ modify_ldt 123
 adjtimex 124
 mprotect 125
 sigprocmask 126
+create_module 127
 init_module 128
 delete_module 129
 get_kernel_syms 130
@@ -137,7 +138,9 @@ personality 136
 afs_syscall 137
 setfsuid 138
 setfsgid 139
+_llseek 140
 getdents 141
+_newselect 142
 flock 143
 msync 144
 readv 145
@@ -162,6 +165,7 @@ mremap 163
 setresuid 164
 getresuid 165
 vm86 166
+query_module 167
 poll 168
 nfsservctl 169
 setresgid 170
@@ -252,14 +256,14 @@ epoll_wait 256
 remap_file_pages 257
 set_tid_address 258
 timer_create 259
-timer_settime (__NR_timer_create+1)
-timer_gettime (__NR_timer_create+2)
-timer_getoverrun (__NR_timer_create+3)
-timer_delete (__NR_timer_create+4)
-clock_settime (__NR_timer_create+5)
-clock_gettime (__NR_timer_create+6)
-clock_getres (__NR_timer_create+7)
-clock_nanosleep (__NR_timer_create+8)
+timer_settime 260
+timer_gettime 261
+timer_getoverrun 262
+timer_delete 263
+clock_settime 264
+clock_gettime 265
+clock_getres 266
+clock_nanosleep 267
 statfs64 268
 fstatfs64 269
 tgkill 270
@@ -270,11 +274,11 @@ mbind 274
 get_mempolicy 275
 set_mempolicy 276
 mq_open 277
-mq_unlink (__NR_mq_open+1)
-mq_timedsend (__NR_mq_open+2)
-mq_timedreceive (__NR_mq_open+3)
-mq_notify (__NR_mq_open+4)
-mq_getsetattr (__NR_mq_open+5)
+mq_unlink 278
+mq_timedsend 279
+mq_timedreceive 280
+mq_notify 281
+mq_getsetattr 282
 kexec_load 283
 waitid 284
 add_key 286
@@ -332,17 +336,39 @@ recvmmsg 337
 fanotify_init 338
 fanotify_mark 339
 prlimit64 340
+name_to_handle_at 341
+open_by_handle_at 342
+clock_adjtime 343
 syncfs 344
+sendmmsg 345
+setns 346
 process_vm_readv 347
 process_vm_writev 348
 kcmp 349
+finit_module 350
 sched_setattr 351
 sched_getattr 352
-renameat2 354
+renameat2 353
+seccomp 354
 getrandom 355
 memfd_create 356
 bpf 357
 execveat 358
+socket 359
+socketpair 360
+bind 361
+connect 362
+listen 363
+accept4 364
+getsockopt 365
+setsockopt 366
+getsockname 367
+getpeername 368
+sendto 369
+sendmsg 370
+recvfrom 371
+recvmsg 372
+shutdown 373
 userfaultfd 374
 membarrier 375
 mlock2 376
@@ -353,7 +379,39 @@ pkey_mprotect 380
 pkey_alloc 381
 pkey_free 382
 statx 383
+arch_prctl 384
 io_pgetevents 385
+rseq 386
+semget 393
+semctl 394
+shmget 395
+shmctl 396
+shmat 397
+shmdt 398
+msgget 399
+msgsnd 400
+msgrcv 401
+msgctl 402
+clock_gettime64 403
+clock_settime64 404
+clock_adjtime64 405
+clock_getres_time64 406
+clock_nanosleep_time64 407
+timer_gettime64 408
+timer_settime64 409
+timerfd_gettime64 410
+timerfd_settime64 411
+utimensat_time64 412
+pselect6_time64 413
+ppoll_time64 414
+io_pgetevents_time64 416
+recvmmsg_time64 417
+mq_timedsend_time64 418
+mq_timedreceive_time64 419
+semtimedop_time64 420
+rt_sigtimedwait_time64 421
+futex_time64 422
+sched_rr_get_interval_time64 423
 pidfd_send_signal 424
 io_uring_setup 425
 io_uring_enter 426
@@ -365,3 +423,6 @@ fsconfig 431
 fsmount 432
 fspick 433
 pidfd_open 434
+clone3 435
+openat2 437
+pidfd_getfd 438
diff --git a/include/lapi/syscalls/ia64.in b/include/lapi/syscalls/ia64.in
index 9e491b54bded..f5c437814b30 100644
--- a/include/lapi/syscalls/ia64.in
+++ b/include/lapi/syscalls/ia64.in
@@ -19,6 +19,7 @@ getpid 1041
 getppid 1042
 mount 1043
 umount 1044
+umount2 1044
 setuid 1045
 getuid 1046
 geteuid 1047
@@ -139,6 +140,7 @@ sched_rr_get_interval 1167
 nanosleep 1168
 nfsservctl 1169
 prctl 1170
+old_getpagesize 1171
 mmap2 1172
 pciconfig_read 1173
 pciconfig_write 1174
@@ -293,23 +295,38 @@ recvmmsg 1322
 fanotify_init 1323
 fanotify_mark 1324
 prlimit64 1325
+name_to_handle_at 1326
+open_by_handle_at 1327
+clock_adjtime 1328
 syncfs 1329
+setns 1330
+sendmmsg 1331
 process_vm_readv 1332
 process_vm_writev 1333
+accept4 1334
+finit_module 1335
+sched_setattr 1336
+sched_getattr 1337
 renameat2 1338
 getrandom 1339
 memfd_create 1340
+bpf 1341
+execveat 1342
 userfaultfd 1343
 membarrier 1344
-execveat 1342
+kcmp 1345
 mlock2 1346
 copy_file_range 1347
 preadv2 1348
 pwritev2 1349
+statx 1350
 io_pgetevents 1351
+perf_event_open 1352
+seccomp 1353
 pkey_mprotect 1354
 pkey_alloc 1355
 pkey_free 1356
+rseq 1357
 pidfd_send_signal 1448
 io_uring_setup 1449
 io_uring_enter 1450
@@ -321,3 +338,5 @@ fsconfig 1455
 fsmount 1456
 fspick 1457
 pidfd_open 1458
+openat2 1461
+pidfd_getfd 1462
diff --git a/include/lapi/syscalls/mips_n32.in b/include/lapi/syscalls/mips_n32.in
index 25dc020d1e70..eb6140ebc480 100644
--- a/include/lapi/syscalls/mips_n32.in
+++ b/include/lapi/syscalls/mips_n32.in
@@ -361,3 +361,6 @@ fsconfig 431
 fsmount 432
 fspick 433
 pidfd_open 434
+clone3 435
+openat2 437
+pidfd_getfd 438
diff --git a/include/lapi/syscalls/mips_n64.in b/include/lapi/syscalls/mips_n64.in
index 68ba6f1a048f..5480aa3c9c66 100644
--- a/include/lapi/syscalls/mips_n64.in
+++ b/include/lapi/syscalls/mips_n64.in
@@ -337,3 +337,6 @@ fsconfig 431
 fsmount 432
 fspick 433
 pidfd_open 434
+clone3 435
+openat2 437
+pidfd_getfd 438
diff --git a/include/lapi/syscalls/mips_o32.in b/include/lapi/syscalls/mips_o32.in
index 505bfd8db59e..feee8fbf359d 100644
--- a/include/lapi/syscalls/mips_o32.in
+++ b/include/lapi/syscalls/mips_o32.in
@@ -407,3 +407,6 @@ fsconfig 431
 fsmount 432
 fspick 433
 pidfd_open 434
+clone3 435
+openat2 437
+pidfd_getfd 438
diff --git a/include/lapi/syscalls/powerpc.in b/include/lapi/syscalls/powerpc.in
index af31bf929319..cdbebc62d9c1 100644
--- a/include/lapi/syscalls/powerpc.in
+++ b/include/lapi/syscalls/powerpc.in
@@ -125,6 +125,7 @@ modify_ldt 123
 adjtimex 124
 mprotect 125
 sigprocmask 126
+create_module 127
 init_module 128
 delete_module 129
 get_kernel_syms 130
@@ -137,7 +138,9 @@ personality 136
 afs_syscall 137
 setfsuid 138
 setfsgid 139
+_llseek 140
 getdents 141
+_newselect 142
 flock 143
 msync 144
 readv 145
@@ -161,6 +164,7 @@ nanosleep 162
 mremap 163
 setresuid 164
 getresuid 165
+query_module 166
 poll 167
 nfsservctl 168
 setresgid 169
@@ -338,30 +342,70 @@ sendmsg 341
 recvmsg 342
 recvmmsg 343
 accept4 344
-syscalls 345
+name_to_handle_at 345
+open_by_handle_at 346
+clock_adjtime 347
 syncfs 348
-process_vm_readv  351
+sendmmsg 349
+setns 350
+process_vm_readv 351
 process_vm_writev 352
+finit_module 353
 kcmp 354
 sched_setattr 355
 sched_getattr 356
 renameat2 357
+seccomp 358
 getrandom 359
 memfd_create 360
+bpf 361
+execveat 362
+switch_endian 363
 userfaultfd 364
 membarrier 365
-execveat 362
 mlock2 378
 copy_file_range 379
 preadv2 380
 pwritev2 381
+kexec_file_load 382
 statx 383
-io_pgetevents 388
-pidfd_send_signal 424
-pidfd_open 434
-pkey_mprotect 386
 pkey_alloc 384
 pkey_free 385
+pkey_mprotect 386
+rseq 387
+io_pgetevents 388
+semtimedop 392
+semget 393
+semctl 394
+shmget 395
+shmctl 396
+shmat 397
+shmdt 398
+msgget 399
+msgsnd 400
+msgrcv 401
+msgctl 402
+clock_gettime64 403
+clock_settime64 404
+clock_adjtime64 405
+clock_getres_time64 406
+clock_nanosleep_time64 407
+timer_gettime64 408
+timer_settime64 409
+timerfd_gettime64 410
+timerfd_settime64 411
+utimensat_time64 412
+pselect6_time64 413
+ppoll_time64 414
+io_pgetevents_time64 416
+recvmmsg_time64 417
+mq_timedsend_time64 418
+mq_timedreceive_time64 419
+semtimedop_time64 420
+rt_sigtimedwait_time64 421
+futex_time64 422
+sched_rr_get_interval_time64 423
+pidfd_send_signal 424
 io_uring_setup 425
 io_uring_enter 426
 io_uring_register 427
@@ -371,3 +415,7 @@ fsopen 430
 fsconfig 431
 fsmount 432
 fspick 433
+pidfd_open 434
+clone3 435
+openat2 437
+pidfd_getfd 438
diff --git a/include/lapi/syscalls/powerpc64.in b/include/lapi/syscalls/powerpc64.in
index 2c1f105c1a9e..cdbebc62d9c1 100644
--- a/include/lapi/syscalls/powerpc64.in
+++ b/include/lapi/syscalls/powerpc64.in
@@ -125,6 +125,7 @@ modify_ldt 123
 adjtimex 124
 mprotect 125
 sigprocmask 126
+create_module 127
 init_module 128
 delete_module 129
 get_kernel_syms 130
@@ -137,7 +138,9 @@ personality 136
 afs_syscall 137
 setfsuid 138
 setfsgid 139
+_llseek 140
 getdents 141
+_newselect 142
 flock 143
 msync 144
 readv 145
@@ -161,6 +164,7 @@ nanosleep 162
 mremap 163
 setresuid 164
 getresuid 165
+query_module 166
 poll 167
 nfsservctl 168
 setresgid 169
@@ -338,25 +342,69 @@ sendmsg 341
 recvmsg 342
 recvmmsg 343
 accept4 344
-syscalls 345
+name_to_handle_at 345
+open_by_handle_at 346
+clock_adjtime 347
 syncfs 348
-process_vm_readv  351
+sendmmsg 349
+setns 350
+process_vm_readv 351
 process_vm_writev 352
+finit_module 353
 kcmp 354
 sched_setattr 355
 sched_getattr 356
 renameat2 357
+seccomp 358
 getrandom 359
 memfd_create 360
+bpf 361
+execveat 362
+switch_endian 363
 userfaultfd 364
 membarrier 365
-execveat 362
 mlock2 378
 copy_file_range 379
 preadv2 380
 pwritev2 381
+kexec_file_load 382
 statx 383
+pkey_alloc 384
+pkey_free 385
+pkey_mprotect 386
+rseq 387
 io_pgetevents 388
+semtimedop 392
+semget 393
+semctl 394
+shmget 395
+shmctl 396
+shmat 397
+shmdt 398
+msgget 399
+msgsnd 400
+msgrcv 401
+msgctl 402
+clock_gettime64 403
+clock_settime64 404
+clock_adjtime64 405
+clock_getres_time64 406
+clock_nanosleep_time64 407
+timer_gettime64 408
+timer_settime64 409
+timerfd_gettime64 410
+timerfd_settime64 411
+utimensat_time64 412
+pselect6_time64 413
+ppoll_time64 414
+io_pgetevents_time64 416
+recvmmsg_time64 417
+mq_timedsend_time64 418
+mq_timedreceive_time64 419
+semtimedop_time64 420
+rt_sigtimedwait_time64 421
+futex_time64 422
+sched_rr_get_interval_time64 423
 pidfd_send_signal 424
 io_uring_setup 425
 io_uring_enter 426
@@ -368,6 +416,6 @@ fsconfig 431
 fsmount 432
 fspick 433
 pidfd_open 434
-pkey_mprotect 386
-pkey_alloc 384
-pkey_free 385
+clone3 435
+openat2 437
+pidfd_getfd 438
diff --git a/include/lapi/syscalls/s390.in b/include/lapi/syscalls/s390.in
index c23db6514fa6..dfb7ee811195 100644
--- a/include/lapi/syscalls/s390.in
+++ b/include/lapi/syscalls/s390.in
@@ -10,12 +10,17 @@ link 9
 unlink 10
 execve 11
 chdir 12
+time 13
 mknod 14
 chmod 15
+lchown 16
 lseek 19
 getpid 20
 mount 21
 umount 22
+setuid 23
+getuid 24
+stime 25
 ptrace 26
 alarm 27
 pause 29
@@ -31,7 +36,11 @@ dup 41
 pipe 42
 times 43
 brk 45
+setgid 46
+getgid 47
 signal 48
+geteuid 49
+getegid 50
 acct 51
 umount2 52
 ioctl 54
@@ -45,13 +54,18 @@ getppid 64
 getpgrp 65
 setsid 66
 sigaction 67
+setreuid 70
+setregid 71
 sigsuspend 72
 sigpending 73
 sethostname 74
 setrlimit 75
+getrlimit 76
 getrusage 77
 gettimeofday 78
 settimeofday 79
+getgroups 80
+setgroups 81
 symlink 83
 readlink 85
 uselib 86
@@ -63,10 +77,12 @@ munmap 91
 truncate 92
 ftruncate 93
 fchmod 94
+fchown 95
 getpriority 96
 setpriority 97
 statfs 99
 fstatfs 100
+ioperm 101
 socketcall 102
 syslog 103
 setitimer 104
@@ -89,6 +105,7 @@ uname 122
 adjtimex 124
 mprotect 125
 sigprocmask 126
+create_module 127
 init_module 128
 delete_module 129
 get_kernel_syms 130
@@ -99,7 +116,12 @@ bdflush 134
 sysfs 135
 personality 136
 afs_syscall 137
+setfsuid 138
+setfsgid 139
+_llseek 140
 getdents 141
+_newselect 142
+select 142
 flock 143
 msync 144
 readv 145
@@ -121,8 +143,13 @@ sched_get_priority_min 160
 sched_rr_get_interval 161
 nanosleep 162
 mremap 163
+setresuid 164
+getresuid 165
+query_module 167
 poll 168
 nfsservctl 169
+setresgid 170
+getresgid 171
 prctl 172
 rt_sigreturn 173
 rt_sigaction 174
@@ -133,6 +160,7 @@ rt_sigqueueinfo 178
 rt_sigsuspend 179
 pread64 180
 pwrite64 181
+chown 182
 getcwd 183
 capget 184
 capset 185
@@ -141,11 +169,59 @@ sendfile 187
 getpmsg 188
 putpmsg 189
 vfork 190
+ugetrlimit 191
+getrlimit 191
+mmap2 192
+truncate64 193
+ftruncate64 194
+stat64 195
+lstat64 196
+fstat64 197
+lchown32 198
+lchown 198
+getuid32 199
+getuid 199
+getgid32 200
+getgid 200
+geteuid32 201
+geteuid 201
+getegid32 202
+getegid 202
+setreuid32 203
+setreuid 203
+setregid32 204
+setregid 204
+getgroups32 205
+getgroups 205
+setgroups32 206
+setgroups 206
+fchown32 207
+fchown 207
+setresuid32 208
+setresuid 208
+getresuid32 209
+getresuid 209
+setresgid32 210
+setresgid 210
+getresgid32 211
+getresgid 211
+chown32 212
+chown 212
+setuid32 213
+setuid 213
+setgid32 214
+setgid 214
+setfsuid32 215
+setfsuid 215
+setfsgid32 216
+setfsgid 216
 pivot_root 217
 mincore 218
 madvise 219
 getdents64 220
+fcntl64 221
 readahead 222
+sendfile64 223
 setxattr 224
 lsetxattr 225
 fsetxattr 226
@@ -176,17 +252,21 @@ epoll_wait 251
 set_tid_address 252
 fadvise64 253
 timer_create 254
-timer_settime (__NR_timer_create+1)
-timer_gettime (__NR_timer_create+2)
-timer_getoverrun (__NR_timer_create+3)
-timer_delete (__NR_timer_create+4)
-clock_settime (__NR_timer_create+5)
-clock_gettime (__NR_timer_create+6)
-clock_getres (__NR_timer_create+7)
-clock_nanosleep (__NR_timer_create+8)
+timer_settime 255
+timer_gettime 256
+timer_getoverrun 257
+timer_delete 258
+clock_settime 259
+clock_gettime 260
+clock_getres 261
+clock_nanosleep 262
+fadvise64_64 264
 statfs64 265
 fstatfs64 266
 remap_file_pages 267
+mbind 268
+get_mempolicy 269
+set_mempolicy 270
 mq_open 271
 mq_unlink 272
 mq_timedsend 273
@@ -203,11 +283,14 @@ ioprio_get 283
 inotify_init 284
 inotify_add_watch 285
 inotify_rm_watch 286
+migrate_pages 287
 openat 288
 mkdirat 289
 mknodat 290
 fchownat 291
 futimesat 292
+fstatat64 293
+newfstatat 293
 unlinkat 294
 renameat 295
 linkat 296
@@ -224,6 +307,7 @@ splice 306
 sync_file_range 307
 tee 308
 vmsplice 309
+move_pages 310
 getcpu 311
 epoll_pwait 312
 utimes 313
@@ -248,102 +332,89 @@ perf_event_open 331
 fanotify_init 332
 fanotify_mark 333
 prlimit64 334
-time 13
-lchown 16
-setuid 23
-getuid 24
-stime 25
-setgid 46
-getgid 47
-geteuid 49
-getegid 50
-setreuid 70
-setregid 71
-getrlimit 76
-getgroups 80
-setgroups 81
-fchown 95
-ioperm 101
-setfsuid 138
-setfsgid 139
-setresuid 164
-getresuid 165
-setresgid 170
-getresgid 171
-chown 182
-ugetrlimit 191
-mmap2 192
-truncate64 193
-ftruncate64 194
-stat64 195
-lstat64 196
-fstat64 197
-lchown32 198
-getuid32 199
-getgid32 200
-geteuid32 201
-getegid32 202
-setreuid32 203
-setregid32 204
-getgroups32 205
-setgroups32 206
-fchown32 207
-setresuid32 208
-getresuid32 209
-setresgid32 210
-getresgid32 211
-chown32 212
-setuid32 213
-setgid32 214
-setfsuid32 215
-setfsgid32 216
-fcntl64 221
-sendfile64 223
-fadvise64_64 264
-fstatat64 293
-select 142
-getrlimit 191
-lchown 198
-getuid 199
-getgid 200
-geteuid 201
-getegid 202
-setreuid 203
-setregid 204
-getgroups 205
-setgroups 206
-fchown 207
-setresuid 208
-getresuid 209
-setresgid 210
-getresgid 211
-chown 212
-setuid 213
-setgid 214
-setfsuid 215
-setfsgid 216
-newfstatat 293
+name_to_handle_at 335
+open_by_handle_at 336
+clock_adjtime 337
 syncfs 338
+setns 339
 process_vm_readv 340
 process_vm_writev 341
+s390_runtime_instr 342
 kcmp 343
+finit_module 344
 sched_setattr 345
 sched_getattr 346
 renameat2 347
+seccomp 348
 getrandom 349
 memfd_create 350
 bpf 351
+s390_pci_mmio_write 352
+s390_pci_mmio_read 353
+execveat 354
 userfaultfd 355
 membarrier 356
-execveat 354
+recvmmsg 357
+sendmmsg 358
+socket 359
+socketpair 360
+bind 361
+connect 362
+listen 363
+accept4 364
+getsockopt 365
+setsockopt 366
+getsockname 367
+getpeername 368
+sendto 369
+sendmsg 370
+recvfrom 371
+recvmsg 372
+shutdown 373
 mlock2 374
 copy_file_range 375
 preadv2 376
 pwritev2 377
+s390_guarded_storage 378
+statx 379
+s390_sthyi 380
+kexec_file_load 381
 io_pgetevents 382
+rseq 383
 pkey_mprotect 384
 pkey_alloc 385
 pkey_free 386
+semtimedop 392
+semget 393
+semctl 394
+shmget 395
+shmctl 396
+shmat 397
+shmdt 398
+msgget 399
+msgsnd 400
+msgrcv 401
+msgctl 402
+clock_gettime64 403
+clock_settime64 404
+clock_adjtime64 405
+clock_getres_time64 406
+clock_nanosleep_time64 407
+timer_gettime64 408
+timer_settime64 409
+timerfd_gettime64 410
+timerfd_settime64 411
+utimensat_time64 412
+pselect6_time64 413
+ppoll_time64 414
+io_pgetevents_time64 416
+recvmmsg_time64 417
+mq_timedsend_time64 418
+mq_timedreceive_time64 419
+semtimedop_time64 420
+rt_sigtimedwait_time64 421
+futex_time64 422
+sched_rr_get_interval_ti 423
 pidfd_send_signal 424
 io_uring_setup 425
 io_uring_enter 426
@@ -355,3 +426,6 @@ fsconfig 431
 fsmount 432
 fspick 433
 pidfd_open 434
+clone3 435
+openat2 437
+pidfd_getfd 438
diff --git a/include/lapi/syscalls/s390x.in b/include/lapi/syscalls/s390x.in
index 1acd488a20bc..dfb7ee811195 100644
--- a/include/lapi/syscalls/s390x.in
+++ b/include/lapi/syscalls/s390x.in
@@ -10,12 +10,17 @@ link 9
 unlink 10
 execve 11
 chdir 12
+time 13
 mknod 14
 chmod 15
+lchown 16
 lseek 19
 getpid 20
 mount 21
 umount 22
+setuid 23
+getuid 24
+stime 25
 ptrace 26
 alarm 27
 pause 29
@@ -31,7 +36,11 @@ dup 41
 pipe 42
 times 43
 brk 45
+setgid 46
+getgid 47
 signal 48
+geteuid 49
+getegid 50
 acct 51
 umount2 52
 ioctl 54
@@ -45,13 +54,18 @@ getppid 64
 getpgrp 65
 setsid 66
 sigaction 67
+setreuid 70
+setregid 71
 sigsuspend 72
 sigpending 73
 sethostname 74
 setrlimit 75
+getrlimit 76
 getrusage 77
 gettimeofday 78
 settimeofday 79
+getgroups 80
+setgroups 81
 symlink 83
 readlink 85
 uselib 86
@@ -63,10 +77,12 @@ munmap 91
 truncate 92
 ftruncate 93
 fchmod 94
+fchown 95
 getpriority 96
 setpriority 97
 statfs 99
 fstatfs 100
+ioperm 101
 socketcall 102
 syslog 103
 setitimer 104
@@ -89,6 +105,7 @@ uname 122
 adjtimex 124
 mprotect 125
 sigprocmask 126
+create_module 127
 init_module 128
 delete_module 129
 get_kernel_syms 130
@@ -99,7 +116,12 @@ bdflush 134
 sysfs 135
 personality 136
 afs_syscall 137
+setfsuid 138
+setfsgid 139
+_llseek 140
 getdents 141
+_newselect 142
+select 142
 flock 143
 msync 144
 readv 145
@@ -121,8 +143,13 @@ sched_get_priority_min 160
 sched_rr_get_interval 161
 nanosleep 162
 mremap 163
+setresuid 164
+getresuid 165
+query_module 167
 poll 168
 nfsservctl 169
+setresgid 170
+getresgid 171
 prctl 172
 rt_sigreturn 173
 rt_sigaction 174
@@ -133,6 +160,7 @@ rt_sigqueueinfo 178
 rt_sigsuspend 179
 pread64 180
 pwrite64 181
+chown 182
 getcwd 183
 capget 184
 capset 185
@@ -141,11 +169,59 @@ sendfile 187
 getpmsg 188
 putpmsg 189
 vfork 190
+ugetrlimit 191
+getrlimit 191
+mmap2 192
+truncate64 193
+ftruncate64 194
+stat64 195
+lstat64 196
+fstat64 197
+lchown32 198
+lchown 198
+getuid32 199
+getuid 199
+getgid32 200
+getgid 200
+geteuid32 201
+geteuid 201
+getegid32 202
+getegid 202
+setreuid32 203
+setreuid 203
+setregid32 204
+setregid 204
+getgroups32 205
+getgroups 205
+setgroups32 206
+setgroups 206
+fchown32 207
+fchown 207
+setresuid32 208
+setresuid 208
+getresuid32 209
+getresuid 209
+setresgid32 210
+setresgid 210
+getresgid32 211
+getresgid 211
+chown32 212
+chown 212
+setuid32 213
+setuid 213
+setgid32 214
+setgid 214
+setfsuid32 215
+setfsuid 215
+setfsgid32 216
+setfsgid 216
 pivot_root 217
 mincore 218
 madvise 219
 getdents64 220
+fcntl64 221
 readahead 222
+sendfile64 223
 setxattr 224
 lsetxattr 225
 fsetxattr 226
@@ -176,17 +252,21 @@ epoll_wait 251
 set_tid_address 252
 fadvise64 253
 timer_create 254
-timer_settime (__NR_timer_create+1)
-timer_gettime (__NR_timer_create+2)
-timer_getoverrun (__NR_timer_create+3)
-timer_delete (__NR_timer_create+4)
-clock_settime (__NR_timer_create+5)
-clock_gettime (__NR_timer_create+6)
-clock_getres (__NR_timer_create+7)
-clock_nanosleep (__NR_timer_create+8)
+timer_settime 255
+timer_gettime 256
+timer_getoverrun 257
+timer_delete 258
+clock_settime 259
+clock_gettime 260
+clock_getres 261
+clock_nanosleep 262
+fadvise64_64 264
 statfs64 265
 fstatfs64 266
 remap_file_pages 267
+mbind 268
+get_mempolicy 269
+set_mempolicy 270
 mq_open 271
 mq_unlink 272
 mq_timedsend 273
@@ -203,11 +283,14 @@ ioprio_get 283
 inotify_init 284
 inotify_add_watch 285
 inotify_rm_watch 286
+migrate_pages 287
 openat 288
 mkdirat 289
 mknodat 290
 fchownat 291
 futimesat 292
+fstatat64 293
+newfstatat 293
 unlinkat 294
 renameat 295
 linkat 296
@@ -224,6 +307,7 @@ splice 306
 sync_file_range 307
 tee 308
 vmsplice 309
+move_pages 310
 getcpu 311
 epoll_pwait 312
 utimes 313
@@ -248,100 +332,89 @@ perf_event_open 331
 fanotify_init 332
 fanotify_mark 333
 prlimit64 334
-time 13
-lchown 16
-setuid 23
-getuid 24
-stime 25
-setgid 46
-getgid 47
-geteuid 49
-getegid 50
-setreuid 70
-setregid 71
-getrlimit 191
-getgroups 80
-setgroups 81
-fchown 95
-ioperm 101
-setfsuid 138
-setfsgid 139
-setresuid 164
-getresuid 165
-setresgid 170
-getresgid 171
-chown 182
-mmap2 192
-truncate64 193
-ftruncate64 194
-stat64 195
-lstat64 196
-fstat64 197
-lchown32 198
-getuid32 199
-getgid32 200
-geteuid32 201
-getegid32 202
-setreuid32 203
-setregid32 204
-getgroups32 205
-setgroups32 206
-fchown32 207
-setresuid32 208
-getresuid32 209
-setresgid32 210
-getresgid32 211
-chown32 212
-setuid32 213
-setgid32 214
-setfsuid32 215
-setfsgid32 216
-fcntl64 221
-sendfile64 223
-fadvise64_64 264
-fstatat64 293
-select 142
-getrlimit 191
-lchown 198
-getuid 199
-getgid 200
-geteuid 201
-getegid 202
-setreuid 203
-setregid 204
-getgroups 205
-setgroups 206
-fchown 207
-setresuid 208
-getresuid 209
-setresgid 210
-getresgid 211
-chown 212
-setuid 213
-setgid 214
-setfsuid 215
-setfsgid 216
-newfstatat 293
+name_to_handle_at 335
+open_by_handle_at 336
+clock_adjtime 337
 syncfs 338
+setns 339
 process_vm_readv 340
 process_vm_writev 341
+s390_runtime_instr 342
 kcmp 343
+finit_module 344
 sched_setattr 345
 sched_getattr 346
 renameat2 347
+seccomp 348
 getrandom 349
 memfd_create 350
+bpf 351
+s390_pci_mmio_write 352
+s390_pci_mmio_read 353
+execveat 354
 userfaultfd 355
 membarrier 356
-execveat 354
+recvmmsg 357
+sendmmsg 358
+socket 359
+socketpair 360
+bind 361
+connect 362
+listen 363
+accept4 364
+getsockopt 365
+setsockopt 366
+getsockname 367
+getpeername 368
+sendto 369
+sendmsg 370
+recvfrom 371
+recvmsg 372
+shutdown 373
 mlock2 374
 copy_file_range 375
 preadv2 376
 pwritev2 377
+s390_guarded_storage 378
+statx 379
+s390_sthyi 380
+kexec_file_load 381
 io_pgetevents 382
+rseq 383
 pkey_mprotect 384
 pkey_alloc 385
 pkey_free 386
+semtimedop 392
+semget 393
+semctl 394
+shmget 395
+shmctl 396
+shmat 397
+shmdt 398
+msgget 399
+msgsnd 400
+msgrcv 401
+msgctl 402
+clock_gettime64 403
+clock_settime64 404
+clock_adjtime64 405
+clock_getres_time64 406
+clock_nanosleep_time64 407
+timer_gettime64 408
+timer_settime64 409
+timerfd_gettime64 410
+timerfd_settime64 411
+utimensat_time64 412
+pselect6_time64 413
+ppoll_time64 414
+io_pgetevents_time64 416
+recvmmsg_time64 417
+mq_timedsend_time64 418
+mq_timedreceive_time64 419
+semtimedop_time64 420
+rt_sigtimedwait_time64 421
+futex_time64 422
+sched_rr_get_interval_ti 423
 pidfd_send_signal 424
 io_uring_setup 425
 io_uring_enter 426
@@ -353,3 +426,6 @@ fsconfig 431
 fsmount 432
 fspick 433
 pidfd_open 434
+clone3 435
+openat2 437
+pidfd_getfd 438
diff --git a/include/lapi/syscalls/sh.in b/include/lapi/syscalls/sh.in
index 0b06313ae3fc..06055ed106d5 100644
--- a/include/lapi/syscalls/sh.in
+++ b/include/lapi/syscalls/sh.in
@@ -15,7 +15,6 @@ time 13
 mknod 14
 chmod 15
 lchown 16
-break 17
 oldstat 18
 lseek 19
 getpid 20
@@ -29,11 +28,8 @@ alarm 27
 oldfstat 28
 pause 29
 utime 30
-stty 31
-gtty 32
 access 33
 nice 34
-ftime 35
 sync 36
 kill 37
 rename 38
@@ -42,7 +38,6 @@ rmdir 40
 dup 41
 pipe 42
 times 43
-prof 44
 brk 45
 setgid 46
 getgid 47
@@ -51,13 +46,9 @@ geteuid 49
 getegid 50
 acct 51
 umount2 52
-lock 53
 ioctl 54
 fcntl 55
-mpx 56
 setpgid 57
-ulimit 58
-oldolduname 59
 umask 60
 chroot 61
 ustat 62
@@ -80,7 +71,6 @@ gettimeofday 78
 settimeofday 79
 getgroups 80
 setgroups 81
-select 82
 symlink 83
 oldlstat 84
 readlink 85
@@ -96,10 +86,8 @@ fchmod 94
 fchown 95
 getpriority 96
 setpriority 97
-profil 98
 statfs 99
 fstatfs 100
-ioperm 101
 socketcall 102
 syslog 103
 setitimer 104
@@ -108,10 +96,7 @@ stat 106
 lstat 107
 fstat 108
 olduname 109
-iopl 110
 vhangup 111
-idle 112
-vm86old 113
 wait4 114
 swapoff 115
 sysinfo 116
@@ -127,17 +112,17 @@ mprotect 125
 sigprocmask 126
 init_module 128
 delete_module 129
-get_kernel_syms 130
 quotactl 131
 getpgid 132
 fchdir 133
 bdflush 134
 sysfs 135
 personality 136
-afs_syscall 137
 setfsuid 138
 setfsgid 139
+_llseek 140
 getdents 141
+_newselect 142
 flock 143
 msync 144
 readv 145
@@ -161,7 +146,6 @@ nanosleep 162
 mremap 163
 setresuid 164
 getresuid 165
-vm86 166
 poll 168
 nfsservctl 169
 setresgid 170
@@ -182,8 +166,6 @@ capget 184
 capset 185
 sigaltstack 186
 sendfile 187
-streams1 188
-streams2 189
 vfork 190
 ugetrlimit 191
 mmap2 192
@@ -214,162 +196,197 @@ setfsgid32 216
 pivot_root 217
 mincore 218
 madvise 219
-socket 220
-bind 221
-connect 222
-listen 223
-accept 224
-getsockname 225
-getpeername 226
-socketpair 227
-send 228
-sendto 229
-recv 230
-recvfrom 231
-shutdown 232
-setsockopt 233
-getsockopt 234
-sendmsg 235
-recvmsg 236
-semop 237
-semget 238
-semctl 239
-msgsnd 240
-msgrcv 241
-msgget 242
-msgctl 243
-shmatcall 244
-shmdt 245
-shmget 246
-shmctl 247
-getdents64 248
-fcntl64 249
-gettid 252
-readahead 253
-setxattr 254
-lsetxattr 255
-fsetxattr 256
-getxattr 257
-lgetxattr 258
-fgetxattr 269
-listxattr 260
-llistxattr 261
-flistxattr 262
-removexattr 263
-lremovexattr 264
-fremovexattr 265
-tkill 266
-sendfile64 267
-futex 268
-sched_setaffinity 269
-sched_getaffinity 270
-set_thread_area 271
-get_thread_area 272
-io_setup 273
-io_destroy 274
-io_getevents 275
-io_submit 276
-io_cancel 277
-fadvise64 278
-exit_group 280
-lookup_dcookie 281
-epoll_create 282
-epoll_ctl 283
-epoll_wait 284
-remap_file_pages 285
-set_tid_address 286
-timer_create 287
-timer_settime (__NR_timer_create+1)
-timer_gettime (__NR_timer_create+2)
-timer_getoverrun (__NR_timer_create+3)
-timer_delete (__NR_timer_create+4)
-clock_settime (__NR_timer_create+5)
-clock_gettime (__NR_timer_create+6)
-clock_getres (__NR_timer_create+7)
-clock_nanosleep (__NR_timer_create+8)
-statfs64 296
-fstatfs64 297
-tgkill 298
-utimes 299
-fadvise64_64 300
-vserver 301
-mbind 302
-get_mempolicy 303
-set_mempolicy 304
-mq_open 305
-mq_unlink (__NR_mq_open+1)
-mq_timedsend (__NR_mq_open+2)
-mq_timedreceive (__NR_mq_open+3)
-mq_notify (__NR_mq_open+4)
-mq_getsetattr (__NR_mq_open+5)
-kexec_load 311
-waitid 312
-add_key 313
-request_key 314
-keyctl 315
-ioprio_set 316
-ioprio_get 317
-inotify_init 318
-inotify_add_watch 319
-inotify_rm_watch 320
-migrate_pages 322
-openat 323
-mkdirat 324
-mknodat 325
-fchownat 326
-futimesat 327
-fstatat64 328
-unlinkat 329
-renameat 330
-linkat 331
-symlinkat 332
-readlinkat 333
-fchmodat 334
-faccessat 335
-pselect6 336
-ppoll 337
-unshare 338
-set_robust_list 339
-get_robust_list 340
-splice 341
-sync_file_range 342
-tee 343
-vmsplice 344
-move_pages 345
-getcpu 346
-epoll_pwait 347
-utimensat 348
-signalfd 349
-timerfd_create 350
-eventfd 351
-fallocate 352
-timerfd_settime 353
-timerfd_gettime 354
-signalfd4 355
-eventfd2 356
-epoll_create1 357
-dup3 358
-pipe2 359
-inotify_init1 360
-preadv 361
-pwritev 362
-rt_tgsigqueueinfo 363
-perf_event_open 364
-recvmmsg 365
-accept4 366
-fanotify_init 367
-fanotify_mark 368
-prlimit64 369
-syncfs 373
-process_vm_readv 376
-process_vm_writev 377
-kcmp 378
-memfd_create 385
-execveat 387
-mlock2 390
-copy_file_range 391
-preadv2 392
-pwritev2 393
+getdents64 220
+fcntl64 221
+gettid 224
+readahead 225
+setxattr 226
+lsetxattr 227
+fsetxattr 228
+getxattr 229
+lgetxattr 230
+fgetxattr 231
+listxattr 232
+llistxattr 233
+flistxattr 234
+removexattr 235
+lremovexattr 236
+fremovexattr 237
+tkill 238
+sendfile64 239
+futex 240
+sched_setaffinity 241
+sched_getaffinity 242
+io_setup 245
+io_destroy 246
+io_getevents 247
+io_submit 248
+io_cancel 249
+fadvise64 250
+exit_group 252
+lookup_dcookie 253
+epoll_create 254
+epoll_ctl 255
+epoll_wait 256
+remap_file_pages 257
+set_tid_address 258
+timer_create 259
+timer_settime 260
+timer_gettime 261
+timer_getoverrun 262
+timer_delete 263
+clock_settime 264
+clock_gettime 265
+clock_getres 266
+clock_nanosleep 267
+statfs64 268
+fstatfs64 269
+tgkill 270
+utimes 271
+fadvise64_64 272
+mbind 274
+get_mempolicy 275
+set_mempolicy 276
+mq_open 277
+mq_unlink 278
+mq_timedsend 279
+mq_timedreceive 280
+mq_notify 281
+mq_getsetattr 282
+kexec_load 283
+waitid 284
+add_key 285
+request_key 286
+keyctl 287
+ioprio_set 288
+ioprio_get 289
+inotify_init 290
+inotify_add_watch 291
+inotify_rm_watch 292
+migrate_pages 294
+openat 295
+mkdirat 296
+mknodat 297
+fchownat 298
+futimesat 299
+fstatat64 300
+unlinkat 301
+renameat 302
+linkat 303
+symlinkat 304
+readlinkat 305
+fchmodat 306
+faccessat 307
+pselect6 308
+ppoll 309
+unshare 310
+set_robust_list 311
+get_robust_list 312
+splice 313
+sync_file_range 314
+tee 315
+vmsplice 316
+move_pages 317
+getcpu 318
+epoll_pwait 319
+utimensat 320
+signalfd 321
+timerfd_create 322
+eventfd 323
+fallocate 324
+timerfd_settime 325
+timerfd_gettime 326
+signalfd4 327
+eventfd2 328
+epoll_create1 329
+dup3 330
+pipe2 331
+inotify_init1 332
+preadv 333
+pwritev 334
+rt_tgsigqueueinfo 335
+perf_event_open 336
+fanotify_init 337
+fanotify_mark 338
+prlimit64 339
+socket 340
+bind 341
+connect 342
+listen 343
+accept 344
+getsockname 345
+getpeername 346
+socketpair 347
+send 348
+sendto 349
+recv 350
+recvfrom 351
+shutdown 352
+setsockopt 353
+getsockopt 354
+sendmsg 355
+recvmsg 356
+recvmmsg 357
+accept4 358
+name_to_handle_at 359
+open_by_handle_at 360
+clock_adjtime 361
+syncfs 362
+sendmmsg 363
+setns 364
+process_vm_readv 365
+process_vm_writev 366
+kcmp 367
+finit_module 368
+sched_getattr 369
+sched_setattr 370
+renameat2 371
+seccomp 372
+getrandom 373
+memfd_create 374
+bpf 375
+execveat 376
+userfaultfd 377
+membarrier 378
+mlock2 379
+copy_file_range 380
+preadv2 381
+pwritev2 382
+statx 383
+pkey_mprotect 384
+pkey_alloc 385
+pkey_free 386
+rseq 387
+semget 393
+semctl 394
+shmget 395
+shmctl 396
+shmat 397
+shmdt 398
+msgget 399
+msgsnd 400
+msgrcv 401
+msgctl 402
+clock_gettime64 403
+clock_settime64 404
+clock_adjtime64 405
+clock_getres_time64 406
+clock_nanosleep_time64 407
+timer_gettime64 408
+timer_settime64 409
+timerfd_gettime64 410
+timerfd_settime64 411
+utimensat_time64 412
+pselect6_time64 413
+ppoll_time64 414
+io_pgetevents_time64 416
+recvmmsg_time64 417
+mq_timedsend_time64 418
+mq_timedreceive_time64 419
+semtimedop_time64 420
+rt_sigtimedwait_time64 421
+futex_time64 422
+sched_rr_get_interval_time64 423
 pidfd_send_signal 424
 io_uring_setup 425
 io_uring_enter 426
@@ -381,3 +398,5 @@ fsconfig 431
 fsmount 432
 fspick 433
 pidfd_open 434
+openat2 437
+pidfd_getfd 438
diff --git a/include/lapi/syscalls/sparc.in b/include/lapi/syscalls/sparc.in
index 9a8b8d03860e..9c4f5089bbe2 100644
--- a/include/lapi/syscalls/sparc.in
+++ b/include/lapi/syscalls/sparc.in
@@ -50,8 +50,8 @@ signal 48
 geteuid 49
 getegid 50
 acct 51
-getgid32 53
 memory_ordering 52
+getgid32 53
 ioctl 54
 reboot 55
 mmap2 56
@@ -115,6 +115,7 @@ setresuid 108
 getresuid 109
 setresgid 110
 getresgid 111
+setregid 112
 recvmsg 113
 sendmsg 114
 getgroups32 115
@@ -186,6 +187,7 @@ flistxattr 180
 removexattr 181
 lremovexattr 182
 sigpending 183
+query_module 184
 setpgid 185
 fremovexattr 186
 tkill 187
@@ -222,6 +224,7 @@ clone 217
 ioprio_get 218
 adjtimex 219
 sigprocmask 220
+create_module 221
 delete_module 222
 get_kernel_syms 223
 getpgid 224
@@ -230,12 +233,13 @@ sysfs 226
 afs_syscall 227
 setfsuid 228
 setfsgid 229
-time 231
+_newselect 230
 time 231
 splice 232
 stime 233
 statfs64 234
 fstatfs64 235
+_llseek 236
 mlock 237
 munlock 238
 mlockall 239
@@ -266,6 +270,7 @@ timer_gettime 263
 timer_getoverrun 264
 timer_delete 265
 timer_create 266
+vserver 267
 io_setup 268
 io_destroy 269
 io_submit 270
@@ -330,25 +335,71 @@ recvmmsg 328
 fanotify_init 329
 fanotify_mark 330
 prlimit64 331
+name_to_handle_at 332
+open_by_handle_at 333
+clock_adjtime 334
 syncfs 335
+sendmmsg 336
+setns 337
 process_vm_readv 338
 process_vm_writev 339
+kern_features 340
 kcmp 341
+finit_module 342
+sched_setattr 343
+sched_getattr 344
 renameat2 345
+seccomp 346
 getrandom 347
 memfd_create 348
 bpf 349
+execveat 350
 membarrier 351
 userfaultfd 352
-execveat 350
+bind 353
+listen 354
+setsockopt 355
 mlock2 356
 copy_file_range 357
 preadv2 358
 pwritev2 359
+statx 360
 io_pgetevents 361
 pkey_mprotect 362
 pkey_alloc 363
 pkey_free 364
+rseq 365
+semtimedop 392
+semget 393
+semctl 394
+shmget 395
+shmctl 396
+shmat 397
+shmdt 398
+msgget 399
+msgsnd 400
+msgrcv 401
+msgctl 402
+clock_gettime64 403
+clock_settime64 404
+clock_adjtime64 405
+clock_getres_time64 406
+clock_nanosleep_time64 407
+timer_gettime64 408
+timer_settime64 409
+timerfd_gettime64 410
+timerfd_settime64 411
+utimensat_time64 412
+pselect6_time64 413
+ppoll_time64 414
+io_pgetevents_time64 416
+recvmmsg_time64 417
+mq_timedsend_time64 418
+mq_timedreceive_time64 419
+semtimedop_time64 420
+rt_sigtimedwait_time64 421
+futex_time64 422
+sched_rr_get_interval_ti423
 pidfd_send_signal 424
 io_uring_setup 425
 io_uring_enter 426
@@ -360,3 +411,5 @@ fsconfig 431
 fsmount 432
 fspick 433
 pidfd_open 434
+openat2 437
+pidfd_getfd 438
diff --git a/include/lapi/syscalls/sparc64.in b/include/lapi/syscalls/sparc64.in
index efdaa76a1de1..f654b1359cd6 100644
--- a/include/lapi/syscalls/sparc64.in
+++ b/include/lapi/syscalls/sparc64.in
@@ -29,8 +29,11 @@ alarm 27
 sigaltstack 28
 pause 29
 utime 30
+lchown32 31
+fchown32 32
 access 33
 nice 34
+chown32 35
 sync 36
 kill 37
 stat 38
@@ -39,6 +42,7 @@ lstat 40
 dup 41
 pipe 42
 times 43
+getuid32 44
 umount2 45
 setgid 46
 getgid 47
@@ -47,6 +51,7 @@ geteuid 49
 getegid 50
 acct 51
 memory_ordering 52
+getgid32 53
 ioctl 54
 reboot 55
 mmap2 56
@@ -62,22 +67,32 @@ msync 65
 vfork 66
 pread64 67
 pwrite64 68
+geteuid32 69
+getegid32 70
 mmap 71
+setreuid32 72
 munmap 73
 mprotect 74
 madvise 75
 vhangup 76
+truncate64 77
 mincore 78
 getgroups 79
 setgroups 80
 getpgrp 81
+setgroups32 82
 setitimer 83
+ftruncate64 84
 swapon 85
 getitimer 86
+setuid32 87
 sethostname 88
+setgid32 89
 dup2 90
+setfsuid32 91
 fcntl 92
 select 93
+setfsgid32 94
 fsync 95
 setpriority 96
 socket 97
@@ -95,8 +110,10 @@ setresuid 108
 getresuid 109
 setresgid 110
 getresgid 111
+setregid32 112
 recvmsg 113
 sendmsg 114
+getgroups32 115
 gettimeofday 116
 getrusage 117
 getsockopt 118
@@ -136,6 +153,7 @@ inotify_init 151
 inotify_add_watch 152
 poll 153
 getdents64 154
+fcntl64 155
 inotify_rm_watch 156
 statfs 157
 fstatfs 158
@@ -164,6 +182,7 @@ flistxattr 180
 removexattr 181
 lremovexattr 182
 sigpending 183
+query_module 184
 setpgid 185
 fremovexattr 186
 tkill 187
@@ -200,6 +219,7 @@ clone 217
 ioprio_get 218
 adjtimex 219
 sigprocmask 220
+create_module 221
 delete_module 222
 get_kernel_syms 223
 getpgid 224
@@ -208,10 +228,13 @@ sysfs 226
 afs_syscall 227
 setfsuid 228
 setfsgid 229
+_newselect 230
+time 231
 splice 232
 stime 233
 statfs64 234
 fstatfs64 235
+_llseek 236
 mlock 237
 munlock 238
 mlockall 239
@@ -242,6 +265,7 @@ timer_gettime 263
 timer_getoverrun 264
 timer_delete 265
 timer_create 266
+vserver 267
 io_setup 268
 io_destroy 269
 io_submit 270
@@ -306,24 +330,71 @@ recvmmsg 328
 fanotify_init 329
 fanotify_mark 330
 prlimit64 331
+name_to_handle_at 332
+open_by_handle_at 333
+clock_adjtime 334
 syncfs 335
+sendmmsg 336
+setns 337
 process_vm_readv 338
 process_vm_writev 339
+kern_features 340
 kcmp 341
+finit_module 342
+sched_setattr 343
+sched_getattr 344
 renameat2 345
+seccomp 346
 getrandom 347
 memfd_create 348
+bpf 349
+execveat 350
 membarrier 351
 userfaultfd 352
-execveat 350
+bind 353
+listen 354
+setsockopt 355
 mlock2 356
 copy_file_range 357
 preadv2 358
 pwritev2 359
+statx 360
 io_pgetevents 361
 pkey_mprotect 362
 pkey_alloc 363
 pkey_free 364
+rseq 365
+semtimedop 392
+semget 393
+semctl 394
+shmget 395
+shmctl 396
+shmat 397
+shmdt 398
+msgget 399
+msgsnd 400
+msgrcv 401
+msgctl 402
+clock_gettime64 403
+clock_settime64 404
+clock_adjtime64 405
+clock_getres_time64 406
+clock_nanosleep_time64 407
+timer_gettime64 408
+timer_settime64 409
+timerfd_gettime64 410
+timerfd_settime64 411
+utimensat_time64 412
+pselect6_time64 413
+ppoll_time64 414
+io_pgetevents_time64 416
+recvmmsg_time64 417
+mq_timedsend_time64 418
+mq_timedreceive_time64 419
+semtimedop_time64 420
+rt_sigtimedwait_time64 421
+futex_time64 422
+sched_rr_get_interval_ti423
 pidfd_send_signal 424
 io_uring_setup 425
 io_uring_enter 426
@@ -335,3 +406,5 @@ fsconfig 431
 fsmount 432
 fspick 433
 pidfd_open 434
+openat2 437
+pidfd_getfd 438
diff --git a/include/lapi/syscalls/x86_64.in b/include/lapi/syscalls/x86_64.in
index dd12b7ff838d..c76328c93abd 100644
--- a/include/lapi/syscalls/x86_64.in
+++ b/include/lapi/syscalls/x86_64.in
@@ -172,9 +172,11 @@ sethostname 170
 setdomainname 171
 iopl 172
 ioperm 173
+create_module 174
 init_module 175
 delete_module 176
 get_kernel_syms 177
+query_module 178
 quotactl 179
 nfsservctl 180
 getpmsg 181
@@ -299,15 +301,24 @@ recvmmsg 299
 fanotify_init 300
 fanotify_mark 301
 prlimit64 302
+name_to_handle_at 303
+open_by_handle_at 304
+clock_adjtime 305
 syncfs 306
+sendmmsg 307
+setns 308
+getcpu 309
 process_vm_readv 310
 process_vm_writev 311
 kcmp 312
+finit_module 313
 sched_setattr 314
 sched_getattr 315
 renameat2 316
+seccomp 317
 getrandom 318
 memfd_create 319
+kexec_file_load 320
 bpf 321
 execveat 322
 userfaultfd 323
@@ -321,6 +332,7 @@ pkey_alloc 330
 pkey_free 331
 statx 332
 io_pgetevents 333
+rseq 334
 pidfd_send_signal 424
 io_uring_setup 425
 io_uring_enter 426
@@ -332,3 +344,42 @@ fsconfig 431
 fsmount 432
 fspick 433
 pidfd_open 434
+clone3 435
+openat2 437
+pidfd_getfd 438
+rt_sigaction 512
+rt_sigreturn 513
+ioctl 514
+readv 515
+writev 516
+recvfrom 517
+sendmsg 518
+recvmsg 519
+execve 520
+ptrace 521
+rt_sigpending 522
+rt_sigtimedwait 523
+rt_sigqueueinfo 524
+sigaltstack 525
+timer_create 526
+mq_notify 527
+kexec_load 528
+waitid 529
+set_robust_list 530
+get_robust_list 531
+vmsplice 532
+move_pages 533
+preadv 534
+pwritev 535
+rt_tgsigqueueinfo 536
+recvmmsg 537
+sendmmsg 538
+process_vm_readv 539
+process_vm_writev 540
+setsockopt 541
+getsockopt 542
+io_setup 543
+io_submit 544
+execveat 545
+preadv2 546
+pwritev2 547
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
