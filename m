Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D1919A93D
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Apr 2020 12:15:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1D22F3C30BC
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Apr 2020 12:15:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id C609C3C307B
 for <ltp@lists.linux.it>; Wed,  1 Apr 2020 12:14:58 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 491421401850
 for <ltp@lists.linux.it>; Wed,  1 Apr 2020 12:14:57 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7ED67AE3A;
 Wed,  1 Apr 2020 10:14:57 +0000 (UTC)
Date: Wed, 1 Apr 2020 12:14:55 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200401101455.GA12069@dell5510>
References: <20200401083228.GA18685@dell5510> <20200401093934.GA23773@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200401093934.GA23773@yuki.lan>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] LTP compilation broken with -fno-common
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
Cc: Martin Doucha <martin.doucha@suse.com>, ltp@lists.linux.it,
 Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

...
> Maybe we can add it with a weak linker attribute. What about this patch:

> diff --git a/include/tst_test.h b/include/tst_test.h
> index 259d87d60..352e2cd64 100644
> --- a/include/tst_test.h
> +++ b/include/tst_test.h
> @@ -322,9 +322,7 @@ int main(int argc, char *argv[])

>  #define TST_TEST_TCONF(message)                                 \
>          static struct tst_test test = { .tconf_msg = message  } \
> -/*
> - * This is a hack to make the testcases link without defining TCID
> - */
> -const char *TCID;
> +
> +extern const char *TCID;

>  #endif /* TST_TEST_H__ */
> diff --git a/lib/tst_test.c b/lib/tst_test.c
> index 73827d472..4ce8cc301 100644
> --- a/lib/tst_test.c
> +++ b/lib/tst_test.c
> @@ -32,6 +32,11 @@
>  #include "old_device.h"
>  #include "old_tmpdir.h"

> +/*
> + * Hack to get TCID defined in newlib tests
> + */
> +const char *TCID __attribute__((weak));
> +
>  #define LINUX_GIT_URL "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id="
>  #define CVE_DB_URL "https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-"

Yep working locally :).
https://travis-ci.org/github/pevik/ltp/builds/669619899

> I guess that we can even drop the TCID extern definition from the tst_test.h
> header if the weak attribute works fine.
Also this is working.
Let's wait for travis (also added -fno-common into CFLAGS for all jobs).
https://travis-ci.org/github/pevik/ltp/builds/669620839

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
