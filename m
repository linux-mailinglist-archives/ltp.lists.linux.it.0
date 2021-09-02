Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6364C3FE909
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 08:02:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A6C423C9943
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 08:02:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2804C3C288E
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 08:02:20 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 2C09A1A0175D
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 08:02:19 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4B8921FCA3;
 Thu,  2 Sep 2021 06:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630562539;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vGrnjLv+YynbtB0c9C0vTthAYBjMFlqDf6yJ3YwKrLc=;
 b=O/FfSVLPwvxwV1/XAJuhsCpOQiSQ4yMYY4POVX0v0OR3MlmNuHNHEmh1n6dZjpU+8XgSAO
 vBMiwj3GpCoy7vN46VZWeOD7w1P10Zvp/AFURRXlJzXaiv/pWCm3mXsJj43tx6RZQNWoKT
 44KOK2/Consnc4cauCOXrUb62Jvb8OI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630562539;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vGrnjLv+YynbtB0c9C0vTthAYBjMFlqDf6yJ3YwKrLc=;
 b=jwiMmd26u5vHR44g85UJd27e0ObIrOO72OE/9lI8Ou4AQEzPwrgTLMLXh4j2IJmFTM4xUz
 6cKdYXzKN+k8oOAQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 2B1011389C;
 Thu,  2 Sep 2021 06:02:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id SjiDCOtoMGHKJwAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Thu, 02 Sep 2021 06:02:19 +0000
Date: Thu, 2 Sep 2021 08:02:17 +0200
From: Petr Vorel <pvorel@suse.cz>
To: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <YTBo6ZS2GKWb8edF@pevik>
References: <20210902010814.32448-1-zhanglianjie@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210902010814.32448-1-zhanglianjie@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/7] syscalls/clone01: Convert to new API
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

Hi zhanglianjie,

...
> +static void verify_clone(void)
>  {
> -	void *child_stack;
>  	int status, child_pid;

> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> +	TST_EXP_POSITIVE(ltp_clone(SIGCHLD, do_child, NULL,
Shouldn't be TST_EXP_PID_SILENT()
Because TST_EXP_POSITIVE() prints extra TPASS which is useless:

clone01.c:31: TPASS: clone() returned 11556
clone01.c:37: TPASS: clone returned 11556
clone01.c:43: TPASS: Child exited with 0

but with TST_EXP_PID_SILENT():
clone01.c:37: TPASS: clone returned 11986
clone01.c:43: TPASS: Child exited with 0

and on deliberate error (using -1 as flag):
clone01.c:31: TFAIL: clone() failed: EINVAL (22)
clone01.c:34: TBROK: wait(0x7ffed515f3ec) failed: ECHILD (10)

> +		CHILD_STACK_SIZE, child_stack), "clone()");

> -	child_stack = malloc(CHILD_STACK_SIZE);
> -	if (child_stack == NULL)
> -		tst_brkm(TBROK, cleanup, "Cannot allocate stack for child");
> +	child_pid = SAFE_WAIT(&status);

> -	tst_count = 0;
> -
> -	TEST(ltp_clone(SIGCHLD, do_child, NULL, CHILD_STACK_SIZE, child_stack));
> -	if (TEST_RETURN == -1)
> -		tst_resm(TFAIL | TTERRNO, "clone failed");
> -
> -	child_pid = SAFE_WAIT(cleanup, &status);
> -
> -	if (TEST_RETURN == child_pid)
> -		tst_resm(TPASS, "clone returned %ld", TEST_RETURN);
> +	if (TST_RET == child_pid)
	if (child_pid ==  TST_RET)

=> run `make check-clone01' to see this error (and run make check-* for other
tests).


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
