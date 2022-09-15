Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A105B9873
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Sep 2022 12:04:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DBE8F3CAC02
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Sep 2022 12:04:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C2A7E3C9111
 for <ltp@lists.linux.it>; Thu, 15 Sep 2022 12:04:56 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CB4961000999
 for <ltp@lists.linux.it>; Thu, 15 Sep 2022 12:04:55 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1A8BF22A93;
 Thu, 15 Sep 2022 10:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1663236295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MhDKZvB3QtPeJ9ETBzopOL9a5tUz8M+voGA/GiFUgaE=;
 b=wVt+MSezSXISnsI1YFYuS1uigtNSsgLZh5HQ5yzd7p7IYUy4fMXhmfWh+FXclNKbflJeSd
 PPP7kblDaj3UP8o5llYoMJTps5ws8ko8MLDPQeepUdUV/OkMSUeFNoHFqSUhqRHfkz4QMi
 qX6d36J2Po+W+7Ue47W8u/JK6lcAyFc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1663236295;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MhDKZvB3QtPeJ9ETBzopOL9a5tUz8M+voGA/GiFUgaE=;
 b=YI/Vf7ZNSNsMNTKoil4IQSL+24ZfgEgz3SbVMIJv0oKnedlupR+JNkyQtEpwl4R3gbXumo
 +xIIh+cezYdYVJDQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 09FDC13310;
 Thu, 15 Sep 2022 10:04:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id tSs4Acf4ImNaLwAAGKfGzw
 (envelope-from <chrubis@suse.cz>); Thu, 15 Sep 2022 10:04:55 +0000
Date: Thu, 15 Sep 2022 12:06:52 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Zhao Gongyi <zhaogongyi@huawei.com>
Message-ID: <YyL5PL30zWQKxqfE@yuki>
References: <20220915041035.211822-1-zhaogongyi@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220915041035.211822-1-zhaogongyi@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib: Add checking of setup params in kernel
 command line
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
> There are some test cases that need to check the configuration
> of setup params, so we add tst_kernel_cmdline_check() to check it
> in do_setup().

Can you elaborate on that? Which tests and what for?

> Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
> ---
>  include/tst_kernel.h |  9 +++++++++
>  include/tst_test.h   |  3 +++
>  lib/tst_kernel.c     | 21 +++++++++++++++++++++
>  lib/tst_test.c       |  9 +++++++++
>  4 files changed, 42 insertions(+)
> 
> diff --git a/include/tst_kernel.h b/include/tst_kernel.h
> index 9e17bb71e..874ec3bf4 100644
> --- a/include/tst_kernel.h
> +++ b/include/tst_kernel.h
> @@ -20,4 +20,13 @@ int tst_kernel_bits(void);
>   */
>  int tst_check_driver(const char *driver);
> 
> +/*
> + * Checks if there is a configuration in the kernel command line.
> + *
> + * @param cmd The setup param that need to be checked in command line.
> + * @return Returns 0 if the kernel configured the setup param in command line.
> + * -1 when the setup param is not configured.
> + */
> +int tst_kernel_cmdline_check(const char *cmd);
> +
>  #endif	/* TST_KERNEL_H__ */
> diff --git a/include/tst_test.h b/include/tst_test.h
> index ac52f268c..ba7d538b7 100644
> --- a/include/tst_test.h
> +++ b/include/tst_test.h
> @@ -312,6 +312,9 @@ struct tst_test {
> 
>  	/* {} terminated array of required CGroup controllers */
>  	const char *const *needs_cgroup_ctrls;
> +
> +	/* NULL terminated array of required kernel cmdlines. */
> +	const char *const *needs_kernel_cmdlines;
>  };
> 
>  /*
> diff --git a/lib/tst_kernel.c b/lib/tst_kernel.c
> index ecf4b917e..1e6d18e55 100644
> --- a/lib/tst_kernel.c
> +++ b/lib/tst_kernel.c
> @@ -24,6 +24,8 @@
>  #include "tst_kernel.h"
>  #include "old_safe_stdio.h"
> 
> +#define COMMAND_LINE_SIZE 4096
> +
>  static int get_kernel_bits_from_uname(struct utsname *buf)
>  {
>  	if (uname(buf)) {
> @@ -189,3 +191,22 @@ int tst_check_driver(const char *driver)
> 
>  	return ret;
>  }
> +
> +int tst_kernel_cmdline_check(const char *cmd)
> +{
> +	char cmdline[COMMAND_LINE_SIZE];
> +
> +	FILE *f = fopen("/proc/cmdline", "r");
> +	if (f == NULL) {
> +		tst_brkm(TBROK | TERRNO, NULL, "Open /proc/cmdline failed");
> +		return -1;
> +	}
> +
> +	while (fscanf(f, "%s", cmdline) > 0) {
> +		if (!strcmp(cmdline, cmd))
> +			return 0;
> +	}
> +
> +	tst_brkm(TCONF, NULL, "Setup param '%s' is not configured", cmd);
> +	return -1;
> +}

If nothing else this call should really take the NULL terminated array
as parameter and check for all flags so that we don't have to parse the
file eac time we check for a flag.

Also there is no point in doing return from a function that calls
tst_brkm(). The function should just return void in this case.

> diff --git a/lib/tst_test.c b/lib/tst_test.c
> index 8ccde1629..7a842c5ae 100644
> --- a/lib/tst_test.c
> +++ b/lib/tst_test.c
> @@ -1125,6 +1125,15 @@ static void do_setup(int argc, char *argv[])
>  	if (tst_test->min_kver)
>  		check_kver();
> 
> +	if (tst_test->needs_kernel_cmdlines)
> +	{
> +		const char *cmd;
> +		int i;
> +
> +		for (i = 0; (cmd = tst_test->needs_kernel_cmdlines[i]); ++i)
> +			tst_kernel_cmdline_check(cmd);
> +	}
> +
>  	if (tst_test->supported_archs && !tst_is_on_arch(tst_test->supported_archs))
>  		tst_brk(TCONF, "This arch '%s' is not supported for test!", tst_arch.name);
> 
> --
> 2.17.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
