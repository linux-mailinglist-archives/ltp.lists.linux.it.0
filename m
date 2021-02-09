Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E182C315227
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Feb 2021 15:56:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AF4CD3C683B
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Feb 2021 15:56:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 8E3EB3C0304
 for <ltp@lists.linux.it>; Tue,  9 Feb 2021 15:56:08 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1426A60096C
 for <ltp@lists.linux.it>; Tue,  9 Feb 2021 15:56:07 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 76E83B1EA;
 Tue,  9 Feb 2021 14:56:07 +0000 (UTC)
Date: Tue, 9 Feb 2021 15:56:27 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
Message-ID: <YCKim8Pvg+ZTrHXI@rei>
References: <1612772078-29651-1-git-send-email-zhufy.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1612772078-29651-1-git-send-email-zhufy.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] netns_helper: Make iproute version check work
 correctly
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
> diff --git a/testcases/kernel/containers/netns/netns_helper.h b/testcases/kernel/containers/netns/netns_helper.h
> index 8b87645..8337051 100644
> --- a/testcases/kernel/containers/netns/netns_helper.h
> +++ b/testcases/kernel/containers/netns/netns_helper.h
> @@ -37,6 +37,7 @@ static void check_iproute(unsigned int spe_ipver)
>  	FILE *ipf;
>  	int n;
>  	unsigned int ipver = 0;
> +	char ver;
>  
>  	ipf = popen("ip -V", "r");
>  	if (ipf == NULL)
> @@ -44,7 +45,14 @@ static void check_iproute(unsigned int spe_ipver)
>  				"Failed while opening pipe for iproute check");
>  
>  	n = fscanf(ipf, "ip utility, iproute2-ss%u", &ipver);
> +	pclose(ipf);
>  	if (n < 1) {
> +		ipf = popen("ip -V", "r");
> +		n = fscanf(ipf, "ip utility, iproute2-%s", &ver);
> +		if (n >= 1) {
> +			pclose(ipf);
> +			return;
> +		}

Can we please instead read the whole string after the dash (-), skip
the 'ss' prefix when present and then convert the string into an
itneger?

There is absolutely no reason to run the command twice.

>  static int dummy(void *arg)
> diff --git a/testcases/kernel/containers/netns/netns_helper.sh b/testcases/kernel/containers/netns/netns_helper.sh
> index a5b77a0..bec43ac 100755
> --- a/testcases/kernel/containers/netns/netns_helper.sh
> +++ b/testcases/kernel/containers/netns/netns_helper.sh
> @@ -50,6 +50,15 @@ tst_check_iproute()
>  	local cur_ipver="$(ip -V)"
>  	local spe_ipver="$1"
>  
> +	echo $cur_ipver | grep "ip utility, iproute2-ss" > /dev/null
> +	ret1=$?
> +	echo $cur_ipver | grep "ip utility, iproute2-" > /dev/null
> +	ret2=$?
> +
> +	if [ $ret1 -ne 0 -a $ret2 -eq 0 ]; then
> +		return
> +	fi

How is this supposed to fix the problem?

This just skips the test if we haven't found one of the strings in the
version, right? Which is wrong anyway.

>  	cur_ipver=${cur_ipver##*s}

But the version here is still wrong if the original string haven't
contained the ss. We would end up with cur_ipver with iproute2-123456,
which will be used in the numerical comparsion.

>  	if [ -z "$cur_ipver" -o -z "$spe_ipver" ]; then
> -- 
> 1.8.3.1
> 
> 
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
