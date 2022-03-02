Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFC54CA7BC
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Mar 2022 15:15:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8772E3CA304
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Mar 2022 15:15:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D16893C96D2
 for <ltp@lists.linux.it>; Wed,  2 Mar 2022 15:15:43 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id CAD446006C4
 for <ltp@lists.linux.it>; Wed,  2 Mar 2022 15:15:42 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E17F4218DF;
 Wed,  2 Mar 2022 14:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1646230541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eirXcqTrvcODz1dnd9v1w+i7SvlrOY0Yuivf5M1pddw=;
 b=yG1hHITx9aDD8ZVdiah2RSmhCzOs8j7fFkv8WbASX+vJ3fB5dRBSkUBgrjleHAMxwWTvKq
 oVMMrdSpKFoREKn2ACUxjLM/4HU0+ampdg109EY2J8HfETOjabw9o8TtMcQ3gsB3sX5G01
 ocm2WPIomn3RPEUMl0xDp9Xr2VdXbcU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1646230541;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eirXcqTrvcODz1dnd9v1w+i7SvlrOY0Yuivf5M1pddw=;
 b=DHSPSIzqLAQAoXbl1y2iLe+uL0kgtnL/Y1JfJYHadlw7dXvajgz2vVWukUOe0kpM2xTwKW
 FLD9YWfDFNYFY+Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CA7E713A4A;
 Wed,  2 Mar 2022 14:15:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /98qMA18H2KBcQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 02 Mar 2022 14:15:41 +0000
Date: Wed, 2 Mar 2022 15:18:01 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <Yh98mQNybj1R1Kga@yuki>
References: <20220204194648.32165-1-pvorel@suse.cz>
 <20220204194648.32165-3-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220204194648.32165-3-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/3] broken_ip-nexthdr.sh: Check IPv6 support
 before forcing it
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
> diff --git a/testcases/network/stress/broken_ip/broken_ip-nexthdr.sh b/testcases/network/stress/broken_ip/broken_ip-nexthdr.sh
> index ec6643af66..cb4a3dd399 100755
> --- a/testcases/network/stress/broken_ip/broken_ip-nexthdr.sh
> +++ b/testcases/network/stress/broken_ip/broken_ip-nexthdr.sh
> @@ -11,6 +11,7 @@ TST_TESTFUNC="do_test"
>  do_test()
>  {
>  	# not supported on IPv4
> +	tst_net_require_ipv6
>  	TST_IPV6=6
>  	TST_IPVER=6

I was looking at the code if we can simply instead do:

[ "$TST_IPVER" == 6 ] && tst_net_require_ipv6

in the test library, but it looks like the parameters are parsed in the
tst_test.sh in the tst_run() function. Which means that the TST_IPVER is
not actually set until the test starts and the library has no way of
knowing the variable value beforehand.

I guess that we can actually move the option parsing code in the
tst_test.sh so that it happens just right after the script is sourced,
which would make things much easier as the TST_IPVER would end up being
defined in the tst_network.sh and we coud simply use the statement above
without any further hacks like this patch adds.

As a side effect we could clean up the test option parsing code since we
do actually have two different getopts loop in the tst_test.sh library
and as far as I can tell we can do just with one.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
