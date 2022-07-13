Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74466572CFC
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jul 2022 07:21:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CD9C13CA2D4
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jul 2022 07:21:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E0E443CA178
 for <ltp@lists.linux.it>; Wed, 13 Jul 2022 07:21:49 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2562910005C4
 for <ltp@lists.linux.it>; Wed, 13 Jul 2022 07:21:48 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 579EC20116;
 Wed, 13 Jul 2022 05:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657689708;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kOQ1OCQVGLw9OLdp8wM26XzwWSkqpI2eIjyO97krvNE=;
 b=mhhJoGnaiGU1g2JcE2hS1+RNAeOhvZYet3t/JxHGXAoIiI1EwIPM+KwInVmRVL22aD5MvI
 vJuZCb5DKxx06/8lVEnkkRXanh49xOK5QGPCaoi+raquBKyM6sYVu8OEDwnnn81yFdRDAx
 DhhdjZHEAhy7ynfNtiGZOOtWv+okUmk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657689708;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kOQ1OCQVGLw9OLdp8wM26XzwWSkqpI2eIjyO97krvNE=;
 b=8f/qsFRa0kN5sBIntEExNQVfctJslMNtJLyiXeBi7RmGIf2sTXSxYaLmUxNQFQ0QdFX36q
 jjkat4dhismon5Ag==
Received: from g78 (unknown [10.163.24.226])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 2393D2C141;
 Wed, 13 Jul 2022 05:21:48 +0000 (UTC)
References: <87k08joqp7.fsf@suse.de>
 <1657598596-2296-1-git-send-email-xuyang2018.jy@fujitsu.com>
User-agent: mu4e 1.6.10; emacs 28.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Date: Wed, 13 Jul 2022 06:19:07 +0100
In-reply-to: <1657598596-2296-1-git-send-email-xuyang2018.jy@fujitsu.com>
Message-ID: <8735f5oae1.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] security/dirtypipe: Add test for CVE-2022-0847
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Yang Xu <xuyang2018.jy@fujitsu.com> writes:

> +static void run(void)
> +{
> +	off_t offset;
> +	int data_size, len;
> +	ssize_t nbytes;
> +
> +	offset = 1;

Still setting offset to 1.

> +	data_size = strlen(TEXT);
> +
> +	fd = SAFE_OPEN(TESTFILE, O_RDONLY);
> +
> +	prepare_pipe();
> +
> +	offset = 0;
> +	/*
> +	 * splice one byte from the start into the pipe;
> +	 * this will add a reference to the page cache, but since
> +	 * copy_page_to_iter_pipe() does not initialize the "flags",
> +	 * PIPE_BUF_FLAG_CAN_MERGE is still set
> +	 */
> +	nbytes = splice(fd, &offset, p[1], NULL, 1, 0);

As offset is 0 we can just pass NULL. Otherwise all looks good, I'll fix
it up and merge it.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
