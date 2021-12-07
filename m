Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 278D846C331
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Dec 2021 19:54:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C88843C5AEA
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Dec 2021 19:54:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5C5BB3C0480
 for <ltp@lists.linux.it>; Tue,  7 Dec 2021 19:54:02 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 421DB1000910
 for <ltp@lists.linux.it>; Tue,  7 Dec 2021 19:54:01 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1E3421FE00;
 Tue,  7 Dec 2021 18:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1638903241; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7Fbjk3K9y1FhR/cN/GQslAj9DLABUDlH9LP4Zzb5W8Y=;
 b=bALHMYc0Y739jaX6EU4oOzg+kRqTY4EG2d500c9hv6c/Qhrnz2QFEko23BIDzUp2wH4yAP
 AXMN6GblpB/xxg9nQf7xy+OFot2UH2ZunXpXMlK2hAlrUs99isP9j5b8t3YJ6prRwW+uJh
 WVgBp0U7uFV+ZvgO9wlPhLLnT91ssDM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1638903241;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7Fbjk3K9y1FhR/cN/GQslAj9DLABUDlH9LP4Zzb5W8Y=;
 b=fdiwntf5cCG/8PTZw7wYsg43uSrNPXwEyBLgoTdPZoncnfkFzPkk1k6m4+DraQnIevHYQ0
 W7DRfz6GvBr8KBAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E475513ABA;
 Tue,  7 Dec 2021 18:54:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id auhfN8itr2F2YwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 07 Dec 2021 18:54:00 +0000
Date: Tue, 7 Dec 2021 19:55:17 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <Ya+uFTYWT6h7tj9b@yuki>
References: <20211207132926.20703-1-andrea.cervesato@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211207132926.20703-1-andrea.cervesato@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] Add tst_parse_filesize functionality in LTP
 test API
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
> Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
> ---
>  include/tst_test.h               |   1 +
>  lib/newlib_tests/test_tst_test.c | 122 +++++++++++++++++++++++++++++++

What we are missing here is a .gitignore entry for the test_tst_test
biary, try 'git status .' in the newlib_tests directory and you will
see...

>  lib/tst_test.c                   |  41 +++++++++++
>  3 files changed, 164 insertions(+)
>  create mode 100644 lib/newlib_tests/test_tst_test.c
> 
> diff --git a/include/tst_test.h b/include/tst_test.h
> index c06a4729b..450ddf086 100644
> --- a/include/tst_test.h
> +++ b/include/tst_test.h
> @@ -122,6 +122,7 @@ struct tst_option {
>  int tst_parse_int(const char *str, int *val, int min, int max);
>  int tst_parse_long(const char *str, long *val, long min, long max);
>  int tst_parse_float(const char *str, float *val, float min, float max);
> +int tst_parse_filesize(const char *str, long long *val, long long min, long long max);
>  
>  struct tst_tag {
>  	const char *name;
> diff --git a/lib/newlib_tests/test_tst_test.c b/lib/newlib_tests/test_tst_test.c

Can we please rename the file to test_parse_filesize here as well?

> new file mode 100644
> index 000000000..8ee4e2932
> --- /dev/null
> +++ b/lib/newlib_tests/test_tst_test.c
> @@ -0,0 +1,122 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2021 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
> + */
> +
> +/*
> + * Tests for tst_parse_filesize.
> + */
> +
> +#include "tst_test.h"
> +
> +static void do_test(void)
> +{
> +    long long val = 0;
> +    int ret = 0;
> +
> +    if ((ret = tst_parse_filesize("1", &val, LLONG_MIN, LLONG_MAX))) {
> +        tst_res(TFAIL, "return code %d (%s)", ret, tst_strerrno(ret));
> +    } else {
> +        if (val == 1)
> +            tst_res(TPASS, "value is %lli", val);
> +        else
> +            tst_res(TFAIL, "%lli != %lli", val, 1);
                                                   ^
						   This actually
						   produces a warning

Constants that fit into int are have type int so the proper format
string is %i for all the numbers.

> +    }
> +
> +    /* small letters */
> +    if ((ret = tst_parse_filesize("1k", &val, LLONG_MIN, LLONG_MAX))) {
> +        tst_res(TFAIL, "return code %d (%s)", ret, tst_strerrno(ret));
> +    } else {
> +        if (val == 1024)
> +            tst_res(TPASS, "value is %lli", val);
> +        else
> +            tst_res(TFAIL, "%lli != %lli", val, 1024);
> +    }
> +
> +    if ((ret = tst_parse_filesize("1m", &val, LLONG_MIN, LLONG_MAX))) {
> +        tst_res(TFAIL, "return code %d (%s)", ret, tst_strerrno(ret));
> +    } else {
> +        if (val == 1048576)
> +            tst_res(TPASS, "value is %lli", val);
> +        else
> +            tst_res(TFAIL, "%lli != %lli", val, 1048576);
> +    }
> +
> +    if ((ret = tst_parse_filesize("1g", &val, LLONG_MIN, LLONG_MAX))) {
> +        tst_res(TFAIL, "return code %d (%s)", ret, tst_strerrno(ret));
> +    } else {
> +        if (val == 1073741824)
> +            tst_res(TPASS, "value is %lli", val);
> +        else
> +            tst_res(TFAIL, "%lli != %lli", val, 1073741824);
> +    }
> +
> +    /* big letters */
> +    if ((ret = tst_parse_filesize("1K", &val, LLONG_MIN, LLONG_MAX))) {
> +        tst_res(TFAIL, "return code %d (%s)", ret, tst_strerrno(ret));
> +    } else {
> +        if (val == 1024)
> +            tst_res(TPASS, "value is %lli", val);
> +        else
> +            tst_res(TFAIL, "%lli != %lli", val, 1024);
> +    }
> +
> +    if ((ret = tst_parse_filesize("1M", &val, LLONG_MIN, LLONG_MAX))) {
> +        tst_res(TFAIL, "return code %d (%s)", ret, tst_strerrno(ret));
> +    } else {
> +        if (val == 1048576)
> +            tst_res(TPASS, "value is %lli", val);
> +        else
> +            tst_res(TFAIL, "%lli != %lli", val, 1048576);
> +    }
> +
> +    if ((ret = tst_parse_filesize("1G", &val, LLONG_MIN, LLONG_MAX))) {
> +        tst_res(TFAIL, "return code %d (%s)", ret, tst_strerrno(ret));
> +    } else {
> +        if (val == 1073741824)
> +            tst_res(TPASS, "value is %lli", val);
> +        else
> +            tst_res(TFAIL, "%lli != %lli", val, 1073741824);
> +    }
> +
> +    /* test errors */
> +    if ((ret = tst_parse_filesize("k", &val, LLONG_MIN, LLONG_MAX))) {
> +        if (ret == EINVAL)
> +            tst_res(TPASS, "return code %d (%s)", ret, tst_strerrno(ret));
> +        else
> +            tst_res(TFAIL, "return code %d (%s)", ret, tst_strerrno(ret));
> +    } else {
> +        tst_res(TFAIL, "tst_parse_filesize should have failed");
> +    }
> +
> +    if ((ret = tst_parse_filesize("100", &val, LLONG_MIN, 10))) {
> +        if (ret == ERANGE)
> +            tst_res(TPASS, "return code %d (%s)", ret, tst_strerrno(ret));
> +        else
> +            tst_res(TFAIL, "return code %d (%s)", ret, tst_strerrno(ret));
> +    } else {
> +        tst_res(TFAIL, "tst_parse_filesize should have failed");
> +    }
> +
> +    if ((ret = tst_parse_filesize("10", &val, 100, LLONG_MAX))) {
> +        if (ret == ERANGE)
> +            tst_res(TPASS, "return code %d (%s)", ret, tst_strerrno(ret));
> +        else
> +            tst_res(TFAIL, "return code %d (%s)", ret, tst_strerrno(ret));
> +    } else {
> +        tst_res(TFAIL, "tst_parse_filesize should have failed");
> +    }
> +
> +    if ((ret = tst_parse_filesize("10garbage", &val, LLONG_MIN, LLONG_MAX))) {
> +        if (ret == EINVAL)
> +            tst_res(TPASS, "return code %d (%s)", ret, tst_strerrno(ret));
> +        else
> +            tst_res(TFAIL, "return code %d (%s)", ret, tst_strerrno(ret));
> +    } else {
> +        tst_res(TFAIL, "tst_parse_filesize should have failed");
> +    }
> +}
> +
> +static struct tst_test test = {
> +	.test_all = do_test,
> +};
> diff --git a/lib/tst_test.c b/lib/tst_test.c
> index a79275722..2f28874be 100644
> --- a/lib/tst_test.c
> +++ b/lib/tst_test.c
> @@ -679,6 +679,47 @@ int tst_parse_float(const char *str, float *val, float min, float max)
>  	return 0;
>  }
>  
> +int tst_parse_filesize(const char *str, long long *val, long long min, long long max)
> +{
> +	long long rval;
> +	char *end;
> +
> +	if (!str)
> +		return 0;
> +
> +	errno = 0;
> +	rval = strtoll(str, &end, 0);
> +
> +	if (str == end || (end[0] && end[1]))
> +		return EINVAL;
> +
> +	if (errno)
> +		return errno;
> +
> +	switch (*end) {
> +	case 'g':
> +	case 'G':
> +		rval *= (1024 * 1024 * 1024);
> +		break;
> +	case 'm':
> +	case 'M':
> +		rval *= (1024 * 1024);
> +		break;
> +	case 'k':
> +	case 'K':
> +		rval *= 1024;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	if (rval > max || rval < min)
> +		return ERANGE;
> +
> +	*val = rval;
> +	return 0;
> +}
> +
>  static void print_colored(const char *str)
>  {
>  	if (tst_color_enabled(STDOUT_FILENO))
> -- 
> 2.34.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
