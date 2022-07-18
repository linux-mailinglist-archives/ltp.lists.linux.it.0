Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E75F577FD8
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jul 2022 12:39:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 64C3F3C95CE
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jul 2022 12:39:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2B4993C91A6
 for <ltp@lists.linux.it>; Mon, 18 Jul 2022 12:39:13 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A950F60070D
 for <ltp@lists.linux.it>; Mon, 18 Jul 2022 12:39:12 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id A754C1F99C;
 Mon, 18 Jul 2022 10:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658140751;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+Qz6AqtY3l3UcSJXNQV3pLqI8k3orWmJcZZi3ZN3FTA=;
 b=17XuWbCCatudo5MpvfucghTVX7ZH//fncMtcmUFPaXzp5d/XWfW9t/7T9jgOJy3WM9Eujk
 PNmuW+6Kh2y+yJkz2OFzq9bbv9TSzd/bwwKK7oVZF4NdyY0ur0wR1g42VbtOOfAACwxqIk
 JAeaoA+MK+Gf8LtNYaTAXWqQNTD4B9s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658140751;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+Qz6AqtY3l3UcSJXNQV3pLqI8k3orWmJcZZi3ZN3FTA=;
 b=/xpZzNQJ9sISMMwPFUOlJGwQ0qCk9j6Y92UFHWgasmx6aLZGcaDRptkgybL9kz3wuXP+2f
 Yyns8pEUvL7JzKAw==
Received: from g78 (unknown [10.163.24.226])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 6EA5B2C141;
 Mon, 18 Jul 2022 10:39:11 +0000 (UTC)
References: <20220712124617.23139-1-rpalethorpe@suse.com>
 <CAASaF6xwEpong-apUxxZxQB47cw-2yaBEpn+AjjogU3qxHag1g@mail.gmail.com>
 <YtBYsYOMskQ6v3dD@pevik>
User-agent: mu4e 1.6.10; emacs 28.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
Date: Mon, 18 Jul 2022 11:37:59 +0100
In-reply-to: <YtBYsYOMskQ6v3dD@pevik>
Message-ID: <87lesqiu29.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] read_all: Add worker timeout
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
Reply-To: rpalethorpe@suse.de
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Petr Vorel <pvorel@suse.cz> writes:

> Hi all,
>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>
>> > +static void restart_worker(struct worker *const worker)
>> > +{
>> > +       int wstatus, ret, i, q_len;
>> > +       struct timespec now;
>> > +
>> > +       kill(worker->pid, SIGKILL);
>> > +       ret = waitpid(worker->pid, &wstatus, 0);
>
>> Is there a chance we could get stuck in uninterruptible read? I think I saw some
>> in past, but those may be blacklisted already, so this may only be something
>> to watch for if we still get test timeouts in future.
>
> +1
>
> ...
>> > +       if (ret != worker->pid) {
>> > +               tst_brk(TBROK | TERRNO, "waitpid(%d, ...) = %d",
>> > +                       worker->pid, ret);
>> > +       }
>> > +
>> > +       /* Make sure the queue length and semaphore match. Threre is a
>> > +        * race in qeuue_pop where the semaphore can be decremented
>> ^^ typo in queue_pop above
>
> ...
>> > +               tst_clock_gettime(CLOCK_MONOTONIC_RAW, &now);
>> > +               elapsed =
>> > +                       tst_timespec_to_ms(now) - tst_atomic_load(&w->last_seen);
>> > +
>> > +               if (elapsed > worker_timeout) {
>> > +                       if (!quiet) {
>> > +                               tst_res(TINFO,
>> > +                                       "Worker %d (%d) stuck for %dms, restarting it",
>> > +                                       i, w->pid, elapsed);
>
>> Can we also print file worker is stuck on?
>> And as Li pointed out, I'd also extend max_runtime to 60 seconds.
>
> +1, all these additional changes make sense to me.

OK I'll make these changes, thanks!

>
> Kind regards,
> Petr


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
