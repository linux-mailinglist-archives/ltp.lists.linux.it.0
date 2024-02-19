Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D988E85A83F
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Feb 2024 17:09:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A2ED33D137C
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Feb 2024 17:09:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 13B8D3C0E54
 for <ltp@lists.linux.it>; Mon, 19 Feb 2024 17:09:25 +0100 (CET)
Authentication-Results: in-5.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 10166600477
 for <ltp@lists.linux.it>; Mon, 19 Feb 2024 17:09:24 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 865C8220E9;
 Mon, 19 Feb 2024 16:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1708358963;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TMmauK4S0hmJm/iIIvry1AGFJ77DUeF366a2xeXv8nU=;
 b=A/xAlCclCml5jxCfLYpg0mLZKBNg82dDpy5HfA44ep8jZlo+BmRTlS6ykWvZbNe7EmZeBJ
 lEMgPZkbOdkf9g6nG8FG45czYkORrqdtsZG5seOXqSytznmJx9NAoMJYZnffldMz8P00I9
 Ed24cas6FPBQdTd5t9jJSEqFCsoRQF8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1708358963;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TMmauK4S0hmJm/iIIvry1AGFJ77DUeF366a2xeXv8nU=;
 b=W6Tg7KE37C8CW58H3/VZY4jIiGtZXlUUkpiqVD/qGY8ARexBBLz71TPZXrr/EJj53xUR2/
 +xACrUqY2RTBotAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1708358963;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TMmauK4S0hmJm/iIIvry1AGFJ77DUeF366a2xeXv8nU=;
 b=A/xAlCclCml5jxCfLYpg0mLZKBNg82dDpy5HfA44ep8jZlo+BmRTlS6ykWvZbNe7EmZeBJ
 lEMgPZkbOdkf9g6nG8FG45czYkORrqdtsZG5seOXqSytznmJx9NAoMJYZnffldMz8P00I9
 Ed24cas6FPBQdTd5t9jJSEqFCsoRQF8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1708358963;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TMmauK4S0hmJm/iIIvry1AGFJ77DUeF366a2xeXv8nU=;
 b=W6Tg7KE37C8CW58H3/VZY4jIiGtZXlUUkpiqVD/qGY8ARexBBLz71TPZXrr/EJj53xUR2/
 +xACrUqY2RTBotAA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 6BECC13585;
 Mon, 19 Feb 2024 16:09:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id QPUUGTN902ViKwAAn2gu4w
 (envelope-from <pvorel@suse.cz>); Mon, 19 Feb 2024 16:09:23 +0000
Date: Mon, 19 Feb 2024 17:09:22 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20240219160922.GB1021019@pevik>
References: <20240219134030.12693-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240219134030.12693-1-mdoucha@suse.cz>
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-3.30 / 50.00]; ARC_NA(0.00)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz]; REPLYTO_EQ_FROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 REPLY(-4.00)[]; RCVD_COUNT_THREE(0.00)[3];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCPT_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_NOT_FQDN(0.50)[];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.00)[13.99%]
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] open07: Convert to new API
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

Hi Martin,

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Few minor things below, can be fixed before merge.

...
>  #define _GNU_SOURCE		/* for O_NOFOLLOW */
nit: This now works without _GNU_SOURCE (we compile with -std=gnu99 and it would
work for whatever gnu*).

> -#include <stdio.h>
> -#include <errno.h>
> -#include <sys/types.h>
>  #include <sys/stat.h>
nit: IMHO <sys/stat.h> was not needed even in the old API version.

> -#include <fcntl.h>
> -#include "test.h"
> -#include "safe_macros.h"
...
> +#include "tst_test.h"
> +#include "tst_safe_macros.h"
> +
> +#define TESTFILE "testfile"
> +#define TESTDIR "testdir"
> +#define SYMFILE1 "symfile1"
> +#define SYMFILE2 "symfile2"
> +#define SYMDIR1 "symdir1"
> +#define SYMDIR2 "symdir2"
> +#define PASSFILE "symdir1/testfile"
> +
> +static int fd = -1;
nit: any reason for -1? (We don't check the input.)

> +static struct testcase {
> +	const char *path;
> +	int err;
> +	const char *desc;
> +} testcase_list[] = {
> +	{SYMFILE1, ELOOP, "open(O_NOFOLLOW) a symlink to file"},
> +	{SYMFILE2, ELOOP, "open(O_NOFOLLOW) a double symlink to file"},
> +	{SYMDIR1, ELOOP, "open(O_NOFOLLOW) a symlink to directory"},
> +	{SYMDIR2, ELOOP, "open(O_NOFOLLOW) a double symlink to directory"},
> +	{PASSFILE, 0, "open(O_NOFOLLOW) a file in symlinked directory"},

...
> +static void setup(void)
>  {
> -	char file1[100], file2[100];
> -
> -	sprintf(file1, "open11.3.%d", getpid());
> -	sprintf(file2, "open12.4.%d", getpid());
> -	SAFE_MKDIR(cleanup, file1, 00700);
> +	umask(0);
> +	fd = SAFE_CREAT(TESTFILE, 0644);
> +	SAFE_CLOSE(fd);
> +	SAFE_MKDIR(TESTDIR, 0755);

> -	SAFE_SYMLINK(cleanup, file1, file2);
> +	SAFE_SYMLINK(TESTFILE, SYMFILE1);
> +	SAFE_SYMLINK(SYMFILE1, SYMFILE2);
> +	SAFE_SYMLINK(TESTDIR, SYMDIR1);
> +	SAFE_SYMLINK(SYMDIR1, SYMDIR2);

> -	strcpy(TC[4].filename, file2);
> -	strcat(TC[4].filename, "/");
> +	fd = SAFE_CREAT(PASSFILE, 0644);
> +	SAFE_CLOSE(fd);
>  }

> -static void setup(void)
> +static void run(unsigned int n)
>  {
> -	umask(0);
> +	const struct testcase *tc = testcase_list + n;

> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> +	TST_RET = -1;
nit: IMHO this is not needed (we have 0 for stdin, right? Therefore open()
should not get 0 and check below is correct).

Kind regards,
Petr

> -	TEST_PAUSE;
> +	if (tc->err) {
> +		TST_EXP_FAIL2(open(tc->path, O_NOFOLLOW | O_RDONLY), tc->err,
> +			"%s", tc->desc);
> +	} else {
> +		TST_EXP_FD(open(tc->path, O_NOFOLLOW | O_RDONLY),
> +			"%s", tc->desc);
> +	}

> -	tst_tmpdir();
> +	if (TST_RET >= 0)
> +		SAFE_CLOSE(TST_RET);
>  }

...
> +static struct tst_test test = {
> +	.setup = setup,
> +	.test = run,
> +	.tcnt = ARRAY_SIZE(testcase_list),
> +	.needs_tmpdir = 1
> +};

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
