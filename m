Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEAAF33A9
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Nov 2019 16:44:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 907F33C228F
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Nov 2019 16:44:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 891F03C1D57
 for <ltp@lists.linux.it>; Thu,  7 Nov 2019 16:44:12 +0100 (CET)
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B6CA6604287
 for <ltp@lists.linux.it>; Thu,  7 Nov 2019 16:44:11 +0100 (CET)
Received: by mail-qk1-x742.google.com with SMTP id z16so2366397qkg.7
 for <ltp@lists.linux.it>; Thu, 07 Nov 2019 07:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LYUXQzh8Z3lsqgqOKCKLCWI1cRCbIT6b0kroNt7+v6w=;
 b=QM4t2YfpucBFO7CAFKtmcBZDhmN22tzF2s2Kft+rea86e8DF4g2niEON1Hjfc+re5q
 g8Wf5mwZm5s4/8wLt4N9bgpS37KlZN8gX1bLU+rFbs/89qxqnXPF75uffpuTPTXmzIQj
 8d+8ggy5hM6b+VnQXhQ4N6RYj9O7IWlR1sL1z1SNrSAIUaOY+APRLX4VIF9uQc3ryFFZ
 AzD+AAmkXqJmzy9b9fql7p4bIuJqFsDKAlDYFimpdKsqDcNtlZx9ZqYgvz3SgCB2j+iI
 83Or6beGxKMT3OTba9/FFljYTUx/gRxXvX9aQBjvLhH0FE4nHmB9RJRpin1a/TmMXW8I
 aeyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LYUXQzh8Z3lsqgqOKCKLCWI1cRCbIT6b0kroNt7+v6w=;
 b=ppm8ga7MY6xvjnn2qkVPFqGr6hLk+VKFDQ5OmqJP17PDjSvRhag8G535fYDqpAJP7M
 j8b8TUGz2hoH/4X0FcTe/7HEfeMTUxwh9gPtnMymuRcWczIJO8+5sY4WqzFIPlm9aiGk
 7jVJMZWOxM44Hm+8ISYwUDIpuC4ajyOIX47s0R4nrPALkr7t+7Xvtk9vNxakGH4MZSCj
 qeuMXmucFrx92YdSCGvUkGjApq3rizr+N1fjCo5Pf3ZxUOjZGwrQgvhqarBRd5Pa4Sov
 KOF+27TMlFb3WmV4OdjD8M9Zb/AMbm40HH6Wc7tWwQfHXQIE4VseXm0KRrtULmESu+QP
 DntA==
X-Gm-Message-State: APjAAAW8p3iymarKKHC8oAJmAObdQncNoq/Z6wynM13msV6C8dDqKbaR
 2VTqJ58cZVe4dynywQA+0rv0/pAAi0G1h9Fn4whDow==
X-Google-Smtp-Source: APXvYqwabQNo9APHE7IZlbiOGvtR9IQAcO7MaHQeabHkhSgpUe18hcHOR1Aj5XbYm6h/PDBFjs5ccrmTRHgpRNNS+BU=
X-Received: by 2002:a37:8e81:: with SMTP id q123mr3559084qkd.250.1573141450194; 
 Thu, 07 Nov 2019 07:44:10 -0800 (PST)
MIME-Version: 1.0
References: <20191107153458.16917-1-rpalethorpe@suse.com>
In-Reply-To: <20191107153458.16917-1-rpalethorpe@suse.com>
Date: Thu, 7 Nov 2019 16:43:59 +0100
Message-ID: <CACT4Y+YuKTob0TovN9f2N_Fdnvg=ODe5dnR1bh=wgVaz=QGHEw@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/2] LTP wrapper for Syzkaller reproducers
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
From: Dmitry Vyukov via ltp <ltp@lists.linux.it>
Reply-To: Dmitry Vyukov <dvyukov@google.com>
Cc: syzkaller <syzkaller@googlegroups.com>, automated-testing@yoctoproject.org,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Nov 7, 2019 at 4:35 PM Richard Palethorpe <rpalethorpe@suse.com> wrote:
>
> Hello,
>
> This allows the user to run ./configure --with-syzkaller-repros and it will
> automatically fetch the reproducers and generate the necessary LTP runtest
> files which use 'syzwrap' to wrap the Syzkaller reproducers.
>
> Optimistically speaking, this should allow you to run the reproducers in your
> normal LTP test setup if you reduce the timeouts and your test runner is
> reasonably advanced (see README.md).
>
> I have been testing this with a modified version of Metan's runltp-ng which
> almost runs the reproducers smoothly ;-). We haven't got around to documenting
> it yet, but you can find it here:
>
> https://github.com/richiejp/runltp-ng/tree/syzkaller
>
> I began adding some sandboxing to syzwrap from the Syzkaller executor, but I
> found this simply broke many of the reproducers which need access to
> TAP/TUN. I guess the reproducers can be regenerated with the sanboxing built
> in if the user cares enough. However I have left in the ability for syzwrap to
> optionally add some sandboxing. This does appear to help prevent the root file
> system from being trashed at the cost of breaking some reproducers.
>
> Of course if the test runner can reset the SUT to a good state, then the
> sandboxing is not necessary. This is quite easy to do with QEMU using image
> overlays.
>
> Richard Palethorpe (2):
>   Wrapper for Syzkaller reproducers
>   lib: Allow timeout coefficient < 1
>
>  .gitmodules                                  |   5 +
>  configure.ac                                 |  11 ++
>  include/mk/features.mk.default               |   2 +
>  include/mk/features.mk.in                    |   2 +
>  lib/tst_test.c                               |   2 +-
>  runtest/.gitignore                           |   1 +
>  testcases/kernel/Makefile                    |   1 +
>  testcases/kernel/syzkaller-repros/.gitignore |   1 +
>  testcases/kernel/syzkaller-repros/Makefile   | 100 ++++++++++++++
>  testcases/kernel/syzkaller-repros/README.md  |  45 +++++++
>  testcases/kernel/syzkaller-repros/syzwrap.c  | 133 +++++++++++++++++++
>  11 files changed, 302 insertions(+), 1 deletion(-)
>  create mode 100644 runtest/.gitignore
>  create mode 100644 testcases/kernel/syzkaller-repros/.gitignore
>  create mode 100644 testcases/kernel/syzkaller-repros/Makefile
>  create mode 100644 testcases/kernel/syzkaller-repros/README.md
>  create mode 100644 testcases/kernel/syzkaller-repros/syzwrap.c
>
> --
> 2.23.0
>

+syzkaller mailing list FTR

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
