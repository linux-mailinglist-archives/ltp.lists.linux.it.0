Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1430F3FC4AF
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 11:18:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BCB8D3C2A8C
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 11:18:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E3DD03C2435
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 11:18:39 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C375E1A00A58
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 11:18:38 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 2BE5F2213D;
 Tue, 31 Aug 2021 09:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1630401518;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v1zf4yR5njK1Z733qlY106h/ETj4YF837G9/fPVdFqI=;
 b=BspzlyKTg80te7SKpLk4BwJx13gm9QK9UOkhDrdhw4q/ZsMRxgwOgrP65mVK3vxNL31ks7
 V2WgxggWpnBm1BBYaerOyNr94Qu0chJSKrVOGloYzF67y65NDTrQhExHQBp1IfNdIxLYS+
 KgZHxoe6O7XMaZXkUfKp5hsen0drDuo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1630401518;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v1zf4yR5njK1Z733qlY106h/ETj4YF837G9/fPVdFqI=;
 b=UJhgGDJ/KwyR/NTmYIz0yNYE7Tl2IDVDhPSvfwRPn8z3vdL90ZaJ7QVwG7sGbphqzJtP0q
 4ai57VxKm8wvqNAg==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id E49B0A3B8C;
 Tue, 31 Aug 2021 09:18:37 +0000 (UTC)
References: <20210831090002.1431298-1-lkml@jv-coder.de>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Joerg Vehlow <lkml@jv-coder.de>
In-reply-to: <20210831090002.1431298-1-lkml@jv-coder.de>
Date: Tue, 31 Aug 2021 10:18:37 +0100
Message-ID: <87eeaakm4y.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] cfs_bandwidth01: Fix cleanup on failure in
 set_cpu_quota
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Joerg,

Joerg Vehlow <lkml@jv-coder.de> writes:

> From: Joerg Vehlow <joerg.vehlow@aox-tech.de>
>
> If set_cpu_quota failed, mk_cpu_cgroup did not return
> and cg_workers[n] was not set. This lead to a failure during
> cleanup, because the worker cgroups were not deleted.
>
> Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
> ---
>  .../sched/cfs-scheduler/cfs_bandwidth01.c       | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
>
> diff --git a/testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c b/testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c
> index 9301ee458..e8032d65a 100644
> --- a/testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c
> +++ b/testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c
> @@ -57,17 +57,14 @@ static void set_cpu_quota(const struct tst_cgroup_group *const cg,
>  		tst_cgroup_group_name(cg), quota_us, period_us);
>  }
>  
> -static struct tst_cgroup_group *
> -mk_cpu_cgroup(const struct tst_cgroup_group *const cg_parent,
> +static void mk_cpu_cgroup(struct tst_cgroup_group **cg,
> +          const struct tst_cgroup_group *const cg_parent,

Seems like there are spaces instead of a tab at the start.

Otherwise LGTM, thanks.

Reviewed-by: Richard Palethorpe <rpalethorpe@suse.com>

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
