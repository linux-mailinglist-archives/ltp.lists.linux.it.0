Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8D95A7AEF
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Aug 2022 12:05:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5176B3CA6F9
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Aug 2022 12:05:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5D0EE3C98BB
 for <ltp@lists.linux.it>; Wed, 31 Aug 2022 12:05:47 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DE0CC140019D
 for <ltp@lists.linux.it>; Wed, 31 Aug 2022 12:05:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 18DFB2223C;
 Wed, 31 Aug 2022 10:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1661940346; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jmuppRcdwGRATK4OlQWofm7s97WlD/upnQE6USXDp2s=;
 b=p89Y2fCwbyilZ+7LAC02+cANXiFSlwejjTQ0I86sj/G3ZVhMCQf1fq2ivDmTNKvRobtmn5
 IxYvvfw7RJyoOdraCkBsfVPUrALjQBpCaTERdZny1kcev481H2KXZyOpZZRKpE4wluReBZ
 qrNcCM4qIzEZylWpqxPNxGdvU0UKvQU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1661940346;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jmuppRcdwGRATK4OlQWofm7s97WlD/upnQE6USXDp2s=;
 b=BJyKTn8Xycn1LoQlnGz2VlumrG9bukPQMvcel9bJC18j14xPmaq5pVk+8cRDzFgXR58FEg
 XObrn1bR4GjONGBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F11C21332D;
 Wed, 31 Aug 2022 10:05:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lS6iOnkyD2PtWAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 31 Aug 2022 10:05:45 +0000
Date: Wed, 31 Aug 2022 12:07:45 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <Yw8y8TPKbdAAsOPi@yuki>
References: <20220830135007.16818-1-mdoucha@suse.cz>
 <20220830135007.16818-8-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220830135007.16818-8-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 07/10] perf_event_open02: Add max_runtime
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
> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---
>  testcases/kernel/syscalls/perf_event_open/perf_event_open02.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c b/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c
> index 618a27016..b96578369 100644
> --- a/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c
> +++ b/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c
> @@ -334,4 +334,5 @@ static struct tst_test test = {
>  	},
>  	.test_all = verify,
>  	.needs_root = 1,
> +	.max_runtime = 15
>  };

We do spend significant part of the runtime in the setup while we count
hardware counters so if we are going to add .setup_max_runtime this
should something as:

..
	.setup_max_runtime = 64,
	.max_runtime = 8,
...


Technically the maximal time the setup can run is MAX_CTRS * 2 but I do
not think that we will see hardware with more than 32 hardware counters
anytime soon if ever.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
