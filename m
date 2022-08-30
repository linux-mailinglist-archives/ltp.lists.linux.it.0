Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 738905A6691
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Aug 2022 16:47:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 414933C6651
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Aug 2022 16:47:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 50CD73C6651
 for <ltp@lists.linux.it>; Tue, 30 Aug 2022 16:47:08 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 52F5710000D5
 for <ltp@lists.linux.it>; Tue, 30 Aug 2022 16:47:07 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 48CBB21EAF;
 Tue, 30 Aug 2022 14:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1661870827; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wz0tjm7vGcd7gRn65CC5KnVa3w4Jj2NZv5TbHZtBqJI=;
 b=jcqkWMuFWEq0RnMNQi+/KdgAgAreBHdMWvVBUmvv2dZ8xg6L2xwNvzmChuzJ/p/G/byw0l
 c/nV6XL0xWH5ic/QSeU30rhmJV6IZGLCABm4G+KFqj2WqucLcpFW5glUOsBFEe3ZAELjy3
 WEI0sjK5LaLL4PWJvA7VOoMKkHBJglI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1661870827;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wz0tjm7vGcd7gRn65CC5KnVa3w4Jj2NZv5TbHZtBqJI=;
 b=lyccH1LSvgnUEK4nZunNwcdqeQhvH5FjtGpYLsbc08A/7+8DaM/N+OBjZCv3D5KYEcSBPg
 XAnL1CKJQvmAswAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2F3D013B0C;
 Tue, 30 Aug 2022 14:47:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QPyyCusiDmOSJQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 30 Aug 2022 14:47:07 +0000
Date: Tue, 30 Aug 2022 16:49:06 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <Yw4jYgDzNj9BAqOf@yuki>
References: <20220830135007.16818-1-mdoucha@suse.cz>
 <20220830135007.16818-4-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220830135007.16818-4-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 03/10] ksm: Add max_runtime to tests
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
> ksm02, ksm04 and ksm05 take 10+ seconds to finish. Set max_runtime to avoid
> random timeout issues.

I wonder if we can do better.

I guess that the actual runtime does depends on the size of the RAM
because we wait for at least two finished full scans for ksmd. I guess
that for large enough machines we would end up with minutes of runtime.

So I guess that it would make more sense to treat the max_runtime as a
upper bound and set it to large enough number as we do for AIO testcases
(30 minutes) and then make the wait_ksmd_full_scan() runtime avare so
that it exits when the runtime is exhausted. With that we would get a
clear message that we timed-out in the loop that waited for the ksmd
scan.

> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---
>  testcases/kernel/mem/ksm/ksm02.c | 1 +
>  testcases/kernel/mem/ksm/ksm04.c | 1 +
>  testcases/kernel/mem/ksm/ksm05.c | 1 +
>  3 files changed, 3 insertions(+)
> 
> diff --git a/testcases/kernel/mem/ksm/ksm02.c b/testcases/kernel/mem/ksm/ksm02.c
> index 1cb7d8e73..1f5677425 100644
> --- a/testcases/kernel/mem/ksm/ksm02.c
> +++ b/testcases/kernel/mem/ksm/ksm02.c
> @@ -110,6 +110,7 @@ static struct tst_test test = {
>  	},
>  	.test_all = verify_ksm,
>  	.min_kver = "2.6.32",
> +	.max_runtime = 20,
>  	.needs_cgroup_ctrls = (const char *const []){ "cpuset", NULL },
>  };
>  
> diff --git a/testcases/kernel/mem/ksm/ksm04.c b/testcases/kernel/mem/ksm/ksm04.c
> index 39c741876..f7dc5befc 100644
> --- a/testcases/kernel/mem/ksm/ksm04.c
> +++ b/testcases/kernel/mem/ksm/ksm04.c
> @@ -112,6 +112,7 @@ static struct tst_test test = {
>  	},
>  	.test_all = verify_ksm,
>  	.min_kver = "2.6.32",
> +	.max_runtime = 20,
>  	.needs_cgroup_ctrls = (const char *const []){
>  		"memory", "cpuset", NULL
>  	},
> diff --git a/testcases/kernel/mem/ksm/ksm05.c b/testcases/kernel/mem/ksm/ksm05.c
> index 146a9a3b7..6f94c4a9c 100644
> --- a/testcases/kernel/mem/ksm/ksm05.c
> +++ b/testcases/kernel/mem/ksm/ksm05.c
> @@ -88,6 +88,7 @@ static struct tst_test test = {
>  	.forks_child = 1,
>  	.test_all = test_ksm,
>  	.min_kver = "2.6.32",
> +	.max_runtime = 10,
>  	.save_restore = (const struct tst_path_val[]) {
>  		{"!/sys/kernel/mm/ksm/run", "1"},
>  		{}
> -- 
> 2.37.2
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
