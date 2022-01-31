Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F08C24A4BA6
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Jan 2022 17:16:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7131C3C97B2
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Jan 2022 17:16:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A3E4E3C1315
 for <ltp@lists.linux.it>; Mon, 31 Jan 2022 17:16:46 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1FF33600202
 for <ltp@lists.linux.it>; Mon, 31 Jan 2022 17:16:45 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 26EC21F383;
 Mon, 31 Jan 2022 16:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1643645805; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kcWB7tLlCqEWShSm0cP4efcw3sKeZ6zmj8/ltYbv+zE=;
 b=vEdvciTxSKq0Hzmu60znKhcUdsoPwFE1CSo5VgJTDyrZ1qogAnX55U02O4tTUlcyc+7VPP
 TicJ5cLcyzUz6Eq4Xm6esx7ml1gUl9yMkuyX/JJ1tsy6Kn9HBXygsDaLnX3J/Z5eYuqGDD
 rx+5Rob9ZRMoYdQNWH4mo4t+gztJLLo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1643645805;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kcWB7tLlCqEWShSm0cP4efcw3sKeZ6zmj8/ltYbv+zE=;
 b=gZ/dRwyfUJM1gw8xhdbPvinCxkNIrxLvV9O0lkHvUk7SjuAepDyPu0cc/tDloU/p3z6ndy
 xvKtRMnblYbzIsAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 122B413C73;
 Mon, 31 Jan 2022 16:16:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +XZUAm0L+GFgdQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 31 Jan 2022 16:16:45 +0000
Date: Mon, 31 Jan 2022 17:18:39 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <YfgL37etm9C5/Bte@yuki>
References: <20211216093115.23982-1-andrea.cervesato@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211216093115.23982-1-andrea.cervesato@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] Check for maximum available pids in
 dio_sparse.c
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
>  static void setup(void)
>  {
>  	struct stat sb;
> +	int max_pids;
>  
>  	numchildren = 1000;
>  	writesize = 1024;
> @@ -69,6 +70,13 @@ static void setup(void)
>  	if (tst_parse_int(str_numchildren, &numchildren, 1, INT_MAX))
>  		tst_brk(TBROK, "Invalid number of children '%s'", str_numchildren);
>  
> +	max_pids = tst_get_free_pids();
> +	if (numchildren > max_pids) {
> +		numchildren = max_pids;
> +
> +		tst_res(TCONF, "Number of children reduced to %d due to system limitations", numchildren);
                          ^
			  If we are going to limit the number of
			  children this should be TINFO

And if we are going to skip the test it should be tst_brk(TCONF, ...)

Either way tst_res(TCONF, ...) does not make much sense in this case.

> +	}

I guess that we should do a similar check in all the io tests that fork
children, so we may as well put it into some kind of library function.

Maybe just the common.h with something as:

static inline void check_children(unsigned int numchildren)
{
	if (numchildren > tst_get_free_pids)
		tst_brk(TCONF, "....");
}

or:

static inline void check_children(unsigned int *numchilren)
{
	...
}

In case that we want to print the info message and modify the value.

>  	if (tst_parse_filesize(str_writesize, &writesize, 1, LLONG_MAX))
>  		tst_brk(TBROK, "Invalid write blocks size '%s'", str_writesize);
>  
> @@ -129,10 +137,10 @@ static struct tst_test test = {
>  	.needs_tmpdir = 1,
>  	.forks_child = 1,
>  	.options = (struct tst_option[]) {
> -		{"n:", &str_numchildren, "Number of threads (default 1000)"},
> -		{"w:", &str_writesize, "Size of writing blocks (default 1K)"},
> -		{"s:", &str_filesize, "Size of file (default 100M)"},
> -		{"o:", &str_offset, "File offset (default 0)"},
> -		{}
> +		{"n:", &str_numchildren, "-n\t Number of threads (default 1000)"},
> +		{"w:", &str_writesize, "-w\t Size of writing blocks (default 1K)"},
> +		{"s:", &str_filesize, "-s\t Size of file (default 100M)"},
> +		{"o:", &str_offset, "-o\t File offset (default 0)"},
> +		{},

This part is certainly wrong.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
