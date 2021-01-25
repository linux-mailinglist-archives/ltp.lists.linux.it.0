Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 022AF3027DA
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Jan 2021 17:32:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 703673C5F46
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Jan 2021 17:32:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 5D3653C176A
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 17:32:02 +0100 (CET)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C55EB20032C
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 17:32:01 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id ke15so18889658ejc.12
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 08:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2RzgFx4bVzCyoVBI8IRrWv56bXh+C2simTbpmFGdt1c=;
 b=eyunknpLzjfpE9Vh5qFqaREXOsPbYtFO6TDAKZYKCbFEv9x7t12KpcyXgVu9HeKU9f
 orT3yRZ2aXxMYJCWeWdFYNAks6JWCZG6u3G6oXvYIwZxGXPfpHuS6sN++w8HOYzpfZNe
 byE/VlgxRCzxHUxqW/A4mwOXw+YsJQAiY+e5kmmyeie+VaNc/WgdQMBrpNYI46kq/A5m
 hHjXSoWuD1VxXnBppunOqxQAEhfD6SXf/547Isyv41nTQGu/9dwp9CddYsasXVzQ0m/7
 3yNCOfxkrgG1QD/rbyz4plhF4xkyOAvJ+aPCUUITizFpRQpkLkSNd3s3wR3lTD66m2hw
 kwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2RzgFx4bVzCyoVBI8IRrWv56bXh+C2simTbpmFGdt1c=;
 b=I+5oZgsJF9dEG/Ib3l1wl82eAZGbSVlCF5qJ32opALj4WY1yRDKCKJkFufqx5PgHdU
 EgN1LvrDxubj2KD5wtv6LHq984tmjFcjn+BTV8I9tKOEFBK6D2WFe7bAmrI9XhruWAmK
 J5ojZkj0dDzMIZJGZx3K1VFagEoDvlwvvQXwnCoggCY2SUzEJAw9GMbKW6mOzdtbTE/m
 KaOyzla0k+v1NNiWZ9J4bPOf9EWzBh5UNXh9Y+xJbrc3vSoZe0L0yk3Iz2BHxO4ZJvDj
 yz02+yELzv14U+c6IdeyTiBZ3JzBf27E+G9R5SqRjBK2577YZaFtJz1plskr10kjoQ1Y
 wBjg==
X-Gm-Message-State: AOAM5334vfu4nErir/X0eTLY/0X8JOWvoGnkXadBeFK8gJLt0UFwbjW0
 vnhOwNcOHCGHguDzPxIGdPl1iGBU7v3bb1d7dAvYXg==
X-Google-Smtp-Source: ABdhPJxXnTkeYm/9NPRPkxEwReac7Klq6zD6SARzoK1mMYze5vLOxVFjBNqRFh2wWMUp3ZfTIRmy7aCjkwmLZ/CQgWk=
X-Received: by 2002:a17:907:104c:: with SMTP id
 oy12mr867060ejb.503.1611592321246; 
 Mon, 25 Jan 2021 08:32:01 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYsvDWDogC+xgeG2V9MMofV5svTipDigDiUBje+2jSRK8g@mail.gmail.com>
 <CAK8P3a2OeeW29ekbD70Ns4LTjGRJRT9P0wM-SAxUin1zAxP7TA@mail.gmail.com>
In-Reply-To: <CAK8P3a2OeeW29ekbD70Ns4LTjGRJRT9P0wM-SAxUin1zAxP7TA@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 25 Jan 2021 22:01:48 +0530
Message-ID: <CA+G9fYv89bfbixjuudPWkBAucTYg7qhNxcV54RMEkRP5is-bnQ@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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
 Andrew Morton <akpm@linux-foundation.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Arnd,

On Mon, 25 Jan 2021 at 20:41, Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Mon, Jan 25, 2021 at 3:48 PM Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
> >
> > LTP syscalls madvise08 test case failed on all devices from
> > Linux next 20210118 to till day.
> > strace log attached to this email and link provided below.
> >
> > BAD: next-20210118
> > GOOD: next-20210115
> >
> > This failure is easily reproducible on Linux next tag 20210118 above.
> >
> > tst_test.c:1250: TINFO: Timeout per run is 0h 15m 00s
> > madvise08.c:73: TINFO: Temporary core pattern is
> > '/scratch/ltp-2nftQzNI1K/HclFMH/dump-%p'
> > madvise08.c:112: TINFO: Dump file should be dump-10109
> > madvise08.c:196: TPASS: madvise(..., MADV_DONTDUMP)
> > madvise08.c:112: TINFO: Dump file should be dump-10110
> > madvise08.c:203: TFAIL: No sequence in dump after MADV_DODUMP.
> >
> > strace log,
> > https://lkft.validation.linaro.org/scheduler/job/2184866#L1257
>
> Ok, so in this part of the log,
>
> [pid   485] --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_DUMPED,
> si_pid=487, si_uid=0, si_status=SIGABRT, si_utime=0, si_stime=0} ---
> [pid   485] write(2, \"madvise08.c:117: \33[1;34mTINFO: \33\"...,
> 64madvise08.c:117: [1;34mTINFO: [0mDump file should be dump-487
> ) = 64
> [pid   485] access(\"dump-487\", F_OK)    = 0
> [pid   485] openat(AT_FDCWD, \"dump-487\", O_RDONLY) = 3
> [pid   485] read(3,
> \"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\4\0>\0\1\0\0\0\0\0\0\0\0\0\0\0\"...,
> 1024) = 1024
> [pid   485] read(3,
> \"\0\320\3\0\0\0\0\0\0\340\375\24\304\177\0\0\0\0\0\0\0\0\0\0\0\20\0\0\0\0\0\0\"...,
> 1024) = 292
> [pid   485] read(3, \"\", 1024)           = 0
> [pid   485] close(3)                    = 0
> [pid   485] write(2, \"madvise08.c:208: \33[1;31mTFAIL: \33\"...,
> 74madvise08.c:208: [1;31mTFAIL: [0mNo sequence in dump after
> MADV_DODUMP.
>
> it seems that the data that was requested to be dumped with MADV_DODUMP is
> indeed completely absent.
>
> There was exactly one commit that got merged between next-20210115 and
> next-20120118
> related to core dumps: 8a3cc755b138 ("coredump: don't bother with
> do_truncate()").
> Adding Al Viro to Cc for that.
>
> Naresh, could you try reverting that patch?

This suspecting commit reverted and tested and the test case PASS.

commit 8a3cc755b13808eba74846dfd1033fcbc21f9a65
Author: Al Viro <viro@zeniv.linux.org.uk>
Date:   Sun Mar 8 09:16:37 2020 -0400

    coredump: don't bother with do_truncate()

    have dump_skip() just remember how much needs to be skipped,
    leave actual seeks/writing zeroes to the next dump_emit()
    or the end of coredump output, whichever comes first.
    And instead of playing with do_truncate() in the end, just
    write one NUL at the end of the last gap (if any).

    Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

 fs/binfmt_elf.c          |  1 -
 fs/coredump.c            | 56 +++++++++++++++++++++++++++---------------------
 include/linux/binfmts.h  |  1 +
 include/linux/coredump.h |  1 -


Test case output link,
https://lkft.validation.linaro.org/scheduler/job/2184975#L1369
https://lkft.validation.linaro.org/scheduler/job/2184972#L1358

- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
