Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B179ECA12F
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Oct 2019 17:36:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1E5603C2367
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Oct 2019 17:36:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 2F76B3C22B0
 for <ltp@lists.linux.it>; Thu,  3 Oct 2019 17:36:31 +0200 (CEST)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 038BB14016C8
 for <ltp@lists.linux.it>; Thu,  3 Oct 2019 17:36:29 +0200 (CEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Oct 2019 08:36:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,252,1566889200"; d="scan'208";a="195248039"
Received: from xpf-desktop.sh.intel.com (HELO xpf-desktop) ([10.239.13.102])
 by orsmga003.jf.intel.com with ESMTP; 03 Oct 2019 08:36:25 -0700
Date: Thu, 3 Oct 2019 23:43:18 +0800
From: Pengfei Xu <pengfei.xu@intel.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20191003154318.cixq4onhnrzv3tpp@xpf-desktop>
References: <20190927031930.27425-1-pengfei.xu@intel.com>
 <20191003121402.GD1858@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191003121402.GD1858@rei>
User-Agent: NeoMutt/20170609 (1.8.3)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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

Hi Hrubis,

  Thanks a lot for your comments! :)
  BR.

On 2019-10-03 at 14:14:02 +0200, Cyril Hrubis wrote:
> Hi!
> > +		/* after linux kernel v5.4 mainline, 64bit SGDT SIDT SMSW will return
> > +		   dummy value and not trigger SIGSEGV due to kernel code change */
> > +		#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,4,0)
> 
> This is obviously wrong, the version you get here is the version from
> kernel headers that does not correspond to the kernel you are running
> on at all.
> 
> We do have tst_kvercmp() function in LTP that uses parses uname() output
> and returns if you are running on kernel newer/same/older as the version
> passed to that function. Use that one instead.
> 
  Will use tst_kvercmp function, thanks.

> > +			tst_res(TINFO, "Linux kernel version is after than v5.4");
> > +			if (WIFSIGNALED(status) && WTERMSIG(status) == SIGSEGV) {
> > +				tst_res(TFAIL, "Got SIGSEGV\n\n");
> > +				return;
> > +			}
> > +			tst_res(TPASS, "Didn't receive SIGSEGV, child exited with %s\n\n",
> > +				tst_strstatus(status));
> > +				return;
> 				^
> 				Wrong indentation.
> 
  Yes, will correct it.


> > +		#else
> > +			tst_res(TINFO, "Linux kernel version is before than v5.4");
> > +		#endif
> > +	}
> > +
> >  	if (WIFSIGNALED(status) && WTERMSIG(status) == SIGSEGV) {
> > -		tst_res(TPASS, "Got SIGSEGV");
> > +		tst_res(TPASS, "Got SIGSEGV\n\n");
> >  		return;
> >  	}
> > -	tst_res(TFAIL, "Didn't receive SIGSEGV, child exited with %s",
> > +	tst_res(TFAIL, "Didn't receive SIGSEGV, child exited with %s\n\n",
> >  		tst_strstatus(status));
> 
> Can you please avoid polluting output with useless newlines as well?
> 
> >  }
  Ok, will avoid useless newlines.
  Thanks for all comments, will correct them.

> >  
> > -- 
> > 2.14.1
> > 
> > 
> > -- 
> > Mailing list info: https://lists.linux.it/listinfo/ltp
> 
> -- 
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
