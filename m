Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BE73E1462
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 14:04:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7E41F3C7DB2
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 14:04:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1C9083C7D85
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 14:04:46 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 81D98601A6D
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 14:04:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AB03D20211;
 Thu,  5 Aug 2021 12:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628165085; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zGeI0vis3+Q1ZJ/7+UX7gU0+T29++U67gFLQQoWwYJQ=;
 b=QeKL49UlnRqUCPQjovKlb9hs+NmeBdraesIZGsbS0IR8uQ4G316exNjFDwV5HHtpKrcqOr
 nSss/HkRGcjowukP8eKOwcsUW+Fp6PR3yuOP1yMiEhh0Uy209nZ2+JKcMmbB18ec7wRJcF
 yYfrEQZmiE1T+MApqe7B/txUyPff7gA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628165085;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zGeI0vis3+Q1ZJ/7+UX7gU0+T29++U67gFLQQoWwYJQ=;
 b=/I3AcV4Lf+TvIsfbz0sGxS07Nd7AVPO83v/HL9BIYLZqM0Tzcdu7bxnnaF9ZqF4Si2xQHm
 heqisjoluHYQo0Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 749A613D61;
 Thu,  5 Aug 2021 12:04:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZhTyFt3TC2GeOgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 05 Aug 2021 12:04:45 +0000
Date: Thu, 5 Aug 2021 14:04:54 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: sujiaxun <sujiaxun@uniontech.com>
Message-ID: <YQvT5slxDpsJtSDc@yuki>
References: <20210805110349.16615-1-sujiaxun@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210805110349.16615-1-sujiaxun@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] [3/6] syscalls/sysfs: Convert sysfs03 to the new
 API
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
> +/*
> + * [DESCRIPTION]

Here as well [Description]

> + * This test is run for option 3 for sysfs(2)
> + */
> 
>  #include <errno.h>
>  #include <unistd.h>
>  #include <sys/syscall.h>
> -#include "test.h"
> +#include "tst_test.h"
>  #include "lapi/syscalls.h"
> 
> -static void setup();
> -static void cleanup();
> -
> -char *TCID = "sysfs03";
> -int TST_TOTAL = 1;
> -
> -int main(int ac, char **av)
> +static void verify_sysfs03(void)
>  {
> -	int lc;
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> 
> -	setup();
> 
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -
> -		tst_count = 0;
> -
> -		TEST(ltp_syscall(__NR_sysfs, 3));
> +		TEST(tst_syscall(__NR_sysfs, 3));
> 
>  		/* check return code */
> -		if (TEST_RETURN == -1) {
> -			tst_resm(TFAIL, "sysfs(2) Failed for"
> +		if (TST_RET == -1) {
> +			tst_res(TFAIL, "sysfs(2) Failed for"
>  				 " option 3 and returned"
> -				 " %d as error number", TEST_ERRNO);
> +				 " %d as error number", TST_ERR);
>  		} else {
> -			tst_resm(TPASS, "sysfs(2) Passed for option 3");
> +			tst_res(TPASS, "sysfs(2) Passed for option 3");
>  		}
> -	}			/*End of TEST_LOOPING */

And here as well this could be replaced with TST_EXP_POSSITIVE()


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
