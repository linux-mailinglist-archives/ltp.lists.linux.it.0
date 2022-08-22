Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1F659BD88
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Aug 2022 12:23:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 18F883CA2E2
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Aug 2022 12:23:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 274313CA277
 for <ltp@lists.linux.it>; Mon, 22 Aug 2022 12:23:24 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A6F1F600758
 for <ltp@lists.linux.it>; Mon, 22 Aug 2022 12:23:23 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DA7AF33B52;
 Mon, 22 Aug 2022 10:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1661163802; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B9O/I0LLuwJcZ33Wy7JkR1JVUaI0YZ4OB/xoespBXCA=;
 b=DP1WB0gkGbRxf+lGgTb1cBn9WzXTAzXyiM3QLztmFUKSmszZ82zvieeHPP1N483+cZhPbI
 hbbMv+WdOBVahQSaBpvpmF7h3b54ZIk6M0mgqs+ESquGY+WW7BLpWoo8iGMxZgAtE9SN6o
 owdpE/iSHzPZzstvv+rEzIFLZAS4LKw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1661163802;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B9O/I0LLuwJcZ33Wy7JkR1JVUaI0YZ4OB/xoespBXCA=;
 b=WD4kyhxOfC/JeyrwqRevPob4z7IzzdM5ZdPwHu1FZ9YRfQvivU9pJENXcSszKLTRY+ngNx
 PdIzFHPJup1ySnBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C49251332D;
 Mon, 22 Aug 2022 10:23:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4tjcLhpZA2PIDAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 22 Aug 2022 10:23:22 +0000
Date: Mon, 22 Aug 2022 12:25:20 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <YwNZkNhdNgAtXPAq@yuki>
References: <20220816115905.29680-1-andrea.cervesato@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220816115905.29680-1-andrea.cervesato@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v8] Refactor aiocp using new LTP API
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
> +	while (i < size) {
> +		if (!tst_remaining_runtime())
> +			tst_brk(TCONF, "Out of runtime!");
>  
> -	if (!prefix_max) {
> -		fprintf(stderr, "Path '%s' not found in /proc/mounts\n", path);
> -		return 0;
> -	}
> -
> -	printf("Path '%s' is on device '%s'\n", path, dev_name);
> +		offset = rand() % (bufsize / 2);

This is now length not offset, also now the size we pass to the write
varies between 0 and bufsize/2. Shouldn't we rather go for a size
between bufsize/2 and bufsize?

	len = rand() % (bufsize/2) + bufsize/2;
	towrite = MIN(len, size-i);


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
