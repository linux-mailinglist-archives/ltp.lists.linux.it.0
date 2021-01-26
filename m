Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9974F303795
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Jan 2021 09:03:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4BF5A3C4FCB
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Jan 2021 09:03:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 032B93C0752
 for <ltp@lists.linux.it>; Tue, 26 Jan 2021 09:03:38 +0100 (CET)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8A84E1000A97
 for <ltp@lists.linux.it>; Tue, 26 Jan 2021 09:03:38 +0100 (CET)
Received: by mail-ot1-f41.google.com with SMTP id d7so7721177otf.3
 for <ltp@lists.linux.it>; Tue, 26 Jan 2021 00:03:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gn3riWFOSuTtLdZEXF1Nsf86n3nO9ZsoSqLIAXg41vE=;
 b=Ladq4mycENdTNVHACPNxrXX2pFDTxDzOQHM5SPjLQ0FTJ4Q7Okm8jPlU/oEuFIGpzp
 yxyfk34MLYmYcdHTsxUKg8Jmob8/+TDCD71SsRIVWz+pndD3TDUlF4YuvX6KXat4MYVA
 Pou7IDY0YZ7mBuzHv+VmoqclHVy1o5rftlpQEVhJAAv/3VHQ/5n7GFi+LRZtjn12Id21
 /PTGkbK8bqWFEZL9Wd374uAlhCXh1O2autW5hjWFtEBNn27mYaNR5UX+D4lAUSsfinB/
 yb55qrtNgy0LkwPZBVlJpDglvF2ccCgMLWNVIc09zyfa7Vn52vIW8t2vRXJolblSSnCf
 4h9g==
X-Gm-Message-State: AOAM530p5LeTJDk5PwNL3Yrm+jsjV9lr4UXmce58hH4ikITTJVnSrG/s
 erhtL6JP3JRA1OKsPZJWIPCOyu2TuQ/x1cgxoXk=
X-Google-Smtp-Source: ABdhPJytIVD/4Xb2nil6CfBZHjJXQKq/Ujc3snRT0q1tZOrWGz9aNLYUvpR+IrZFMlEDPHDayYjctOwkb3DlnpFFBGc=
X-Received: by 2002:a05:6830:15cc:: with SMTP id
 j12mr3178136otr.145.1611648217240; 
 Tue, 26 Jan 2021 00:03:37 -0800 (PST)
MIME-Version: 1.0
References: <20210106075112.1593084-1-geert@linux-m68k.org>
 <20210126055112.GA19582@xsang-OptiPlex-9020>
In-Reply-To: <20210126055112.GA19582@xsang-OptiPlex-9020>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 Jan 2021 09:03:26 +0100
Message-ID: <CAMuHMdUFsRSCDJeML+0i17ig6oFr+-cz660xyhkhkfg2UtPTzQ@mail.gmail.com>
To: oliver.sang@intel.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.5 required=7.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [binfmt_elf] d97e11e25d: ltp.DS000.fail
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
Cc: 0day robot <lkp@intel.com>, LKML <linux-kernel@vger.kernel.org>,
 lkp@lists.01.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Oliver,

On Tue, Jan 26, 2021 at 6:35 AM kernel test robot <oliver.sang@intel.com> wrote:
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: d97e11e25dd226c44257284f95494bb06d1ebf5a ("[PATCH v2] binfmt_elf: Fix fill_prstatus() call in fill_note_info()")
> url: https://github.com/0day-ci/linux/commits/Geert-Uytterhoeven/binfmt_elf-Fix-fill_prstatus-call-in-fill_note_info/20210106-155236
> base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62

My patch (which you applied on top of v5.11-rc2) is a build fix for
a commit that is not part of v5.11-rc2.  Hence the test run is invalid.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
