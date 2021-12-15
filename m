Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E82647596B
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Dec 2021 14:10:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 312813C8E61
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Dec 2021 14:10:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 348263C6433
 for <ltp@lists.linux.it>; Wed, 15 Dec 2021 14:10:12 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D0C8F601BC9
 for <ltp@lists.linux.it>; Wed, 15 Dec 2021 14:10:10 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 77561212C7;
 Wed, 15 Dec 2021 13:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1639573810; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nx2Sroj4iDZjup8/aoU83kwzoqEllLj4uc334X7zTPs=;
 b=mk7S3puYoEtU64inT9tcGESBIo+6Hzs+2SZCKVPA252MqkdL7HNRKj8g/0+e98l63+IZ7U
 Vv4AX2K/7mQfZvWzsuDImvKsQmqkqJF4eg6IOBGN0Yy3hGBrreSWjTF6nS5C6XSX96VIuv
 SEPdrrct5pk9YBUis8h9wTdYQckpb8w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1639573810;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nx2Sroj4iDZjup8/aoU83kwzoqEllLj4uc334X7zTPs=;
 b=8Sw8b2jseZEzrN7JjYb80vbJzlbfUoPhfnwgGvFY0vumAaEh/3AIHjErcmj6udwyo02PEE
 qJTya/JXPPP2NfAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 622FF1330B;
 Wed, 15 Dec 2021 13:10:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CT18FjLpuWGYQwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 15 Dec 2021 13:10:10 +0000
Date: Wed, 15 Dec 2021 14:11:35 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <YbnphzO1AMe461ve@yuki>
References: <20211213160437.32353-1-andrea.cervesato@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211213160437.32353-1-andrea.cervesato@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] Refactoring dio_append.c using LTP API
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
Pushed with two minor changes, thanks.

> +/*\
> + * [Description]
>   *
> - */
> -/*
>   * dio_append - append zeroed data to a file using O_DIRECT while
>   *	a 2nd process is doing buffered reads and check if the buffer
>   *	reads always see zero.
>   */

I did rewrite this description to be a bit better.

> +static struct tst_test test = {
> +	.test_all = run,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.needs_tmpdir = 1,
> +	.forks_child = 1,
> +	.options = (struct tst_option[]) {
> +		{"n:", &str_numchildren, "Number of threads (default 1000)"},
> +		{"w:", &str_writesize, "Write size for each append (default 64K)"},
> +		{"c:", &str_appends, "Number of appends (default 1000)"},

And fixed these descriptions. The description for n: didn't match it at
all. For the rest I've added the switch to the string description as
well, as currently the test library is dumb and just prints the string
as it is.


It would be better to fix the library to print the swich automatically
and then fix all the tests not to include the switches in the string
description. And ideally we would pass a default value in this structure
as well...

But for now the message should include the switches otherwise it's
incomprehensible to the user.

> +		{}
> +	},
> +};

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
