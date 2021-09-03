Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C79F03FFA54
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 08:22:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD1FE3C9582
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 08:22:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0CA0B3C280F
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 08:22:43 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4824B60072F
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 08:22:42 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4D25322660;
 Fri,  3 Sep 2021 06:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630650162;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6xJt5HV5n7c6yXtjFxfpxC8v7gCXOoIJ9ouwDx5oQ/E=;
 b=NhrIk8uGG4CKSk3dnP1s38aoGk0nZsXdKy07g4qKf8cLFuJ++dgmxJQYy05EFyB9XGgR4d
 UqruAf5MCDNIH+p3CorIT08nW1ndF0/94aTJDPLHMZskV/yxE9EZ9+Oa04wBfCUVj9Xda7
 e2Iu42kFWRWxRgtLk+HW89JeOcOXs4o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630650162;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6xJt5HV5n7c6yXtjFxfpxC8v7gCXOoIJ9ouwDx5oQ/E=;
 b=Au0nRYxw0SxZjGkTHPBLMXhM1TQXQ6vZUkPRajMmI6J7+1poulF3bOFB0gE7D6CxkVoJNH
 5J3K4npSXXvjrlAA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 15819136BF;
 Fri,  3 Sep 2021 06:22:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id cLq9AzK/MWEpUwAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Fri, 03 Sep 2021 06:22:42 +0000
Date: Fri, 3 Sep 2021 08:22:40 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YTG/MERCvZkBalov@pevik>
References: <20210902093655.6104-1-lkml@jv-coder.de>
 <20210902094219.xy73hs5ccafkrysr@vireshk-i7>
 <CAK8P3a3jH=4gq7gg64E-L158d8QZCpPjEaKBZiEY+mE+jN61Fw@mail.gmail.com>
 <84a0c4aa-4faf-4271-36c4-5570f8c3a004@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <84a0c4aa-4faf-4271-36c4-5570f8c3a004@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
Cc: Arnd Bergmann <arnd@kernel.org>, Joerg Vehlow <joerg.vehlow@aox-tech.de>,
 LTP List <ltp@lists.linux.it>, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> Hi Arnd,

> On 9/2/2021 8:32 PM, Arnd Bergmann wrote:

> > > > I am not 100% sure, how the syscall table for aarch64 is generated.
> > > > There are also compat version for some of the 32 bit only 64 bit syscalls,
> > > > but I think they are only available, when running an 32 bit arm application.
> > The syscall table for aarch64 is generated from the kernel's
> > include/uapi/asm-generic/unistd.h, which has a number of #ifdefs in
> > it. A lot of these are disabled on aarch64 since they refer to older or
> > 32-bit-only calls.

> > https://marcin.juszkiewicz.com.pl/download/tables/syscalls.html has a table
> > with the correct set of syscalls for each architecture, and scripts to generate
> > them from both the old asm-generic/unistd.h method (now only still used on
> > modern architectures) and the newer syscall.tbl format (used on older
> > architectures)
@Arnd: thanks a lot for this table and explanations! I would not expect this
kind of error in kernel sources.

When I changed / reviewed syscall numbers for LTP, I usually compared with
kernel and musl sources. I never noticed change, but now I see for
clock_gettime64 it's in musl only for arm (arch/arm/bits/syscall.h.in), but in
kernel it's not only for arm, but also for arm64:
arm64/include/asm/unistd.h:30:#define __NR_compat_clock_gettime64       403

Similarly timerfd_settime64 is for musl only for arm, in kernel for both.

All syscalls are *time64, that explains why they are only for 32bit.

> Thanks for this explanation, I already found this site, but wasn't sure if
> it is "correct".

> > It would be good to finally convert asm-generic/unistd.h to the new format
> > in order to automatically generate tables like the one used by ltp. In the
> > meantime, please double-check all architectures against Marcin's tables.
> > The same problem likely also exists elsewhere, e.g. for rv64.

> @all
> After Arnd's explanation, I guess this patch is correct and can be merged?
> Other architectures and the remaining syscalls should be checked as well.
> Maybe we can integrate Marcin's tool for extraction into ltp?
> See: https://github.com/hrw/syscalls-table
Sure.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

> Joerg

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
