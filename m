Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A36E7295133
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Oct 2020 18:58:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 45D8E3C56BD
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Oct 2020 18:58:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 508C43C319A
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 18:58:37 +0200 (CEST)
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A7D58600B7E
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 18:58:36 +0200 (CEST)
Received: by mail-il1-x142.google.com with SMTP id j8so3221684ilk.0
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 09:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=qgxb83JHD/Tk385y5UPYGzutMkiNL5jV5+4Vfni0TYw=;
 b=EWYTm/LYwVJy9ysDsTaB/HXzK3tXvOACX3FKHBKv0jTIRE4/y0p7cIpHe7Rfy9EIRy
 qFvLUvg5XMaGPWna4ktpQJKC8yzP1nGqUqg7ti7R+h6K/+BDvynwZJAP81J3s8ANs9UA
 eWacgETIvpOM5hzVXAYu7gpInggAAHkU3UtmwFnLq3YJaM8t8Yz9dY6D4FFlFt9AMheO
 Trll6z4bMfztApf/+1hY6XctG5k8hacRCA9A7KTIuBBQSIefIWKrBjhhBQT2G3sEfP4N
 VOzq7g0OfkJQ+WMl+VEWaQDd98NSPmfOv4bowSLRglgMIsdHZuLk3t5rmYT292RQTbML
 xiwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=qgxb83JHD/Tk385y5UPYGzutMkiNL5jV5+4Vfni0TYw=;
 b=qsjNi7D5woVVAdqqpVimLBwhz24jbMERkvOV0MWQYl60dfRSE1uTj9NIyjFtJFYJvn
 Ukmsa0THi0WhKsiolqGqWhhSJW0kcbBDzz3ENVvrPfrG+16mpZaeRl6XjiC1UOx/LmDd
 zx7VBJQRLG8zD9OgWRdgQXePeUrc7wNY+G2l/3jECcfNMXAL5KieHOqDSPBsg1iIRk1g
 NIu0knjQmM5iEwQfGYBvpNa1Q9hhVSPPMZc+XiKxxAV3y/pbmtSAfvTRzYBfB+u+13H1
 z/7i25eGsI4HeG33tqXsMfeSP3Vk5KuhwQQq4xCSLPsvGXjXelkRrM8bpP+CwlABDt1N
 SNQA==
X-Gm-Message-State: AOAM530hXD++1ETHeXzf79eMy8113sFhHV78QpLa4OuvSgV4uZANlT9s
 2n8lyw867ljHHoo6syVbEaz0LqI+AVk940iu11B6JQ==
X-Google-Smtp-Source: ABdhPJyFZf3mbpRcwfdOpKB1Uy/3lvfEtljL64okW2zfHcwy8Lm6mQskbjaISDXF6IQ0hUcLX83Ec88t9FvduMFEJwI=
X-Received: by 2002:a92:9944:: with SMTP id p65mr3095346ili.127.1603299515027; 
 Wed, 21 Oct 2020 09:58:35 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 21 Oct 2020 22:28:23 +0530
Message-ID: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
To: open list <linux-kernel@vger.kernel.org>, linux-m68k@lists.linux-m68k.org, 
 X86 ML <x86@kernel.org>, LTP List <ltp@lists.linux.it>,
 lkft-triage@lists.linaro.org, 
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>, kasan-dev@googlegroups.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] mmstress[1309]: segfault at 7f3d71a36ee8 ip 00007f3d77132bdf
 sp 00007f3d71a36ee8 error 4 in libc-2.27.so[7f3d77058000+1aa000]
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
 Thomas Gleixner <tglx@linutronix.de>, Dmitry Vyukov <dvyukov@google.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

LTP mm mtest05 (mmstress), mtest06_3 and mallocstress01 (mallocstress) tested on
x86 KASAN enabled build. But tests are getting PASS on Non KASAN builds.
This regression started happening from next-20201015 nowards

There are few more regression on linux next,
  ltp-cve-tests:
    * cve-2015-7550
  ltp-math-tests:
    * float_bessel
    * float_exp_log
    * float_iperb
    * float_power
    * float_trigo
  ltp-mm-tests:
    * mallocstress01
    * mtest05
    * mtest06_3
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
  # ./mmstress
  # ./mmap3 -x 0.002 -p
  # ./mallocstress

mtest05  (mmstress) :
--------------------
mmstress    0  TINFO  :  run mmstress -h for all options
mmstress    0  TINFO  :  test1: Test case tests the race condition
between simultaneous read faults in the same address space.
[  279.469207] mmstress[1309]: segfault at 7f3d71a36ee8 ip
00007f3d77132bdf sp 00007f3d71a36ee8 error 4 in
libc-2.27.so[7f3d77058000+1aa000]
[  279.469305] audit: type=1701 audit(1602818315.656:3):
auid=4294967295 uid=0 gid=0 ses=4294967295 subj=kernel pid=1307
comm=\"mmstress\" exe=\"/opt/ltp/testcases/bin/mmstress\" sig=11 res=1
[  279.481636] Code: 2d 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f
84 00 00 00 00 00 0f 1f 44 00 00 b8 18 00 00 00 0f 05 48 3d 01 f0 ff
ff 73 01 <c3> 48 8b 0d 91 22 2d 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e
0f 1f
[  279.498212] mmstress[1311]: segfault at 7f3d70a34ee8 ip
00007f3d77132bdf sp 00007f3d70a34ee8 error 4 in
libc-2.27.so[7f3d77058000+1aa000]
[  279.516839] Code: 2d 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f
84 00 00 00 00 00 0f 1f 44 00 00 b8 18 00 00 00 0f 05 48 3d 01 f0 ff
ff 73 01 <c3> 48 8b 0d 91 22 2d 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e
0f 1f
tst_test.c:1246: INFO: Timeout per run is 0h 15m 00s
tst_test.c:1246: INFO: Timeout per run is 0h 09m 00s
tst_test.c:1291: BROK: Test killed by SIGBUS!

mtest06_3 (mmap3 -x 0.002 -p) :
-------------------------------
mmap3.c:154: INFO: Seed 22
mmap3.c:155: INFO: Number of loops 1000
mmap3.c:156: INFO: Number of threads 40
mmap3.c:157: INFO: MAP[  286.657788] mmap3[1350]: segfault at
7f12179d4680 ip 00007f121859951d sp 00007f12179d1e10 error 6 in
libpthread-2.27.so[7f1218589000+19000]
_PRIVATE = 1
mm[  286.671184] Code: c4 10 5b 5d 41 5c c3 66 0f 1f 44 00 00 48 8b 15
99 8a 20 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff c3 48 8b 15 85 8a 20
00 f7 d8 <64> 89 02 48 c7 c0 ff ff ff ff eb b6 0f 1f 80 00 00 00 00 b8
01 00
[  286.677386] audit: type=1701 audit(1602818322.844:6):
auid=4294967295 uid=0 gid=0 ses=4294967295 subj=kernel pid=1348
comm=\"mmap3\" exe=\"/opt/ltp/testcases/bin/mmap3\" sig=11 res=1
ap3.c:158: INFO: Execution time 0.002000H

mallocstress01 (mallocstress) :
------------------------------
pid[1496]: shmat_rd_wr(): shmget():success got segment id 32830
pid[1496]: do_shmat_shmadt(): got shmat address = 0x7f301eae9000
pid[1496]: shmat_rd_wr(): shmget():success got segment id 328[
291.851376] mallocstress[1502]: segfault at 0 ip 0000000000000000 sp
00007f80dea3ec50 error 14
30
pid[1496]: d[  291.851466] mallocstress[1507]: segfault at
7f80dc239c98 ip 00007f80df2bf81c sp 00007f80dc239c98 error 4
o_shmat_shmadt()[  291.851485] mallocstress[1505]: segfault at
7f80dd23bc38 ip 00007f80df33fe93 sp 00007f80dd23bc38 error 4
[  291.851490] Code: 00 00 00 00 0f 1f 00 41 52 52 4d 31 d2 ba 02 00
00 00 be 80 00 00 00 39 d0 75 07 b8 ca 00 00 00 0f 05 89 d0 87 07 85
c0 75 f1 <5a> 41 5a c3 66 0f 1f 84 00 00 00 00 00 56 52 c7 07 00 00 00
00 be
: got shmat addr[  291.851565] audit: type=1701
audit(1602818328.038:7): auid=4294967295 uid=0 gid=0 ses=4294967295
subj=kernel pid=1500 comm=\"mallocstress\"
exe=\"/opt/ltp/testcases/bin/mallocstress\" sig=11 res=1
[  291.852984] mallocstress[1504]: segfault at 7f80dda3cc38 ip
00007f80df33fe93 sp 00007f80dda3cc38 error 4
ess = 0x7f301e85[  291.852988] Code: 00 00 00 00 0f 1f 00 41 52 52 4d
31 d2 ba 02 00 00 00 be 80 00 00 00 39 d0 75 07 b8 ca 00 00 00 0f 05
89 d0 87 07 85 c0 75 f1 <5a> 41 5a c3 66 0f 1f 84 00 00 00 00 00 56 52
c7 07 00 00 00 00 be
[  291.853045] audit: type=1701 audit(1602818328.040:8):
auid=4294967295 uid=0 gid=0 ses=4294967295 subj=kernel pid=1500
comm=\"mallocstress\" exe=\"/opt/ltp/testcases/bin/mallocstress\"
sig=11 res=1
5000
tst_test.c[  291.860373] Code: Unable to access opcode bytes at RIP
0xffffffffffffffd6.
[  291.860453] mallocstress[1506]: segfault at 7f80dca3ac98 ip
00007f80df2bf81c sp 00007f80dca3ac98 error 4
:1246: INFO: Tim[  291.860654] audit: type=1701
audit(1602818328.047:9): auid=4294967295 uid=0 gid=0 ses=4294967295
subj=kernel pid=1500 comm=\"mallocstress\"
exe=\"/opt/ltp/testcases/bin/mallocstress\" sig=11 res=1
[  291.871350]
eout per run is [  291.871397] mallocstress[1501]: segfault at 0 ip
0000000000000000 sp 00007f80df23fc50 error 14
[  291.871401] Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
0h 30m 00s
[  291.871467] audit: type=1701 audit(1602818328.058:10):
auid=4294967295 uid=0 gid=0 ses=4294967295 subj=kernel pid=1500
comm=\"mallocstress\" exe=\"/opt/ltp/testcases/bin/mallocstress\"
sig=11 res=1
[  291.882113]  in libc-2.27.so[7f80df241000+1aa000]
[  291.900984] Code: ff 48 85 c0 75 d8 0f 1f 84 00 00 00 00 00 8b 35
26 11 33 00 48 83 c1 10 85 f6 0f 85 42 01 00 00 48 81 c4 88 00 00 00
48 89 c8 <5b> 5d 41 5c 41 5d 41 5e 41 5f c3 66 0f 1f 84 00 00 00 00 00
4c 8b
[  291.919351] Code: ff 48 85 c0 75 d8 0f 1f 84 00 00 00 00 00 8b 35
26 11 33 00 48 83 c1 10 85 f6 0f 85 42 01 00 00 48 81 c4 88 00 00 00
48 89 c8 <5b> 5d 41 5c 41 5d 41 5e 41 5f c3 66 0f 1f 84 00 00 00 00 00
4c 8b

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

full test log link,
https://lkft.validation.linaro.org/scheduler/job/1844090

-- 
Linaro LKFT
https://lkft.linaro.org

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
