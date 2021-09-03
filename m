Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6EB3FFFAC
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 14:20:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0E7BA3C959D
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 14:20:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A36F03C27E8
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 14:20:31 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A364D1A016D1
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 14:20:30 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E2F0E2242F;
 Fri,  3 Sep 2021 12:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630671629;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bT2Y6gHHFupmHR6l4DTdeFAXu6JJL0xF6LW69Ndbsy4=;
 b=shjTsWc8Z+E1k8eNkK6MzLHsv1erPpx4aj14Hrjm/RNBMAHmtTVFiO9lcERZI9rOPv1IyK
 ZQtrtMlOajOFRt0Ly4rn4pKg4MlzzOd/1c/PGqVGoGfNmhK1phiuwJeZ6VcdiciwrCneux
 AORUIgseLPHAJZaaN2YLPwvdxC1FgfQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630671629;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bT2Y6gHHFupmHR6l4DTdeFAXu6JJL0xF6LW69Ndbsy4=;
 b=eUp5IwZUozS80oBLiZfvPNyUCfSFr6TTDxlxAz0hncTFA+i5cPVFlgdphqRfWwakDBlXNb
 s3cDa6ZcC/sZI6Dw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id ADCA0137C9;
 Fri,  3 Sep 2021 12:20:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id JcQMKQ0TMmESLAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Fri, 03 Sep 2021 12:20:29 +0000
Date: Fri, 3 Sep 2021 14:20:28 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <YTITDDicfJpDabDy@pevik>
References: <20210902093655.6104-1-lkml@jv-coder.de>
 <20210902094219.xy73hs5ccafkrysr@vireshk-i7>
 <CAK8P3a3jH=4gq7gg64E-L158d8QZCpPjEaKBZiEY+mE+jN61Fw@mail.gmail.com>
 <84a0c4aa-4faf-4271-36c4-5570f8c3a004@jv-coder.de>
 <YTG/MERCvZkBalov@pevik>
 <CAK8P3a3wOfFnN5UQ6MC0z+PtCSmMz_3NFmatAuD1Lb6jH7J+YA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a3wOfFnN5UQ6MC0z+PtCSmMz_3NFmatAuD1Lb6jH7J+YA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/aarch64: Remove 32 bit only syscalls
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Joerg Vehlow <joerg.vehlow@aox-tech.de>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> On Fri, Sep 3, 2021 at 6:22 AM Petr Vorel <pvorel@suse.cz> wrote:

> > Hi all,

> > > Hi Arnd,

> > > On 9/2/2021 8:32 PM, Arnd Bergmann wrote:

> > > > > > I am not 100% sure, how the syscall table for aarch64 is generated.
> > > > > > There are also compat version for some of the 32 bit only 64 bit syscalls,
> > > > > > but I think they are only available, when running an 32 bit arm application.
> > > > The syscall table for aarch64 is generated from the kernel's
> > > > include/uapi/asm-generic/unistd.h, which has a number of #ifdefs in
> > > > it. A lot of these are disabled on aarch64 since they refer to older or
> > > > 32-bit-only calls.

> > > > https://marcin.juszkiewicz.com.pl/download/tables/syscalls.html has a table
> > > > with the correct set of syscalls for each architecture, and scripts to generate
> > > > them from both the old asm-generic/unistd.h method (now only still used on
> > > > modern architectures) and the newer syscall.tbl format (used on older
> > > > architectures)
> > @Arnd: thanks a lot for this table and explanations! I would not expect this
> > kind of error in kernel sources.

> I don't see anything wrong in the kernel sources here, just a little misleading
> when read by a human rather than a compiler.

> > When I changed / reviewed syscall numbers for LTP, I usually compared with
> > kernel and musl sources. I never noticed change, but now I see for
> > clock_gettime64 it's in musl only for arm (arch/arm/bits/syscall.h.in), but in
> > kernel it's not only for arm, but also for arm64:
> > arm64/include/asm/unistd.h:30:#define __NR_compat_clock_gettime64       403

> This is a kernel-internal definition that is used to build the 32-bit VDSO. The
> file is not made available to user space applications.

Thanks for info!

> The file you need to look at for arm64 is include/uapi/asm-generic/unistd.h.
> As I said, that file has a lot of #ifdefs and other magic in it, but I suppose
> we could come up with a script to process it with /usr/bin/unifdef to only
> get the parts you are interested in. Ideally though we would just
> convert it into the modern machine-readable syscall.tbl format.

+1

Kind regards,
Petr

>         Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
