Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1DC47C373
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Dec 2021 17:05:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DB02F3C922F
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Dec 2021 17:05:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4CE8F3C8EE8
 for <ltp@lists.linux.it>; Tue, 21 Dec 2021 17:05:22 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id EDEFD140132F
 for <ltp@lists.linux.it>; Tue, 21 Dec 2021 17:05:21 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 239DB212C9;
 Tue, 21 Dec 2021 16:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1640102721; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mHjyxqnyR8hDbu0bLqXUt1i2Ois5Qq0EbaLZYszaFsI=;
 b=LJqjNPvZA3x3q6lEk31Kjxjrj0OB07gcjF0IBhM9BAnTlkcWIWLrYPDs55tqpkLjQZvxmv
 hQxt7pnm0CEdVx+avx0zn6kNGMma8P4r0+JKiPzJnHv4s9F3zCG4Q18j1kF6Ucx5jdM+iz
 OJrWSpErA39rqUXV8reqk2Dbxx8XO7Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1640102721;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mHjyxqnyR8hDbu0bLqXUt1i2Ois5Qq0EbaLZYszaFsI=;
 b=WRfNbr14KNRSfGv/hM0cRioNKGWlML4bSnztNJJ0Sykypzy6kAwSqBu1onKJHzMeWDMint
 ZGFgsMzjf0aLBnAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0D09E13446;
 Tue, 21 Dec 2021 16:05:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mHmJAUH7wWHIdgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 21 Dec 2021 16:05:21 +0000
Date: Tue, 21 Dec 2021 17:06:51 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YcH7m45TKEWaDrG3@yuki>
References: <20211220201814.31596-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211220201814.31596-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] sched_get_priority_max01: Add more policies
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
> diff --git a/testcases/kernel/syscalls/sched_get_priority_max/sched_get_priority_max01.c b/testcases/kernel/syscalls/sched_get_priority_max/sched_get_priority_max01.c
> index a1c54efd0e..0d01317033 100644
> --- a/testcases/kernel/syscalls/sched_get_priority_max/sched_get_priority_max01.c
> +++ b/testcases/kernel/syscalls/sched_get_priority_max/sched_get_priority_max01.c
> @@ -13,6 +13,8 @@
>   * compare them with expected value.
>   */
>  
> +#define _GNU_SOURCE

I supposed that we need this for SCHED_DEADLINE right? What about
alternative libc implementations, does they define SCHED_DEADLINE as
well? Do we need a fallback?

>  #include <sched.h>
>  #include "lapi/syscalls.h"
>  #include "tst_test.h"
> @@ -24,9 +26,12 @@ static struct test_case {
>  	int policy;
>  	int retval;
>  } tcases[] = {
> -	{POLICY_DESC(SCHED_OTHER), 0},
> +	{POLICY_DESC(SCHED_BATCH), 0},
> +	{POLICY_DESC(SCHED_DEADLINE), 0},
>  	{POLICY_DESC(SCHED_FIFO), 99},
> -	{POLICY_DESC(SCHED_RR), 99}
> +	{POLICY_DESC(SCHED_IDLE), 0},
> +	{POLICY_DESC(SCHED_OTHER), 0},
> +	{POLICY_DESC(SCHED_RR), 99},
>  };
>  
>  static void run_test(unsigned int nr)
> -- 
> 2.34.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
