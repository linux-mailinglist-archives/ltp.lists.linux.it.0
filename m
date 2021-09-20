Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C68411085
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Sep 2021 09:53:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EE6FB3C8779
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Sep 2021 09:53:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BBE233C21F8
 for <ltp@lists.linux.it>; Mon, 20 Sep 2021 09:53:01 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1AD9F600103
 for <ltp@lists.linux.it>; Mon, 20 Sep 2021 09:53:00 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 49FDF2003A;
 Mon, 20 Sep 2021 07:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1632124380;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TYaJGXvrx6xJcAppyiC6g+uBZbmNOk3LJyheJzw49yk=;
 b=t667NROIvfplFUekqOO+xJdUkEA5pN1bisBWKQqBYCUXlpNqlu45TxlxYjy4Wg3kGeULmk
 3+831VYn883KTJ4Yt46AhjPvceegbX8+lyC+kQdp+zbk+cttS+HD3rhEtePMOLMbLH2xF5
 gssikDegK2JNKytKrY9mq1nas+QNTRw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1632124380;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TYaJGXvrx6xJcAppyiC6g+uBZbmNOk3LJyheJzw49yk=;
 b=vhqWK+5xK7xgxEtXNV4dgP8I9wOA+QKN/4ktAgwJoTpwg3xOXsFtBdxjUFvqrm+pVnZ06S
 0EUxLNrlQ5cHMvCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 174C113ACC;
 Mon, 20 Sep 2021 07:52:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id B1i5Ods9SGEZCQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 20 Sep 2021 07:52:59 +0000
Date: Mon, 20 Sep 2021 09:52:57 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YUg92YO7x1wQO/qD@pevik>
References: <20210917141719.5739-1-chrubis@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210917141719.5739-1-chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] [RFC] lib: shell: Fix timeout process races
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

Hi Cyril,

Reviewed-by: Petr Vorel <pvorel@suse.cz>
Tested-by: Petr Vorel <pvorel@suse.cz>

> There were actually several races in the shell library timeout handling.

> This commit fixes hopefully all of them by:

> * Reimplementing the backgroud timer in C
+1

> * Making sure that the timer has started before we leave test setup
+1

> The rewrite of the backround timer to C allows us to run all the timeout
> logic in a single process, which simplifies the whole problem greatly
> since previously we had chain of processes that estabilished signal
> handlers to kill it's descendants, which in the end had a few races in
> it.

> The race that caused the problems is, as far as I can tell, in the way
> how shell spawns it's children. I haven't checked the shell code, but I
> guess that when shell runs a process in bacground it does vfork() +
> exec() and because signals are ignored during the operation. If the
> SIGTERM arrives at that point it gets lost.

> That means that we created a race window in the shell library each time
> we started a new process. The rewrite to C simplifies the code but we
> still end up with a single place where this can happen and that is when
> we execute the tst_timeout_kill binary. This is now fixed in the shell
> library by waiting until the background process gets to a sleep state,
> which means that the proces has been executed and waiting for the
> timeout.

> After these fixes I haven't been able to reproduce the hang with:

> cat > debug.sh <<EOF
> #!/bin/sh

> TST_SETUP="setup"
> TST_TESTFUNC="do_test"
> . tst_test.sh

> setup()
> {
>         tst_brk TCONF "quit now!"
> }

> do_test()
> {
>         tst_res TPASS "pass :)"
> }

> tst_run
> EOF

> # while true; do ./debug.sh; done
I verified it's ok on both VM which were previously affected.

After release I might write a test for tst_timeout_kill.c.
Thanks for fixing it!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
