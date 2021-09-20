Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E564113EC
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Sep 2021 14:01:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BF61A3C8732
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Sep 2021 14:01:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CF37B3C19F3
 for <ltp@lists.linux.it>; Mon, 20 Sep 2021 14:01:55 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 34D861400E54
 for <ltp@lists.linux.it>; Mon, 20 Sep 2021 14:01:54 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3AFBB200C8;
 Mon, 20 Sep 2021 12:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1632139314; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XnzaKFY9wseh/1uFFjV4bDumonOBM9UBNfjLg3mwNas=;
 b=A8UyRAlygUvq/dap1GRaURPyDJfLNg8NenxgVsxt/+snrO0ipQysNsfESXXUs1bm1jWx2u
 JJDdyjII+dx2Heh+EnACNxrgfqTWSlmz2G1WuslFRBRX/rfcihL5s/2Rha2euLDHxNCx0B
 mQYqZOcSNeG5b5Y2y8aWtE3iCwJW27g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1632139314;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XnzaKFY9wseh/1uFFjV4bDumonOBM9UBNfjLg3mwNas=;
 b=NivOC1ruSqSPhOzhZ4aLcEuhDE0Du1Z4ZTuqlIpFaXOBm3scAUggYVybnCXOHuiNZO5Gt/
 PCz45E1gBfwm70BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2615513483;
 Mon, 20 Sep 2021 12:01:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FDvhCDJ4SGECHwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 20 Sep 2021 12:01:54 +0000
Date: Mon, 20 Sep 2021 14:02:22 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YUh4TsjTZeFh/UYO@yuki>
References: <20210917141719.5739-1-chrubis@suse.cz>
 <01fb50a1-8edb-77ac-fba4-b70965022b3f@jv-coder.de>
 <YUg6BM39OKgI5Ovl@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YUg6BM39OKgI5Ovl@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] [RFC] lib: shell: Fix timeout process races
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
> > Shouldn't this be reused from the library instead of being reimplemented?
> 
> I wanted to avoid calling the tst_res() functions to keep things simple,
> but I guess that there is no reason not to use it.

And there actuall was a reason, since we cannot do tst_res(TBROK,
"..."); in the C library.

And looking at the C library, we avoid using the tst_res() on timeouts
as well, actually we just write to stderr because we do that from a
signal handler context. So I guess that we can just print to stderr here
instead.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
