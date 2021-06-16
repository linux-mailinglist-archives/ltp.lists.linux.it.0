Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A88A3A972E
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 12:23:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C0C403C4CB8
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 12:23:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 87BB43C2174
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 12:23:20 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0C01F600B1A
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 12:23:19 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 638901FD47;
 Wed, 16 Jun 2021 10:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623838999; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3ZqQTVMQcNuhMyEVq3d5umvnw/8m4YBzB7Gi+GjuqCY=;
 b=JSgtx9Q1HIxnZTDhzeIVxy4h2VQj+QknDtPZQXApUQC1NqKSoo4IQ1LH1xqUCxetiIWAam
 0AZA8iuMRbmDQKHxBCezLL2YS01t0BuhhvMhQuaVwAOS1MsyLoSIW9sEN3l1fiEbDCR4GD
 tUnzybkxx9YZR+aj6nDfFMrdj0Eqni4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623838999;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3ZqQTVMQcNuhMyEVq3d5umvnw/8m4YBzB7Gi+GjuqCY=;
 b=QtLdDo/sJAxdK068IMpIzrxSCrQ3f/0G5uHiBqri1yeIImPkx9Fzd64fzj+YHRGOnAhLGJ
 7GHTKV2n5CqLQXBg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 2731E118DD;
 Wed, 16 Jun 2021 10:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623838999; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3ZqQTVMQcNuhMyEVq3d5umvnw/8m4YBzB7Gi+GjuqCY=;
 b=JSgtx9Q1HIxnZTDhzeIVxy4h2VQj+QknDtPZQXApUQC1NqKSoo4IQ1LH1xqUCxetiIWAam
 0AZA8iuMRbmDQKHxBCezLL2YS01t0BuhhvMhQuaVwAOS1MsyLoSIW9sEN3l1fiEbDCR4GD
 tUnzybkxx9YZR+aj6nDfFMrdj0Eqni4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623838999;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3ZqQTVMQcNuhMyEVq3d5umvnw/8m4YBzB7Gi+GjuqCY=;
 b=QtLdDo/sJAxdK068IMpIzrxSCrQ3f/0G5uHiBqri1yeIImPkx9Fzd64fzj+YHRGOnAhLGJ
 7GHTKV2n5CqLQXBg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id oia8BxfRyWAWSwAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Wed, 16 Jun 2021 10:23:19 +0000
Date: Wed, 16 Jun 2021 11:57:38 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YMnLEjDAVQqwH7Wq@yuki>
References: <20210615163307.10755-1-pvorel@suse.cz>
 <20210615163307.10755-3-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210615163307.10755-3-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 2/3] lib: Add $LTPROOT/testcases/bin into PATH
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
Cc: Xiao Yang <yangx.jy@cn.fujitsu.com>,
 Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> diff --git a/lib/tst_test.c b/lib/tst_test.c
> index 36a4809c7..14a739eb5 100644
> --- a/lib/tst_test.c
> +++ b/lib/tst_test.c
> @@ -1149,15 +1149,31 @@ static unsigned long long get_time_ms(void)
>  static void add_paths(void)
>  {
>  	char *old_path = getenv("PATH");
> +	const char *ltproot = getenv("LTPROOT");
>  	const char *start_dir;
> -	char *new_path;
> +	char *bin_dir, *new_path = NULL;
>  
>  	start_dir = tst_get_startwd();
>  
> +	/* : - current directory */
>  	if (old_path)
> -		SAFE_ASPRINTF(&new_path, "%s::%s", old_path, start_dir);
> +		SAFE_ASPRINTF(&new_path, "%s:", old_path);
>  	else
> -		SAFE_ASPRINTF(&new_path, "::%s", start_dir);
> +		strcat(new_path, ":");

I personally think that strcat() function is broken be desing and that
we should avoid using it.

Also in this place is guaranteed SEGFAULT since you strcat() to NULL.

> +	/* empty for library C API tests */
> +	if (strlen(start_dir) > 0)
> +		SAFE_ASPRINTF(&new_path, "%s:%s", new_path, start_dir);
                                ^
				This is a memory leak.

As far as I can tell the asprintf() does not free th strp if non-NULL.

> +	if (ltproot) {
> +		SAFE_ASPRINTF(&bin_dir, "%s/testcases/bin", ltproot);
> +
> +		if (access(bin_dir, F_OK) == -1)
> +			tst_res(TWARN, "'%s' does not exist, is $LTPROOT set correctly?",
> +				bin_dir);
> +		else
> +			SAFE_ASPRINTF(&new_path, "%s:%s", new_path, bin_dir);
                                          ^
					  And this as well.
> +	}

I guess that we can also fairly simplify the code by expecting that PATH
is never unset from the start, maybe we should just check it and WARN if
it's not. Also we can assume that if LTPROOT is set we do not have to
add the start_dir since the start_dir is only useful when tests are
executed from the git checkout.

Something as:

	const char *old_path = getenv("PATH");
	const char *ltproot = getenv("LTPROOT");
	const char *start_dir = tst_get_startwd();
	char *new_path;

	if (!old_path) {
		tst_res(TWARN, "\$PATH not set!");
		return;
	}

	if (ltproot)
		SAFE_ASPRINTF(&new_path, "%s::%s/testcases/bin/", old_path, ltproot);
	else
		SAFE_ASPRINTF(&new_path, "%s::%s", old_path, start_dir);


>  	SAFE_SETENV("PATH", new_path, 1);
>  	free(new_path);
> -- 
> 2.32.0
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
