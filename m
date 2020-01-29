Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4BC14C8BA
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 11:27:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E4FD33C256E
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 11:27:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 17FD43C2387
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 11:27:34 +0100 (CET)
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6654B1401B08
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 11:27:33 +0100 (CET)
Received: by mail-lf1-x142.google.com with SMTP id v201so11488957lfa.11
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 02:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fZG9NS08VIEui1jGrBplF6qCoxGi2iBaqdlimHNrcg4=;
 b=HzQVadIq7KVy8jFvGlruDXOcv3TWTlDFAylXNUe7uVFIALsBRx1xeQO2D3IInSvhfY
 76BLH5TrZaJojmFnQkg+6ISsj7tpwruG9QQYhQuAc827w/e3I1YSenW1Y7F3W9+xL5hP
 ZPo88HU2oMs4Q8sJMkjPE4+ZuEn3vW/W506C1tCMZivBWVju46JGNEiIOO2+zJl9VUXQ
 K2TzfbG3Q3JRV7XuOtQd/kMa6lmk+HWIDO/3nkPeQcXMTQH/3rw9aV32RJ5j88ep2fxu
 RY2OzbXiz3EkxvGeH5TKgcmKF0Q8YY/2XK2dulWWm2ca07fIQpkxWRytONGChWDKug9F
 87mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fZG9NS08VIEui1jGrBplF6qCoxGi2iBaqdlimHNrcg4=;
 b=rPIkTuIW9qNF4VhxQQBf2kovwGoUoDLr2oEXwIcsrhUTmxYqNJP86K5dilL56B8YrL
 9ppx4nfmq9K7/fucl8WiivO3df9T30F9ykSfP/CPX5WmadB3id1uQj6aVxs+YMwZj4NX
 fBceR4DRnSfSvQwvqTuixq0PVoY0l6HdOHeFfm+2gWjTdPZl95IIHUixEiMHQGSYH7AT
 eigwEoBfgsiY+X5rYlpT3a/waEWs7DYfKRKtkI43r649z4XGkGq5YSQ1mASz0iArcS0Y
 MvnAbUJOmsmPIAD4xNXC7TLq5foCJbq7aAxw0eHLqZe7ueoN/tMjn4jVH/uM17DaVEqI
 kZ9g==
X-Gm-Message-State: APjAAAVDxc47QB9ZMrQJ+i920DJej9DQaqVDtf+45wryx85URfJflAMD
 30RcoAykwuehP5Z84rvRrfKkKfGUxsgo3gQuwPQXu9xXF0M=
X-Google-Smtp-Source: APXvYqwp/1xPykXdzLXP+2cQfjFzyEkwuOZbK8AC2v5NoP6sL0D1OHj968h3GmSs4hJRdR5PLPpZhPA+VBEpsdppTrc=
X-Received: by 2002:ac2:5e7a:: with SMTP id a26mr5213070lfr.167.1580293652570; 
 Wed, 29 Jan 2020 02:27:32 -0800 (PST)
MIME-Version: 1.0
References: <20200128135749.822297911@linuxfoundation.org>
 <CA+G9fYsnSGw0NmV5hWwZSs5OYu18YRam3jYCsg4Sn+KUQJSMWw@mail.gmail.com>
 <1680515224.4725561.1580289411736.JavaMail.zimbra@redhat.com>
In-Reply-To: <1680515224.4725561.1580289411736.JavaMail.zimbra@redhat.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 29 Jan 2020 15:57:21 +0530
Message-ID: <CA+G9fYvMc73OCXNz_9Ks-GqE828Vd3YFeX_iOrWq3bobGpgUtQ@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4.14 00/46] 4.14.169-stable review
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, 29 Jan 2020 at 14:46, Jan Stancek <jstancek@redhat.com> wrote:
>
>
>
> ----- Original Message -----
> > NOTE:
> > LTP fs test read_all_proc fails intermittently on 4.9 and 4.14 branches.
>
> [trim CC list to LTP]
>
> Naresh, do you have some examples of these failures?

Yes.
I have posted the links below.

> Has it started recently or do you see it long-term?

We have seen this from a this test is introduced.
Not specific to any branch. This failure is intermittent and found on
multiple trees and branches.

> Is test timing out on some specific /proc entries?

Yes. When running on qemu devices it is getting timedout.

> If yes, is it possible to run test with strace or with "-v" so we can
> see where it's getting stuck?

Test failed links,
https://lkft.validation.linaro.org/scheduler/job/1143332#L1271
https://lkft.validation.linaro.org/scheduler/job/1143281#L3969
https://lkft.validation.linaro.org/scheduler/job/1142547#L1719
https://lkft.validation.linaro.org/scheduler/job/1145024#L677
https://lkft.validation.linaro.org/scheduler/job/1142037#L4225

Test results comparison link,
https://qa-reports.linaro.org/lkft/linux-stable-rc-4.14-oe/tests/ltp-fs-tests/read_all_proc
https://qa-reports.linaro.org/lkft/linux-stable-rc-4.9-oe/tests/ltp-fs-tests/read_all_proc

example crash output:
------------------------------
tst_test.c:1118: INFO: Timeout per run is 0h 15m 00s
[ 1136.978957] BUG: unable to handle kernel NULL pointer dereference at 00000004
[ 1136.979046] IP: [<c125da77>] path_openat+0xd7/0x16d0
[ 1136.979046] *pde = 00000000 [ 1136.979046]
[ 1136.979046] Oops: 0000 [#1] SMP
[ 1136.979046] Modules linked in: tun fuse
[ 1136.979046] CPU: 1 PID: 6535 Comm: read_all Not tainted 4.9.212-rc2 #1
[ 1136.979046] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
BIOS 1.12.0-1 04/01/2014
[ 1136.979046] task: f56e6300 task.stack: f3ada000
[ 1136.979046] EIP: 0060:[<c125da77>] EFLAGS: 00010246 CPU: 1
[ 1136.979046] EIP is at path_openat+0xd7/0x16d0
[ 1136.979046] EAX: 00000000 EBX: f3fb6210 ECX: f3adbf54 EDX: 0000000d
[ 1136.979046] ESI: 00000800 EDI: f3adbea4 EBP: f3adbe98 ESP: f3adbddc
[ 1136.979046]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[ 1136.979046] CR0: 80050033 CR2: 00000004 CR3: 33a72000 CR4: 003406d0
[ 1136.979046] Stack:
[ 1136.979046]  f3adbe38 00000246 f56e6300 f56e6300 00000001 f56e6300
00000001 f56e6300
[ 1136.979046]  f3adbeac f56e6300 00000001 00000041 f56e68a8 f3a7e500
00000046 f56e6300
[ 1136.979046]  00000000 f3adbf54 00000000 00000000 f56e68a8 f3adbeb8
c111fcde c26cd460
[ 1136.979046] Call Trace:
[ 1136.979046]  [<c111fcde>] ? __lock_acquire+0x24e/0x12e0
[ 1136.979046]  [<c113c87a>] ? debug_lockdep_rcu_enabled+0x1a/0x30
[ 1136.979046]  [<c126009e>] do_filp_open+0x5e/0xb0
[ 1136.979046]  [<c1af1b72>] ? _raw_spin_unlock+0x22/0x30
[ 1136.979046]  [<c1270eed>] ? __alloc_fd+0xbd/0x1d0
[ 1136.979046]  [<c124ce1c>] do_sys_open+0x19c/0x240
[ 1136.979046]  [<c1214e11>] ? __might_fault+0x41/0xa0
[ 1136.979046]  [<c124cf10>] SyS_openat+0x20/0x30
[ 1136.979046]  [<c1001cd8>] do_fast_syscall_32+0xa8/0x240
[ 1136.979046]  [<c1af2330>] sysenter_past_esp+0x45/0x74
[ 1136.979046] Code: 20 f2 ff ff 3d 00 f0 ff ff 0f 87 85 05 00 00 89
fa e8 5e ec ff ff 85 c0 89 c6 0f 85 76 05 00 00 8b 5f 04 8b 4d 88 8b
43 30 8b 31 <8b> 50 04 0f b7 00 89 75 8c 81 e6 00 02 00 00 89 75 80 89
95 74
[ 1136.979046] EIP: [<c125da77>] [ 1136.979046] path_openat+0xd7/0x16d0
[ 1136.979046]  SS:ESP 0068:f3adbddc
[ 1136.979046] CR2: 0000000000000004
[ 1136.979046] ---[ end trace 01501609579dce3c ]---
[ 1136.979046] BUG: sleeping function called from invalid context at
/usr/src/kernel/include/linux/sched.h:3154
[ 1136.979046] in_atomic(): 1, irqs_disabled(): 1, pid: 6535, name: read_all
[ 1136.979046] INFO: lockdep is turned off.
[ 1136.979046] irq event stamp: 14908
[ 1136.979046] hardirqs last  enabled at (14907): [<c125c084>]
lookup_fast+0x1f4/0x330
[ 1136.979046] hardirqs last disabled at (14908): [<c1af327f>]
error_code+0x5b/0x7c
[ 1136.979046] softirqs last  enabled at (13428): [<c1af5695>]
__do_softirq+0x2e5/0x457
[ 1136.979046] softirqs last disabled at (13421): [<c108b835>]
call_on_stack+0x45/0x50
[ 1136.979046] CPU: 1 PID: 6535 Comm: read_all Tainted: G      D
  4.9.212-rc2 #1
[ 1136.979046] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
BIOS 1.12.0-1 04/01/2014
[ 1136.979046]  f3adbee4 c142af02 f56e6300 f56e6788 f3adbf0c c10f6598
c1db2154 00000001
[ 1136.979046]  00000001 00001987 f56e6788 f56e6300 00000000 f56e6300
f3adbf40 c10f66d3
[ 1136.979046]  00000000 00000800 00000002 ffffff9c f57d4000 00000006
ffffff9c f3adbf74
[ 1136.979046] Call Trace:
[ 1136.979046]  [<c142af02>] dump_stack+0x6e/0x9c
[ 1136.979046]  [<c10f6598>] ___might_sleep+0x138/0x240
[ 1136.979046]  [<c10f66d3>] __might_sleep+0x33/0xa0
[ 1136.979046]  [<c124ce1c>] ? do_sys_open+0x19c/0x240
[ 1136.979046]  [<c10de76f>] exit_signals+0x1f/0x220
[ 1136.979046]  [<c10d098b>] do_exit+0x8b/0xbd0
[ 1136.979046]  [<c124cf10>] ? SyS_openat+0x20/0x30
[ 1136.979046]  [<c1001cd8>] ? do_fast_syscall_32+0xa8/0x240
[ 1136.979046]  [<c1af342d>] rewind_stack_do_exit+0x11/0x13
[ 1136.979046] note: read_all[6535] exited with preempt_count 1
read_all.c:313: BROK: queue_push(workers[j].q, path) timed out

- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
