Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E7B3E5624
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Aug 2021 11:02:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 72F1D3C70A7
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Aug 2021 11:02:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 638AA3C5DC7
 for <ltp@lists.linux.it>; Tue, 10 Aug 2021 11:01:59 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id ABC801000B11
 for <ltp@lists.linux.it>; Tue, 10 Aug 2021 11:01:58 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id B091820087;
 Tue, 10 Aug 2021 09:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628586117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ep7SF3OSAdN5LNcUHAfUBVM4NwAiVCcHkrzD09Wx1Ps=;
 b=icHu2aQbTKroOcaoEFaoImGxywcg08Sim7ZUzJb638p6Q5uCYSlR9njFN1wemJXdbpjPwG
 d4+mBHy4qgPjQ8bCLYUS757zSFBbnmFd04BuUU2HV1iSkyu7fB2HfHsoTjI6xb90kZcqPB
 Fw4FaQdHgZbPtiT43DsutUNPGVMu+js=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628586117;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ep7SF3OSAdN5LNcUHAfUBVM4NwAiVCcHkrzD09Wx1Ps=;
 b=79mIsx5Xem+qv8n+ExyVfdt6sHFZnbDnwQL5808RSC5KCeie53QkAUajrHciNQrpTAZ4jq
 s+1qOQwmBHNzLoCQ==
Received: from quack2.suse.cz (unknown [10.100.224.230])
 by relay2.suse.de (Postfix) with ESMTP id 7F6A0A3BEC;
 Tue, 10 Aug 2021 09:01:57 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 0CB621E3BFC; Tue, 10 Aug 2021 11:01:57 +0200 (CEST)
Date: Tue, 10 Aug 2021 11:01:57 +0200
From: Jan Kara <jack@suse.cz>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Message-ID: <20210810090157.GA18722@quack2.suse.cz>
References: <20210730062854.3601635-1-svens@linux.ibm.com>
 <YQn+GomdRCoYc/E8@Ryzen-9-3900X.localdomain>
 <875ywlat5e.fsf@disp2133>
 <94478003-8259-4b57-6d93-5a07e0750946@kernel.org>
 <87v94jalck.fsf@disp2133>
 <56b7c0fe-f2e1-7c4f-eb1b-1d9793dea5a8@kernel.org>
 <CA+G9fYv+Azmu+_YUv6+C6RRM990k0FhUc0hgSJKssubmsWfvhA@mail.gmail.com>
 <8735rijqlv.fsf_-_@disp2133>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8735rijqlv.fsf_-_@disp2133>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] ucounts: add missing data type changes
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
Cc: Jan Kara <jack@suse.cz>, open list <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Sven Schnelle <svens@linux.ibm.com>,
 linux-fsdevel@vger.kernel.org, Alexey Gladkov <legion@kernel.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon 09-08-21 15:43:56, Eric W. Biederman wrote:
> 
> commit f9c82a4ea89c3 ("Increase size of ucounts to atomic_long_t")
> changed the data type of ucounts/ucounts_max to long, but missed to
> adjust a few other places. This is noticeable on big endian platforms
> from user space because the /proc/sys/user/max_*_names files all
> contain 0.
> 
> v4 - Made the min and max constants long so the sysctl values
>      are actually settable on little endian machines.
>      -- EWB
> 
> Fixes: f9c82a4ea89c ("Increase size of ucounts to atomic_long_t")
> Signed-off-by: Sven Schnelle <svens@linux.ibm.com>
> Tested-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Acked-by: Alexey Gladkov <legion@kernel.org>
> v1: https://lkml.kernel.org/r/20210721115800.910778-1-svens@linux.ibm.com
> v2: https://lkml.kernel.org/r/20210721125233.1041429-1-svens@linux.ibm.com
> v3: https://lkml.kernel.org/r/20210730062854.3601635-1-svens@linux.ibm.com
> Signed-off-by: Eric W. Biederman <ebiederm@xmission.com>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
> 
> Thanks everyone for testing and helping find the cause of this bug.  I
> will push this out to linux-next shortly.
> 
>  fs/notify/fanotify/fanotify_user.c | 17 +++++++++++------
>  fs/notify/inotify/inotify_user.c   | 17 +++++++++++------
>  kernel/ucount.c                    | 19 +++++++++++--------
>  3 files changed, 33 insertions(+), 20 deletions(-)
> 
> diff --git a/fs/notify/fanotify/fanotify_user.c b/fs/notify/fanotify/fanotify_user.c
> index 64864fb40b40..28b67cb9458d 100644
> --- a/fs/notify/fanotify/fanotify_user.c
> +++ b/fs/notify/fanotify/fanotify_user.c
> @@ -54,22 +54,27 @@ static int fanotify_max_queued_events __read_mostly;
>  
>  #include <linux/sysctl.h>
>  
> +static long ft_zero = 0;
> +static long ft_int_max = INT_MAX;
> +
>  struct ctl_table fanotify_table[] = {
>  	{
>  		.procname	= "max_user_groups",
>  		.data	= &init_user_ns.ucount_max[UCOUNT_FANOTIFY_GROUPS],
> -		.maxlen		= sizeof(int),
> +		.maxlen		= sizeof(long),
>  		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= SYSCTL_ZERO,
> +		.proc_handler	= proc_doulongvec_minmax,
> +		.extra1		= &ft_zero,
> +		.extra2		= &ft_int_max,
>  	},
>  	{
>  		.procname	= "max_user_marks",
>  		.data	= &init_user_ns.ucount_max[UCOUNT_FANOTIFY_MARKS],
> -		.maxlen		= sizeof(int),
> +		.maxlen		= sizeof(long),
>  		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= SYSCTL_ZERO,
> +		.proc_handler	= proc_doulongvec_minmax,
> +		.extra1		= &ft_zero,
> +		.extra2		= &ft_int_max,
>  	},
>  	{
>  		.procname	= "max_queued_events",
> diff --git a/fs/notify/inotify/inotify_user.c b/fs/notify/inotify/inotify_user.c
> index 98f61b31745a..62051247f6d2 100644
> --- a/fs/notify/inotify/inotify_user.c
> +++ b/fs/notify/inotify/inotify_user.c
> @@ -55,22 +55,27 @@ struct kmem_cache *inotify_inode_mark_cachep __read_mostly;
>  
>  #include <linux/sysctl.h>
>  
> +static long it_zero = 0;
> +static long it_int_max = INT_MAX;
> +
>  struct ctl_table inotify_table[] = {
>  	{
>  		.procname	= "max_user_instances",
>  		.data		= &init_user_ns.ucount_max[UCOUNT_INOTIFY_INSTANCES],
> -		.maxlen		= sizeof(int),
> +		.maxlen		= sizeof(long),
>  		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= SYSCTL_ZERO,
> +		.proc_handler	= proc_doulongvec_minmax,
> +		.extra1		= &it_zero,
> +		.extra2		= &it_int_max,
>  	},
>  	{
>  		.procname	= "max_user_watches",
>  		.data		= &init_user_ns.ucount_max[UCOUNT_INOTIFY_WATCHES],
> -		.maxlen		= sizeof(int),
> +		.maxlen		= sizeof(long),
>  		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> -		.extra1		= SYSCTL_ZERO,
> +		.proc_handler	= proc_doulongvec_minmax,
> +		.extra1		= &it_zero,
> +		.extra2		= &it_int_max,
>  	},
>  	{
>  		.procname	= "max_queued_events",
> diff --git a/kernel/ucount.c b/kernel/ucount.c
> index 77be3bbe3cc4..bb51849e6375 100644
> --- a/kernel/ucount.c
> +++ b/kernel/ucount.c
> @@ -58,14 +58,17 @@ static struct ctl_table_root set_root = {
>  	.permissions = set_permissions,
>  };
>  
> -#define UCOUNT_ENTRY(name)				\
> -	{						\
> -		.procname	= name,			\
> -		.maxlen		= sizeof(int),		\
> -		.mode		= 0644,			\
> -		.proc_handler	= proc_dointvec_minmax,	\
> -		.extra1		= SYSCTL_ZERO,		\
> -		.extra2		= SYSCTL_INT_MAX,	\
> +static long ue_zero = 0;
> +static long ue_int_max = INT_MAX;
> +
> +#define UCOUNT_ENTRY(name)					\
> +	{							\
> +		.procname	= name,				\
> +		.maxlen		= sizeof(long),			\
> +		.mode		= 0644,				\
> +		.proc_handler	= proc_doulongvec_minmax,	\
> +		.extra1		= &ue_zero,			\
> +		.extra2		= &ue_int_max,			\
>  	}
>  static struct ctl_table user_table[] = {
>  	UCOUNT_ENTRY("max_user_namespaces"),
> -- 
> 2.20.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
