Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 428C13C6E5D
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 12:24:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D6AC23C8770
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 12:24:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 888143C4DF6
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 12:24:31 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C5A80200A0D
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 12:24:30 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 238672227A;
 Tue, 13 Jul 2021 10:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626171870;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qAh4ifwWvt6Zo75c6kK+O+wUyarkMNAwabPFTMqQUQ0=;
 b=GVK0m2Wwcw0usWQMPM3QxvO1G0ABTfnW+wFGCsJzUGeOKNRuCn+Lyz9NiOeJlsuHS/pXFY
 oITVoYazqNyYkE0h/yUCf6ldKIXek4AWj2+otYvyVmHFKi1CAP7Cdi8BcuSUWMniCB4tvm
 D33F94nuh4EwKLKQwb1+nVlHqJ7UVHk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626171870;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qAh4ifwWvt6Zo75c6kK+O+wUyarkMNAwabPFTMqQUQ0=;
 b=IRLjLyYl5W06hS4KJWURXHL+kT3WiDnbH7DXctmOYaYaBEPAYVQITcbbmiU1yVKCRTCV5Z
 W234lgujfUT5ntDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DF03713AE3;
 Tue, 13 Jul 2021 10:24:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Y8NHNN1p7WA1YwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 13 Jul 2021 10:24:29 +0000
Date: Tue, 13 Jul 2021 12:24:28 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YO1p3LfWwdY0cmGj@pevik>
References: <YOx1pir0UuBNM+4w@pevik>
 <CAASaF6zS0kPHk6vSvANA1KzuOCtJHskLmOE_DE1n4b5AhMUPkg@mail.gmail.com>
 <YO1VaOB8nnMh6FT1@pevik> <YO1cIhIKgEPrApUC@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YO1cIhIKgEPrApUC@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] tst_strstatus.c fails on Alpine
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> Hi!
> > Thanks for a hint. Indeed WIFSIGNALED(0xff) returns 1, thus tst_strstatus()
> > returns signaled(status).

> > musl defines WIFSIGNALED() as:

> > #define WIFSIGNALED(s) (((s)&0xffff)-1U < 0xffu)

> > which returns 1.

> > Glibc defines __WIFSIGNALED() as:

> > #define __WIFSIGNALED(status) \
> >   (((signed char) (((status) & 0x7f) + 1) >> 1) > 0)

> > which returns 0.

> > I wonder if it's a musl bug which we should report or {0x100, "invalid status
> > 0xff"} test case is glibc specific and we should guard it with #ifdef __GLIBC__.

> The process exit values are defined in the kernel ABI so I would say
> that there shouldn't be any differencies between how these are handled
> inside different libc implementation. That being said the musl version
> is incorrect only for invalid values that will probably not happen in
> practice. Glibc is simply more defensive in parsing and rejects invalid
> conditions.
Agree.


> WIFSIGNALED() is supposed to return 1 only if process was killed by a
> signal, which means that the upper byte of the status is ignored and the
> lower byte has to look like:

> 7 6 5 4 3 2 1 0
> x . . . . . . .
>   ^
> ^ Termination signal

> Core dumped flag

> Also this value can't be set tio 0x7f since that means "stopped by
> signal".

> This is exaclty what glibc does since it masks the termination signal
> number with 0x7f then adds 1, which would overlfow to 0x80 if the value
> was 0x7f initially and end up being negative. The bitshift is there to
> erase the +1 in a case we started with 0.

> The musl libc returns 1 if the lower byte is non-zero and the upper byte
> is zero, which depends on the fact that the upper byte is unused and
> filled in zeroes when the process was killed by a signal and non-zero in
> all other cases where the lower byte is non-zero. As long as we get only
> valid status from wait() this is going to work fine.

Thanks for a detailed explanation.

> To be honest I like the defensive parsing from libc more than the musl
> variant but I'm not 100% sure if this is something that should be added
> to musl as well.

FYI musl commit 41c63282 ("fix definitions of WIFSTOPPED and WIFSIGNALED
to support up to signal 127") [1] mentions mips bug discussion on linux-mips ML
from 2013 (musl fix is also from that time) [2]:

> I think it's feasible to ask {g,uc}libc to change their defines
> (on MIPS as a minimum), and live with 127 signals.

=> I haven't checked if it was posted at the time. I wonder if anybody cares
enough about mips nowadays to fix this. I also like these guarders, thus I
wonder if musl should have it only for mips (currently it's for all archs).


Kind regards,
Petr

[1] https://git.musl-libc.org/cgit/musl/commit/?id=41c632824c08ac2c9eea43b30d1b3515dd910df6
[2] https://www.linux-mips.org/archives/linux-mips/2013-06/msg00552.html


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
