Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBF21B557C
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Apr 2020 09:17:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8BECF3C297E
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Apr 2020 09:17:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 199EC3C2943
 for <ltp@lists.linux.it>; Thu, 23 Apr 2020 09:17:47 +0200 (CEST)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A3F0B60162F
 for <ltp@lists.linux.it>; Thu, 23 Apr 2020 09:17:45 +0200 (CEST)
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1D40B4016D;
 Thu, 23 Apr 2020 07:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1587626262; bh=IXaXfYkXq2BzI3FUA/CReSLzC96R6EJAzmP9vlOyi6Y=;
 h=From:To:Cc:Subject:Date:From;
 b=iaDrwic798SVW3PSJXcgBO6aGxC+LE42PiSkZERccC83eXbWF/UCg64HJr/JhzlV9
 CXV2HbVAhnwVZ/tqnDO/wvAof8Fq3yLyxz1jzFpSeLpEepy+fCWAB/4Zj6XLGo5H+z
 azxIKi9P/hmNwgHcLEPqKX+/bCxBjGW4CXw6AhywA5WV7f0YilT2g4HX+1x2od1P23
 ri50eWVDrogbtvkvzCc+AYOz63hOJP+kmtS+MSveZRXUd/aQ80u72cJeeg276U1LpL
 wwbvJQIF150t7gbfwLv1/ymjXmz0dWAzJpXBm35nix7e0f2xZ+CC+bYTvfShI8LWKQ
 S1ucpMW7BKq9Q==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 2D542A00AE;
 Thu, 23 Apr 2020 07:17:40 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: ltp@lists.linux.it
Date: Thu, 23 Apr 2020 00:17:38 -0700
Message-Id: <20200423071738.3469-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] lapi/syscalls: Add ARC support
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
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 include/lapi/syscalls/arc.in | 314 +++++++++++++++++++++++++++++++++++
 include/lapi/syscalls/order  |   1 +
 2 files changed, 315 insertions(+)
 create mode 100644 include/lapi/syscalls/arc.in

diff --git a/include/lapi/syscalls/arc.in b/include/lapi/syscalls/arc.in
new file mode 100644
index 000000000000..0cadb150c7fe
--- /dev/null
+++ b/include/lapi/syscalls/arc.in
@@ -0,0 +1,314 @@
+io_setup 0
+io_destroy 1
+io_submit 2
+io_cancel 3
+io_getevents 4
+setxattr 5
+lsetxattr 6
+fsetxattr 7
+getxattr 8
+lgetxattr 9
+fgetxattr 10
+listxattr 11
+llistxattr 12
+flistxattr 13
+removexattr 14
+lremovexattr 15
+fremovexattr 16
+getcwd 17
+lookup_dcookie 18
+eventfd2 19
+epoll_create1 20
+epoll_ctl 21
+epoll_pwait 22
+dup 23
+dup3 24
+fcntl 25
+inotify_init1 26
+inotify_add_watch 27
+inotify_rm_watch 28
+ioctl 29
+ioprio_set 30
+ioprio_get 31
+flock 32
+mknodat 33
+mkdirat 34
+unlinkat 35
+symlinkat 36
+linkat 37
+renameat 38
+umount2 39
+mount 40
+pivot_root 41
+nfsservctl 42
+statfs 43
+fstatfs 44
+truncate 45
+ftruncate 46
+fallocate 47
+faccessat 48
+chdir 49
+fchdir 50
+chroot 51
+fchmod 52
+fchmodat 53
+fchownat 54
+fchown 55
+openat 56
+close 57
+vhangup 58
+pipe2 59
+quotactl 60
+getdents64 61
+lseek 62
+read 63
+write 64
+readv 65
+writev 66
+pread64 67
+pwrite64 68
+preadv 69
+pwritev 70
+sendfile 71
+pselect6 72
+ppoll 73
+signalfd4 74
+vmsplice 75
+splice 76
+tee 77
+readlinkat 78
+fstatat 79
+fstat 80
+sync 81
+fsync 82
+fdatasync 83
+sync_file_range2 84
+sync_file_range 84
+timerfd_create 85
+timerfd_settime 86
+timerfd_gettime 87
+utimensat 88
+acct 89
+capget 90
+capset 91
+personality 92
+exit 93
+exit_group 94
+waitid 95
+set_tid_address 96
+unshare 97
+futex 98
+set_robust_list 99
+get_robust_list 100
+nanosleep 101
+getitimer 102
+setitimer 103
+kexec_load 104
+init_module 105
+delete_module 106
+timer_create 107
+timer_gettime 108
+timer_getoverrun 109
+timer_settime 110
+timer_delete 111
+clock_settime 112
+clock_gettime 113
+clock_getres 114
+clock_nanosleep 115
+syslog 116
+ptrace 117
+sched_setparam 118
+sched_setscheduler 119
+sched_getscheduler 120
+sched_getparam 121
+sched_setaffinity 122
+sched_getaffinity 123
+sched_yield 124
+sched_get_priority_max 125
+sched_get_priority_min 126
+sched_rr_get_interval 127
+restart_syscall 128
+kill 129
+tkill 130
+tgkill 131
+sigaltstack 132
+rt_sigsuspend 133
+rt_sigaction 134
+rt_sigprocmask 135
+rt_sigpending 136
+rt_sigtimedwait 137
+rt_sigqueueinfo 138
+rt_sigreturn 139
+setpriority 140
+getpriority 141
+reboot 142
+setregid 143
+setgid 144
+setreuid 145
+setuid 146
+setresuid 147
+getresuid 148
+setresgid 149
+getresgid 150
+setfsuid 151
+setfsgid 152
+times 153
+setpgid 154
+getpgid 155
+getsid 156
+setsid 157
+getgroups 158
+setgroups 159
+uname 160
+sethostname 161
+setdomainname 162
+getrlimit 163
+setrlimit 164
+getrusage 165
+umask 166
+prctl 167
+getcpu 168
+gettimeofday 169
+settimeofday 170
+adjtimex 171
+getpid 172
+getppid 173
+getuid 174
+geteuid 175
+getgid 176
+getegid 177
+gettid 178
+sysinfo 179
+mq_open 180
+mq_unlink 181
+mq_timedsend 182
+mq_timedreceive 183
+mq_notify 184
+mq_getsetattr 185
+msgget 186
+msgctl 187
+msgrcv 188
+msgsnd 189
+semget 190
+semctl 191
+semtimedop 192
+semop 193
+shmget 194
+shmctl 195
+shmat 196
+shmdt 197
+socket 198
+socketpair 199
+bind 200
+listen 201
+accept 202
+connect 203
+getsockname 204
+getpeername 205
+sendto 206
+recvfrom 207
+setsockopt 208
+getsockopt 209
+shutdown 210
+sendmsg 211
+recvmsg 212
+readahead 213
+brk 214
+munmap 215
+mremap 216
+add_key 217
+request_key 218
+keyctl 219
+clone 220
+execve 221
+mmap 222
+fadvise64 223
+swapon 224
+swapoff 225
+mprotect 226
+msync 227
+mlock 228
+munlock 229
+mlockall 230
+munlockall 231
+mincore 232
+madvise 233
+remap_file_pages 234
+mbind 235
+get_mempolicy 236
+set_mempolicy 237
+migrate_pages 238
+move_pages 239
+rt_tgsigqueueinfo 240
+perf_event_open 241
+accept4 242
+recvmmsg 243
+cacheflush 244
+arc_settls 245
+arc_gettls 246
+sysfs 247
+arc_usr_cmpxchg 248
+wait4 260
+prlimit64 261
+fanotify_init 262
+fanotify_mark 263
+name_to_handle_at 264
+open_by_handle_at 265
+clock_adjtime 266
+syncfs 267
+setns 268
+sendmmsg 269
+process_vm_readv 270
+process_vm_writev 271
+kcmp 272
+getrandom 278
+memfd_create 279
+bpf 280
+execveat 281
+userfaultfd 282
+membarrier 283
+mlock2 284
+copy_file_range 285
+preadv2 286
+pwritev2 287
+pkey_mprotect 288
+pkey_alloc 289
+pkey_free 290
+statx 291
+io_pgetevents 292
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
+pidfd_send_signal 424
+io_uring_setup 425
+io_uring_enter 426
+io_uring_register 427
+open_tree 428
+move_mount 429
+fsopen 430
+fsconfig 431
+fsmount 432
+fspick 433
+pidfd_open 434
+clone3 435
+openat2 437
+pidfd_getfd 438
diff --git a/include/lapi/syscalls/order b/include/lapi/syscalls/order
index 62352c7a887f..548097681307 100644
--- a/include/lapi/syscalls/order
+++ b/include/lapi/syscalls/order
@@ -1,4 +1,5 @@
 aarch64
+arc
 arm
 hppa
 i386
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
