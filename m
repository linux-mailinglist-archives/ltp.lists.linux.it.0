Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A5987587E1F
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Aug 2022 16:28:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D141E3C9178
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Aug 2022 16:28:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1345A3C8FAD
 for <ltp@lists.linux.it>; Tue,  2 Aug 2022 16:28:42 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 808B11400524
 for <ltp@lists.linux.it>; Tue,  2 Aug 2022 16:28:40 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 85A31205AE;
 Tue,  2 Aug 2022 14:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1659450520; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O830QnqtCw9fWGVrIPq9O+yJVjNFeydbWmdsP0dIT0Q=;
 b=h2mwX+VKHxxhXyzGGMAvSIYB1M9LIb1r/3uWVBH4+C2iftN9YrqYX3SYNkfzP4tm0dTVPv
 PlOQoXOfFCTk7towpiJf/q+OMkzXahWBw9k2f9ojcXKDKofVdXcO7ycsAukhvSL360phOO
 VA6rlb4EhDMu5Xse6E6pFwAwLa55gcI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1659450520;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O830QnqtCw9fWGVrIPq9O+yJVjNFeydbWmdsP0dIT0Q=;
 b=i4DUvIg/vp0xEbeoXpkMY4j++EDmh3J8jXVSLctJzstKoyN7FndNDpcvmRteOJwmsRzVfk
 Xk5uwhARiuSSVcCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7538813A8E;
 Tue,  2 Aug 2022 14:28:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id C8naGpg06WL2dQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 02 Aug 2022 14:28:40 +0000
Date: Tue, 2 Aug 2022 16:30:28 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <Yuk1BC/gsYb8tzBh@yuki>
References: <20220801151408.15947-1-andrea.cervesato@suse.com>
 <Yukh3EQSm57ak0o+@yuki>
 <d0cf0e1f-8e0c-127c-b613-ac8b3bd99ad6@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d0cf0e1f-8e0c-127c-b613-ac8b3bd99ad6@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Refactor aiocp using new LTP API
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
> I think that check doesn't make much sense and we probably should stuck 
> to "n = aionum - busy",
> since that's the value we always need to allocate since became free in 
> the previous loop iteration.

I guess MIN(aionum-busy, tocopy) or something like this since we want to
avoid schedulling reads past the end of the file.

> >> +	aio_blksize = 64 * 1024;
> >> +	filesize = 1 * 1024 * 1024;
> >> +	aionum = 16;
> >> +	srcflags = O_RDONLY;
> >> +	dstflags = O_WRONLY;
> > Can we just initialize the globals directly instead of here in the test
> > setup()?
> In the last ltp-aiodio tests, we decided to initialize global variables 
> inside setup().

Wasn't it exactly the other way around?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
