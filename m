Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC1644BFC5
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Nov 2021 12:05:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6AA703C1B6A
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Nov 2021 12:05:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 993F93C0732
 for <ltp@lists.linux.it>; Wed, 10 Nov 2021 12:05:16 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8CCE760102D
 for <ltp@lists.linux.it>; Wed, 10 Nov 2021 12:05:15 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C4CC71FD6C;
 Wed, 10 Nov 2021 11:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1636542314; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2rXUzq+YwWPuTpop2fmNjtsSru6YCap9VukqTjHS54o=;
 b=CETKUDHmJeqFJjwOgYm/NzH0GQKghyMyDqaIr6UlI9qG9hvwnBVZe3HvpFmOGlemh/8FgW
 EDgFy5P4IDAXkn0Ca5jqxGxwb/n0rXl92x16gtM4bOwkCBB2kREmWKbiYJsfV+bXzKiqXy
 zZl680KkIYEXKX5K36XVvcFqa2qsv+U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1636542314;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2rXUzq+YwWPuTpop2fmNjtsSru6YCap9VukqTjHS54o=;
 b=9R29eWSqT4fCvfw1T79bysZ3jI+w8jVwblIcdiAIX6CoTATwNzmzbGAq7YvMIXmr5RCVd6
 vbxKG63L10BJ9FCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B04AB13BAC;
 Wed, 10 Nov 2021 11:05:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6TQDK2qni2EqTAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 10 Nov 2021 11:05:14 +0000
Date: Wed, 10 Nov 2021 12:06:17 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: tangmeng <tangmeng@uniontech.com>
Message-ID: <YYunqaGXPcPfPvNc@yuki>
References: <20211109085745.21531-1-tangmeng@uniontech.com>
 <20211109085745.21531-2-tangmeng@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211109085745.21531-2-tangmeng@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] getuid/getuid03: Convert to new API
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
> +static void verify_getuid(void)
>  {
>  	struct passwd *pwent;
> -	int lc;
>  	uid_t uid;
> 
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> +	TEST(GETUID());
> 
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> +	if (TST_RET == -1)
> +		tst_brk(TBROK | TTERRNO, "getuid failed");
> 
> -		tst_count = 0;
> +	uid = getuid();

We have the return from getuid() stored in TST_RET at this point, why do
we call it again here?

> +	pwent = getpwuid(uid);
> 
> -		TEST(GETUID(cleanup));
> +	if (pwent == NULL)
> +		tst_res(TFAIL | TERRNO, "getpwuid failed");

I guess that we should exit the test here, otherwise it will segfault,
so this should be tst_brk(TBROK | TERRNO, ...);

Also I do wonder if comparing the return from getuid() to the return
from getpwuid(getguid()) makes any sense. We lookup password entry given
an uid then check that the password entry uid matches. That sounds like
a test for getpwuid() more than anything else.

I wonder what would be better check. We should rather than this check
the return value against the /proc/self/status where all the UIDs are
listed as well.


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
