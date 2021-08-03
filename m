Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DA53DE6F5
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 09:05:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0BA593C87F0
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 09:05:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BF0F23C3119
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 09:05:01 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 48DC91A00A58
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 09:05:01 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 35F462000E;
 Tue,  3 Aug 2021 07:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627974300;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vk/PPKXiBT5eGvlHZ0DoMZuOY0jAPSNp0Hdp1k65zzc=;
 b=jQB8XS7cMQp2iEo16E3ccTg5dhUmGd9fmfxa2xXOGKb1XaCVCpvj8fqOxrsIBIsxyvfa5c
 q30uw39L2uUpf1z1D5g2NgHVhakC6CWM9OmyMH6OkUKKVn1U8qO3Jie9cFeZMWG+l974aO
 w9ZTR5YEsfgotx6ZdyIaz66U0vIpCzo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627974300;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vk/PPKXiBT5eGvlHZ0DoMZuOY0jAPSNp0Hdp1k65zzc=;
 b=n3xOKeRauLm1siaP254qb7X3LxY3SkAiiBjPhCF3ZQVRWvZDSN+ckEqZyRXm/sYglRbko4
 paUQJIZBm4t2FuAg==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id ECCEEA3BD3;
 Tue,  3 Aug 2021 07:04:59 +0000 (UTC)
References: <20210803070116.30767-1-rpalethorpe@suse.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: ltp@lists.linux.it
In-reply-to: <20210803070116.30767-1-rpalethorpe@suse.com>
Date: Tue, 03 Aug 2021 08:04:59 +0100
Message-ID: <87fsvrm2jo.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] setsockopt03: Add Git and CVE tags
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, nstange@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

Sorry please ignore this, wrong patch!

Richard Palethorpe <rpalethorpe@suse.com> writes:

> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> ---
>  testcases/kernel/syscalls/setsockopt/setsockopt03.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/testcases/kernel/syscalls/setsockopt/setsockopt03.c b/testcases/kernel/syscalls/setsockopt/setsockopt03.c
> index 14fdf400b..3d49628d6 100644
> --- a/testcases/kernel/syscalls/setsockopt/setsockopt03.c
> +++ b/testcases/kernel/syscalls/setsockopt/setsockopt03.c
> @@ -114,4 +114,8 @@ static struct tst_test test = {
>  	.setup = setup,
>  	.test_all = run,
>  	.needs_root = 1,
> +	.tags = (const struct tst_tag[]){
> +		{"linux-git", "ce683e5f9d04"},
> +		{"CVE", "CVE-2016-4997"},
> +	}
>  };


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
