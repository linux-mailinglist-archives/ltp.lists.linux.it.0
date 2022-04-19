Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9DA5063D5
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Apr 2022 07:18:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6758A3CA622
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Apr 2022 07:18:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2F1453C012D
 for <ltp@lists.linux.it>; Tue, 19 Apr 2022 07:18:11 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8C7121A0021F
 for <ltp@lists.linux.it>; Tue, 19 Apr 2022 07:18:10 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B7358210FD;
 Tue, 19 Apr 2022 05:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1650345489;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o5CZ8ez/a5H8cwuJSWUz3woKchY6BaRar/sr9dqrZhE=;
 b=2QbtrnJjgMgpGIgLLnl5Zac7yf//RpV1wCnunSI1XYWFb+orC6WzUaujVDYqX0LtMAuc1i
 XgL8iy2yhZuZn2rn7xh5MRbRMgNrGX0YeYR4Zx5r1oCWz8dL/K6HlWzJQzA6Unwi3q9/bd
 Z3IDl5GNblhftYYuYI65nfGLwow7c8Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1650345489;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o5CZ8ez/a5H8cwuJSWUz3woKchY6BaRar/sr9dqrZhE=;
 b=kFAIAFGPRW4fnuzr4GY2Oja8inmVKb8l8tLbfpot8372gQX9QB5AgwfsSY1BxzO16LA4P1
 KblYKMXfem13e3Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 95297132E7;
 Tue, 19 Apr 2022 05:18:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ztX+IhFGXmIVIAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 19 Apr 2022 05:18:09 +0000
Date: Tue, 19 Apr 2022 07:18:08 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <Yl5GEIuThAtSgsDE@pevik>
References: <20220411094019.1143199-1-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220411094019.1143199-1-liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fsync02: multiply the timediff if test in VM
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

> Similar to 59e73f2 ("clock_gettime04: multiply the
> timediff if test in VM"), extend tolerance for this test too.

>   fsync02.c:93: TFAIL: fsync took too long: 167.000000 seconds;
>                 max_block: 17768; data_blocks: 2287

Make sense.

Acked-by: Petr Vorel <pvorel@suse.cz>

> +	if (tst_is_virt(VIRT_ANY)) {
> +		tst_res(TINFO, "Running in a VM, multiply the time_limit by 2.");
very nit: why dot at the end?
> +		time_limit *= 2;
> +	}

Kind regards,
Petr


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
