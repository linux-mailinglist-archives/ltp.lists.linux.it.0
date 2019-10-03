Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 398E8C9E28
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Oct 2019 14:14:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BA2F13C2390
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Oct 2019 14:14:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 5D2E43C2357
 for <ltp@lists.linux.it>; Thu,  3 Oct 2019 14:14:36 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A565D600B30
 for <ltp@lists.linux.it>; Thu,  3 Oct 2019 14:14:11 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DC2E1AC35;
 Thu,  3 Oct 2019 12:14:34 +0000 (UTC)
Date: Thu, 3 Oct 2019 14:14:02 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Pengfei Xu <pengfei.xu@intel.com>
Message-ID: <20191003121402.GD1858@rei>
References: <20190927031930.27425-1-pengfei.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190927031930.27425-1-pengfei.xu@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH tbt_cases] umip_basic_test.c: update umip basic
 test for new kernel v5.4
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
Cc: Su Heng <heng.su@intel.com>, Neri Ricardo <ricardo.neri@intel.com>,
 ltp <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> +		/* after linux kernel v5.4 mainline, 64bit SGDT SIDT SMSW will return
> +		   dummy value and not trigger SIGSEGV due to kernel code change */
> +		#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,4,0)

This is obviously wrong, the version you get here is the version from
kernel headers that does not correspond to the kernel you are running
on at all.

We do have tst_kvercmp() function in LTP that uses parses uname() output
and returns if you are running on kernel newer/same/older as the version
passed to that function. Use that one instead.

> +			tst_res(TINFO, "Linux kernel version is after than v5.4");
> +			if (WIFSIGNALED(status) && WTERMSIG(status) == SIGSEGV) {
> +				tst_res(TFAIL, "Got SIGSEGV\n\n");
> +				return;
> +			}
> +			tst_res(TPASS, "Didn't receive SIGSEGV, child exited with %s\n\n",
> +				tst_strstatus(status));
> +				return;
				^
				Wrong indentation.

> +		#else
> +			tst_res(TINFO, "Linux kernel version is before than v5.4");
> +		#endif
> +	}
> +
>  	if (WIFSIGNALED(status) && WTERMSIG(status) == SIGSEGV) {
> -		tst_res(TPASS, "Got SIGSEGV");
> +		tst_res(TPASS, "Got SIGSEGV\n\n");
>  		return;
>  	}
> -	tst_res(TFAIL, "Didn't receive SIGSEGV, child exited with %s",
> +	tst_res(TFAIL, "Didn't receive SIGSEGV, child exited with %s\n\n",
>  		tst_strstatus(status));

Can you please avoid polluting output with useless newlines as well?

>  }
>  
> -- 
> 2.14.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
