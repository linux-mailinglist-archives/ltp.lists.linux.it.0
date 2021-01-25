Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5C93026BE
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Jan 2021 16:14:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 55E573C5F27
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Jan 2021 16:14:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id B301A3C1C6D
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 16:11:47 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5E284100095E
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 16:11:46 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B4B99230FE
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 15:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611587503;
 bh=r5Uo07IQYlBEdLUN4JJ8iBXUHjeKUZXycoL6vpJfGJ0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XFWbHp7KHXEFjyM6C90aTj6/8cIhEeua3UZRyetUsW/pffyrn4bL0U3jptBLjrHzB
 P1r0zm2u5P92v3WAPqZNmyb3eNmVPXUoXm+SCVDkaW7p7nr/rSy9rN918ITvCYdsyL
 8AtqBm4jGT+dyQf99Ki0fecuONmWBSkbCc81y/psVEBIcV7YMVCUejscCcVujcSk4D
 4dSxx5vidN/eVL1bSpIlV5cjr2rbDKUJnJPmlITGS1pN+0gYaHZ4I3Wlr/nyi5Ivpc
 mRmwp13Igu+okBVasvZKPeRXYXteRCPRwqkilfJAtopvbAw5h+7zp4046O0Rb+lFrd
 hrDQkhUxSLH1g==
Received: by mail-oi1-f170.google.com with SMTP id w8so15104268oie.2
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 07:11:43 -0800 (PST)
X-Gm-Message-State: AOAM530X5HFpZLAYExGbsGun7LjytsMu3xAr6fn0OWZm+l95GA8KzPtI
 iWvldgzl4drtwzufCyDz20p4tVjNy4p9dHJyaIk=
X-Google-Smtp-Source: ABdhPJxdJ3BJcGsYMDL3f90oYHHi/YyWcPc/WE/CEaHqFC/PG55A6VPahWUH0/LFCBt9e0OYCoUW465Pd+6s+5408mw=
X-Received: by 2002:aca:e103:: with SMTP id y3mr396747oig.11.1611587502910;
 Mon, 25 Jan 2021 07:11:42 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYsvDWDogC+xgeG2V9MMofV5svTipDigDiUBje+2jSRK8g@mail.gmail.com>
In-Reply-To: <CA+G9fYsvDWDogC+xgeG2V9MMofV5svTipDigDiUBje+2jSRK8g@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 25 Jan 2021 16:11:26 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2OeeW29ekbD70Ns4LTjGRJRT9P0wM-SAxUin1zAxP7TA@mail.gmail.com>
Message-ID: <CAK8P3a2OeeW29ekbD70Ns4LTjGRJRT9P0wM-SAxUin1zAxP7TA@mail.gmail.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 25 Jan 2021 16:14:42 +0100
Subject: Re: [LTP] LTP: madvise08.c:203: TFAIL: No sequence in dump after
 MADV_DODUMP.
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, open list <linux-kernel@vger.kernel.org>,
 lkft-triage@lists.linaro.org, Richard Palethorpe <rpalethorpe@suse.com>,
 Peter Xu <peterx@redhat.com>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Christian Brauner <christian@brauner.io>,
 "Eric W. Biederman" <ebiederm@xmission.com>, Joerg.Vehlow@aox-tech.de,
 Andrew Morton <akpm@linux-foundation.org>, LTP List <ltp@lists.linux.it>,
 Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, Jan 25, 2021 at 3:48 PM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> LTP syscalls madvise08 test case failed on all devices from
> Linux next 20210118 to till day.
> strace log attached to this email and link provided below.
>
> BAD: next-20210118
> GOOD: next-20210115
>
> This failure is easily reproducible on Linux next tag 20210118 above.
>
> tst_test.c:1250: TINFO: Timeout per run is 0h 15m 00s
> madvise08.c:73: TINFO: Temporary core pattern is
> '/scratch/ltp-2nftQzNI1K/HclFMH/dump-%p'
> madvise08.c:112: TINFO: Dump file should be dump-10109
> madvise08.c:196: TPASS: madvise(..., MADV_DONTDUMP)
> madvise08.c:112: TINFO: Dump file should be dump-10110
> madvise08.c:203: TFAIL: No sequence in dump after MADV_DODUMP.
>
> strace log,
> https://lkft.validation.linaro.org/scheduler/job/2184866#L1257

Ok, so in this part of the log,

[pid   485] --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_DUMPED,
si_pid=487, si_uid=0, si_status=SIGABRT, si_utime=0, si_stime=0} ---
[pid   485] write(2, \"madvise08.c:117: \33[1;34mTINFO: \33\"...,
64madvise08.c:117: [1;34mTINFO: [0mDump file should be dump-487
) = 64
[pid   485] access(\"dump-487\", F_OK)    = 0
[pid   485] openat(AT_FDCWD, \"dump-487\", O_RDONLY) = 3
[pid   485] read(3,
\"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\4\0>\0\1\0\0\0\0\0\0\0\0\0\0\0\"...,
1024) = 1024
[pid   485] read(3,
\"\0\320\3\0\0\0\0\0\0\340\375\24\304\177\0\0\0\0\0\0\0\0\0\0\0\20\0\0\0\0\0\0\"...,
1024) = 292
[pid   485] read(3, \"\", 1024)           = 0
[pid   485] close(3)                    = 0
[pid   485] write(2, \"madvise08.c:208: \33[1;31mTFAIL: \33\"...,
74madvise08.c:208: [1;31mTFAIL: [0mNo sequence in dump after
MADV_DODUMP.

it seems that the data that was requested to be dumped with MADV_DODUMP is
indeed completely absent.

There was exactly one commit that got merged between next-20210115 and
next-20120118
related to core dumps: 8a3cc755b138 ("coredump: don't bother with
do_truncate()").
Adding Al Viro to Cc for that.

Naresh, could you try reverting that patch?

     Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
