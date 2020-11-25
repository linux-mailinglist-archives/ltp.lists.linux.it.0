Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6C22C3E54
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 11:47:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4EB2E3C5E32
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 11:47:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 8A78E3C223E
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 11:47:00 +0100 (CET)
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2A533600B93
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 11:47:00 +0100 (CET)
Received: by mail-ej1-x644.google.com with SMTP id bo9so2293462ejb.13
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 02:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P/Dda3TrMKEh7mM1NZG1uzUobwUSnHHig1HhvVYDq8U=;
 b=DyIqeQ5L0Z0W/MMEDCh24Pnn/PTz1MbqZUOgZTiZU8ADygSMrudEQFaAd1iwyFj166
 1Mr6svWeJ8QRYyJ50npzy8jyoJPZNH2ljPaXYv5cNrAwRu9gAgROpD6INJfQqLTbXDJq
 SB34GcsyBzI1hOIOSC5vLn0bM81JyfugHKG8qil3/hMwZiOwkCxZsaaN9JlroCK7AgYf
 pA35nzY5hCZNMKCCmBPfD5KfolEvfyBZyJ6RCZBB0xT5FlNi2SfPG0ncfrkUzLxEQG5B
 Vl4+YftnhQqDBCEzKImePx5A+wLAdlBZ8elcpbvnhHxC/iyR7596RSoSPpwp+wrjhEUw
 9LTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P/Dda3TrMKEh7mM1NZG1uzUobwUSnHHig1HhvVYDq8U=;
 b=O+EU8lOUDvzMfVDcdnefmJsMp8bwE9v1J9VU/60osyyin4ONllHmWbVe7SGvD5LWEr
 9sZ6gYuKpysSivH64cRoz6gupX/K+Et5znJgSRvHopssMcYDPkrb7Cgax9jr/SlNUXFc
 OgfXl/PcQujHi/eJW7uKbBYrfR/NhAw7F375DvBsWVonkoYT6e+NZaFqBvKAE4vgYnhP
 PZpDXTxs97diCKrqFYcxZwnnTPAnCj+RvMpBcwTddh1ULhkhpiKXU599FmULCYvIV6X4
 NJyGECZRd0E3ZuC8uul722ryCsrhoYUNUzYXNcV4N52RxNvhm+rbtFoBx0BX1H5PRcwq
 tKIQ==
X-Gm-Message-State: AOAM5328fBI2Lu95r8lmHGj+D2ybnvXrFMHUCvSLcoiStkjoy1tYW2QA
 yMN0QoG0Uk0tbE78K57BfiIgjIaDzYAYFuuIULKlSA==
X-Google-Smtp-Source: ABdhPJzAcgJVFbuDO5LNnao/kQNEW1iI4KhOcKIrr/S4M2HKWm9d60VUyamw/dXs7ig9EvlOTHwigcfk1fkF9PP5pPA=
X-Received: by 2002:a17:906:4c85:: with SMTP id
 q5mr2584819eju.375.1606301219451; 
 Wed, 25 Nov 2020 02:46:59 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYuKZGaHVvAv=ZwOL_p6UM3YhOHy0DcJRRM_DOLGYXg1Dw@mail.gmail.com>
 <20201124171628.dk6tle5lh3sx2jxg@linutronix.de>
 <20201125004632.GG4327@casper.infradead.org>
In-Reply-To: <20201125004632.GG4327@casper.infradead.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 25 Nov 2020 16:16:47 +0530
Message-ID: <CA+G9fYt+P1=efG+Ciq6Pak-NvPARx_GoqOw8FLnw4eb-LjRKrw@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] kernel BUG at mm/highmem.c:417! invalid opcode: 0000 EIP:
 zero_user_segments
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
Cc: Song Liu <songliubraving@fb.com>, Michal Hocko <mhocko@suse.com>,
 Jan Kara <jack@suse.cz>, Arnd Bergmann <arnd@arndb.de>, vtolkm@googlemail.com,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 linux-mm <linux-mm@kvack.org>, torvalds@linuxfoundation.org,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Mel Gorman <mgorman@suse.de>,
 Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 Yang Shi <shy828301@gmail.com>, LTP List <ltp@lists.linux.it>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, 25 Nov 2020 at 06:16, Matthew Wilcox <willy@infradead.org> wrote:
>
> On Tue, Nov 24, 2020 at 06:16:28PM +0100, Sebastian Andrzej Siewior wrote:
> > On 2020-11-24 18:52:44 [+0530], Naresh Kamboju wrote:
> > > While running LTP test case access01 the following kernel BUG
> > > noticed on linux next 20201124 tag kernel on i386.
> > >
> > > git short log:
> > > ----------------
> > > git log --oneline next-20201120..next-20201124 -- mm/highmem.c
> > > d9927d46febf Merge branch 'akpm-current/current'
> > > 72d22a0d0e86 mm: support THPs in zero_user_segments
> > > 2a656cad337e mm/highmem: Take kmap_high_get() properly into account
> > >
> > > Please find these easy steps to reproduce the kernel build and boot.
> >
> > This BUG_ON() is in zero_user_segments() which ash been added in commit
> >    72d22a0d0e86 mm: support THPs in zero_user_segments
> >
> > > [   50.852189] kernel BUG at mm/highmem.c:417!
> >
> > I managed to capture one invocation with:
> > zero_user_segments(0xd4367a90,
> >                  0x1000, 0x1000,
> >                  0x0, 0x50)
> > page_compound() -> 1
> > page_size() -> 4096
>
> Thanks for debugging this!  I didn't realise start1 was allowed to be
> less than start2.  Try this ... (systemd is sabotaging my efforts to
> test an i386 kernel)

This patch tested on i386, x86_64 and arm and the reported problem got fixed.
Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>

- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
