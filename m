Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2FA63AB83
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Nov 2022 15:46:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CD1F43CC666
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Nov 2022 15:46:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 08AD23C32D9
 for <ltp@lists.linux.it>; Mon, 28 Nov 2022 15:46:10 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6B82410005BD
 for <ltp@lists.linux.it>; Mon, 28 Nov 2022 15:46:10 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 7E0FD21AED;
 Mon, 28 Nov 2022 14:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669646769;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KxPFjwuYyeUMZGtaIYEt7YYpHH+Db6jxLpXek/b08IE=;
 b=Jwrhcp1yXZBxWAyCKGzucy0CMk5LCpPLhJ1YfjvAtvI2VPH/eDpVPVTuToysgXw/F50nr1
 FiWPbNcTTPg/IlSTuREYHjN36zzOCAjQr4ApZnQqnxCvTXuaS+p74vb8lNYCrvHaZ5cguJ
 TCOMK3s8vxqsvt85O8CfJJuFvQ4kgHI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669646769;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KxPFjwuYyeUMZGtaIYEt7YYpHH+Db6jxLpXek/b08IE=;
 b=n+q9LaG/zS0xuk9SJKOY4PLM09o/QkYxlf+iS99Sx04uIqYMxNVmK/SNq+dgnwonGiBs7K
 57LQEUZHbiDth+AQ==
Received: from g78 (unknown [10.163.28.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 4EC1E2C141;
 Mon, 28 Nov 2022 14:46:09 +0000 (UTC)
References: <1668580004-2088-1-git-send-email-xuyang2018.jy@fujitsu.com>
User-agent: mu4e 1.8.11; emacs 28.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Date: Mon, 28 Nov 2022 14:45:17 +0000
Organization: Linux Private Site
In-reply-to: <1668580004-2088-1-git-send-email-xuyang2018.jy@fujitsu.com>
Message-ID: <87h6yjuogf.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 1/2] cgroup_core01: Use correct linux tag
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Thanks, merged!

Yang Xu <xuyang2018.jy@fujitsu.com> writes:

> Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
> ---
>  testcases/kernel/controllers/cgroup/cgroup_core01.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/testcases/kernel/controllers/cgroup/cgroup_core01.c b/testcases/kernel/controllers/cgroup/cgroup_core01.c
> index 8b6243f7c..2e695deed 100644
> --- a/testcases/kernel/controllers/cgroup/cgroup_core01.c
> +++ b/testcases/kernel/controllers/cgroup/cgroup_core01.c
> @@ -16,11 +16,11 @@
>   *
>   * It is a regression test for
>   *
> - * commit e57457641613fef0d147ede8bd6a3047df588b95
> + * commit 1756d7994ad85c2479af6ae5a9750b92324685af
>   * Author: Tejun Heo <tj@kernel.org>
> - * Date:   Thu Jan 6 11:02:29 2022 -1000
> + * Date:   Thu Jan 6 11:02:28 2022 -1000
>   *
> - * cgroup: Use open-time cgroup namespace for process migration perm checks
> + * cgroup: Use open-time credentials for process migraton perm checks
>   */
>  
>  #include <stdlib.h>
> @@ -101,7 +101,7 @@ static struct tst_test test = {
>  	.needs_root = 1,
>  	.needs_cgroup_ctrls = (const char *const[]){"memory",  NULL},
>  	.tags = (const struct tst_tag[]) {
> -		{"linux-git", "e57457641613"},
> +		{"linux-git", "1756d7994ad8"},
>  		{"CVE", "2021-4197"},
>  		{}
>  	},
> -- 
> 2.23.0


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
