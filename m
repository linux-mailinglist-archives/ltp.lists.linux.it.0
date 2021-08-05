Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ACED33E119A
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 11:46:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 12DDE3C7F36
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 11:46:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2DF353C5EA4
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 11:46:04 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6E687601489
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 11:46:03 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 62EE5222E7;
 Thu,  5 Aug 2021 09:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628156763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lwA2Td1h7JPWYa+3GSuDj6dlXTxp+cWaulfVbO2AimQ=;
 b=St+Sd+n61cERCrCjtyE9YIvlfTCnhUgdqqDEXhz6JDeFSkEJdSIuvekO0sEhe6mqe7q/me
 CvMnZu0uXmFys2s7XkyKq19sYxaQFa34w65Mp4zyuMusrTb1hVdHrMJC0KisQ/1dsTlVFq
 7A3Jj5x8F/ELddYMuYaso4X+qw/mWko=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628156763;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lwA2Td1h7JPWYa+3GSuDj6dlXTxp+cWaulfVbO2AimQ=;
 b=O64gofMQ+P3XQsu87EkX4Myi4qJVYqeJRmInX91btvfYrOA3o6yC03VpPhYwG5RBxdhF8/
 IwU0X0Mcm/ATxbBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 50F6C13BF0;
 Thu,  5 Aug 2021 09:46:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QmNfE1uzC2FaFAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 05 Aug 2021 09:46:03 +0000
Date: Thu, 5 Aug 2021 11:46:13 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <YQuzZYA3B3zBuVKh@yuki>
References: <20210805073339.15027-1-zhanglianjie@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210805073339.15027-1-zhanglianjie@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] [1/4] syscalls/chroot01: Convert to new API
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> +static void verify_chroot(void)
>  {
> -	int lc;
> +	TEST(chroot(path));
> 
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -
> -		tst_count = 0;
> -
> -		TEST(chroot(path));
> -
> -		if (TEST_RETURN != -1)
> -			tst_resm(TFAIL, "call succeeded unexpectedly");
> -		else if (errno != EPERM)
> -			tst_resm(TFAIL | TTERRNO, "chroot failed unexpectedly");
> -		else
> -			tst_resm(TPASS, "chroot set errno to EPERM.");
> -	}
> -	cleanup();
> -
> -	tst_exit();
> +	if (TST_RET != -1)
> +		tst_res(TFAIL, "call succeeded unexpectedly");
> +	else if (errno != EPERM)
> +		tst_res(TFAIL | TTERRNO, "chroot failed unexpectedly");
> +	else
> +		tst_res(TPASS, "chroot set errno to EPERM.");

Just use the TST_EXP_FAIL() here instead.

>  }
> 
> -void setup(void)
> +static void setup(void)
>  {
> -	tst_require_root();
> -
> -	tst_tmpdir();
>  	path = tst_get_tmpdir();
> +	if (path == NULL)
> +		tst_brk(TBROK | TERRNO, "tst_get_tmpdir failed");

Hmm I guess that we should add tst_brkm() to the lib/tst_tmpdir.c
instead to check if the strdup has failed, which would be far easier
than adding error handling to all tests.

Something as:

diff --git a/lib/tst_tmpdir.c b/lib/tst_tmpdir.c
index 0c39eb89f..35b376478 100644
--- a/lib/tst_tmpdir.c
+++ b/lib/tst_tmpdir.c
@@ -108,12 +108,18 @@ int tst_tmpdir_created(void)

 char *tst_get_tmpdir(void)
 {
+       char *ret;
+
        if (TESTDIR == NULL) {
                tst_brkm(TBROK, NULL, "you must call tst_tmpdir() first");
                return NULL;
        }

-       return strdup(TESTDIR);
+       ret = strdup(TESTDIR);
+       if (!ret)
+               tst_brkm(TBROK, NULL, "strdup() failed");
+
+       return ret;
 }


> -	if ((ltpuser = getpwnam(nobody_uid)) == NULL)
> -		tst_brkm(TBROK | TERRNO, cleanup,
> -			 "getpwnam(\"nobody\") failed");
> -
> -	SAFE_SETEUID(cleanup, ltpuser->pw_uid);
> +	if ((ltpuser = SAFE_GETPWNAM(nobody_uid)) == NULL)
> +		tst_brk(TBROK | TERRNO, "getpwnam(\"nobody\") failed");

SAFE_SETEUID() cannot fail, there is no need to check the return value.


> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> +	SAFE_SETEUID(ltpuser->pw_uid);
>  }
> 
> -void cleanup(void)
> +static void cleanup(void)
>  {
> -	SAFE_SETEUID(NULL, 0);
> +	SAFE_SETEUID(0);

There is actually no need to reset the UID in new library tests, since
the cleanup for temporary directory is carried on with the test library
process.

> -	free(path);
> -	tst_rmdir();
> +	if (path) {
> +		free(path);
> +		path = NULL;
> +	}

free(NULL) is no-op, no need for the if () here.

All that has to be done in the cleanup is actually:

static void cleanup(void)
{
	free(path);
}

>  }
> +
> +static struct tst_test test = {
> +	.cleanup = cleanup,
> +	.setup = setup,
> +	.test_all = verify_chroot,
> +	.needs_root = 1,
> +	.needs_tmpdir = 1,
> +};
> --
> 2.20.1
> 
> 
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
