Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D10D4ABED0
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Feb 2022 14:17:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 395F23C9AA6
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Feb 2022 14:17:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 559293C0720
 for <ltp@lists.linux.it>; Mon,  7 Feb 2022 14:17:42 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9AFFE1A00925
 for <ltp@lists.linux.it>; Mon,  7 Feb 2022 14:17:41 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D6A621F37E;
 Mon,  7 Feb 2022 13:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1644239860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kXwMYWY+dCqIOJETWKFz/MkhJ/CzYm/vss+jRw5ihKA=;
 b=w+9R0bjeevR7k+H7auLsRz/gMhNyuAXum7UZUNtro+Ahe0l3FkjUFzVxDDR84cU0o3473N
 D34xeE5TWHaLEnxGK7P9EUIWYGY16tTBn18pNwiUWkmGpgbgRdPLR1/g8Cpn3bd5lRsNve
 GXolXLtvz7mMGCCL30XGQIuH5zy4VBw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1644239860;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kXwMYWY+dCqIOJETWKFz/MkhJ/CzYm/vss+jRw5ihKA=;
 b=kdWIV4345Xb6gu6PfoI0TRL1e4TK/dTYPSHeoiGnk6uEg/5yBWgaqWnz5fJ73H9jqcjJWy
 E4VgxlirkJDwrUBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C22EA13C00;
 Mon,  7 Feb 2022 13:17:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WGHcLfQbAWLqHAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 07 Feb 2022 13:17:40 +0000
Date: Mon, 7 Feb 2022 14:19:42 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YgEcbmGjGEaPgzAo@yuki>
References: <20220207040447.2803113-1-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220207040447.2803113-1-liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] getrusage03: skip on small RAM system
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
> ---
> 
> Notes:
>     Ps. I also think we might need .min_mem_[avai|total] field but
>         not sure if it is really necessary to add that.

Actually this would be very useful from the long term perspective. If we
ever manage to run tests in parallel the scheduller should make sure
that we do not hit OOM due to running more than one processe that
consume significant amount of memory at the same time.

> diff --git a/testcases/kernel/syscalls/getrusage/getrusage03.c b/testcases/kernel/syscalls/getrusage/getrusage03.c
> index bf5127483..5aa0b2326 100644
> --- a/testcases/kernel/syscalls/getrusage/getrusage03.c
> +++ b/testcases/kernel/syscalls/getrusage/getrusage03.c
> @@ -173,6 +173,14 @@ static void run(unsigned int i)
>  	}
>  }
>  
> +static void setup(void)
> +{
> +	long long mem_avail = tst_available_mem();
> +
> +	if (mem_avail < 512L*1024)
> +		tst_brk(TCONF, "Needed > 512MB availabe, only have: %ld kB", mem_avail);
> +}
> +
>  static struct tst_test test = {
>  	.forks_child = 1,
>  	.child_needs_reinit = 1,
> @@ -182,6 +190,7 @@ static struct tst_test test = {
>  		{"linux-git", "1f10206cf8e9"},
>  		{}
>  	},
> +	.setup = setup,
>  	.test = run,
>  	.tcnt = ARRAY_SIZE(testfunc_list),
>  };

Looks good:

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
