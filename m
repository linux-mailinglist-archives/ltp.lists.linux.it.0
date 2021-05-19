Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 230EF388D57
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 13:57:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9E31B3C3105
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 13:57:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 067F23C3067
 for <ltp@lists.linux.it>; Wed, 19 May 2021 13:57:06 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 398F920023C
 for <ltp@lists.linux.it>; Wed, 19 May 2021 13:57:05 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7AD98B127;
 Wed, 19 May 2021 11:57:05 +0000 (UTC)
Date: Wed, 19 May 2021 13:30:54 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YKT27nlItfECLuYw@yuki>
References: <20210513152125.25766-1-rpalethorpe@suse.com>
 <20210513152125.25766-5-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210513152125.25766-5-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/6] API/cgroups: Add cpu controller
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
>  lib/tst_cgroup.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
> index 54636fd7e..da177a1ad 100644
> --- a/lib/tst_cgroup.c
> +++ b/lib/tst_cgroup.c
> @@ -82,7 +82,8 @@ struct cgroup_root {
>  /* Controller sub-systems */
>  enum cgroup_ctrl_indx {
>  	CTRL_MEMORY = 1,
> -	CTRL_CPUSET = 2,
> +	CTRL_CPU,
> +	CTRL_CPUSET,
>  };
>  #define CTRLS_MAX CTRL_CPUSET
>  
> @@ -162,6 +163,18 @@ static const files_t memory_ctrl_files = {
>  	{ }
>  };
>  
> +static const files_t cpu_ctrl_files = {
> +	/* The V1 quota and period files were combined in the V2 max
> +	 * file. The quota is in the first column and if we just print
> +	 * a single value to the file, it will be treated as the
> +	 * quota. To get or set the period we need to branch on the
> +	 * API version.
> +	 */

I wonder if this is worth a helper function, something as:

#define SAFE_CGROUP_CPU_SET_MAX(cg, quota_us, period_us) \
	tst_cgroup_cpu_set_max(__FILE__, __LINENO__, cg, quota_us, period_us)

void tst_cgroup_cpu_set_max(const char *const file, const int lineno,
                            const struct tst_cgroup_group *const cg,
                            unsigned int quota_us, unsigned int period_us);

#define SAFE_CGROUP_CPU_GET_MAX(cg, quota_us, period_us) \
	tst_cgroup_cpu_get_max(__FILE__, __LINENO__, cg, quota_us, period_us)

void tst_cgroup_cpu_get_max(const char *const file, const int lineno,
                            const struct tst_cgroup_group *const cg,
                            unsigned int *quota_us, unsigned int *period_us);

I guess that if we are going to add more tests we would end up with such
functions somewhere anyways.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
