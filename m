Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0D62ACC01
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Nov 2020 04:42:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 59A243C6093
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Nov 2020 04:42:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 50D803C2FB4
 for <ltp@lists.linux.it>; Tue, 10 Nov 2020 04:42:09 +0100 (CET)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 39BEF600B94
 for <ltp@lists.linux.it>; Tue, 10 Nov 2020 04:42:06 +0100 (CET)
IronPort-SDR: o1oKWInlUT5cOhoRjvTyYgvibOPl8jUIjoEEF2iStgPnWluDAWoOF7AEraWVSGeE3WjrgiAmsy
 MuPhSSs8qANg==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="157694049"
X-IronPort-AV: E=Sophos;i="5.77,465,1596524400"; d="scan'208";a="157694049"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 19:42:04 -0800
IronPort-SDR: 3un1O90fqTv6Dp6hJoOQ3SaXkAKRhXX0j/UxdFVJ79hfzPWATNWr6rPN0fWhnR7bPsT5GS+2FB
 ycBCLtduK5uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,465,1596524400"; d="scan'208";a="355967089"
Received: from fedora29.sh.intel.com ([10.239.183.87])
 by fmsmga004.fm.intel.com with ESMTP; 09 Nov 2020 19:42:03 -0800
Date: Tue, 10 Nov 2020 11:30:11 -0500
From: Pengfei Xu <pengfei.xu@intel.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20201110163011.GA8178@fedora29.sh.intel.com>
References: <20201109141948.25412-1-chrubis@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201109141948.25412-1-chrubis@suse.cz>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.5 required=7.0 tests=DATE_IN_FUTURE_12_24,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] [COMMITTED] security/umip_basic_test: Fix config
 constraints
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

Thanks a lot, Cyril!

On 2020-11-09 at 15:19:48 +0100, Cyril Hrubis wrote:
> Since linux-5.5 UMIP kconfig changed from "CONFIG_X86_INTEL_UMIP=y" to
> "CONFIG_X86_UMIP=y" fix this by accepting either of these two.
> 
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> Reported-by: Pengfei Xu <pengfei.xu@intel.com>
> ---
>  testcases/kernel/security/umip/umip_basic_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/testcases/kernel/security/umip/umip_basic_test.c b/testcases/kernel/security/umip/umip_basic_test.c
> index 1baa26c52..13c317022 100644
> --- a/testcases/kernel/security/umip/umip_basic_test.c
> +++ b/testcases/kernel/security/umip/umip_basic_test.c
> @@ -171,7 +171,7 @@ static struct tst_test test = {
>  	.forks_child = 1,
>  	.test = verify_umip_instruction,
>  	.needs_kconfigs = (const char *[]){
> -		"CONFIG_X86_INTEL_UMIP=y",
> +		"CONFIG_X86_INTEL_UMIP=y | CONFIG_X86_UMIP=y",
>  		NULL
>  	},
>  	.needs_root = 1,
> -- 
> 2.26.2
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
