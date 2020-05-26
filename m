Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C19CC1E1F2E
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 11:57:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6338D3C3278
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 11:57:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 3877D3C223E
 for <ltp@lists.linux.it>; Tue, 26 May 2020 11:57:20 +0200 (CEST)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E6737601068
 for <ltp@lists.linux.it>; Tue, 26 May 2020 11:56:48 +0200 (CEST)
IronPort-SDR: 92y/lt4fH7z+ci4H7cIqDaj8XUgfsD1HvAmcvCYZvvT6BCj/3jyQVSYfSBAhG9URwMJahnJXvc
 QNNQiIuhxdig==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2020 02:57:02 -0700
IronPort-SDR: l/gRBPq0mJUKlMb4pVZ4WCwJdKOk6FFVGGAD5fTyTbm+E+P9tXrToUMdRI7NrOA4ldr+Kb+QVv
 ssRCg/Cl320g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,436,1583222400"; d="scan'208";a="468237420"
Received: from xpf-desktop.sh.intel.com ([10.239.13.107])
 by fmsmga005.fm.intel.com with ESMTP; 26 May 2020 02:56:59 -0700
Date: Tue, 26 May 2020 18:07:00 +0800
From: Pengfei Xu <pengfei.xu@intel.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200526100700.GA24819@xpf-desktop.sh.intel.com>
References: <20191220092529.3239-1-pengfei.xu@intel.com>
 <20191220092529.3239-4-pengfei.xu@intel.com>
 <20200525212401.GA30581@dell5510>
 <20200526023233.GA14105@xpf-desktop.sh.intel.com>
 <20200526092346.GB10775@dell5510> <20200526092703.GC10775@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200526092703.GC10775@dell5510>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 4/4] umip_basic_test.c: improve kconfig
 verification to avoid umip wrong abort case
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
 ltp <ltp@lists.linux.it>, Kasten Robert <robert.a.kasten@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

On 2020-05-26 at 11:27:03 +0200, Petr Vorel wrote:
> Hi Xu,
> 
> > ...
> > > > Thanks for a report and your effort to fix the problem. But this does not work,
> > > > because current implementation does not support '|' as bitwise or, with this
> > > > patch will result on tests being skipped for both cases.
> > >   CONFIG_A|CONFIG_B=y means CONGIG_A or CONGIG_B equal 'y', it will meet the
> > >   test condition. So it's as expected; only could not find CONFIG_A and
> > >   CONFIG_B equal to 'y', then it will not meet the test condition and exit.
> > >   It should be as expected.
> > >   Thank you for considering this patch again.
> 
> > Well, I understand your syntax, that you mean | as bitwise or :).
> > But where did you find that this syntax is supported? Have a look in
> > tst_kconfig_read() implementation (lib/tst_kconfig.c), there is nothing like
> > this. And, indeed, if you test your patch on both CONFIG_X86_INTEL_UMIP=y and
> > CONFIG_X86_UMIP=y, it end up with:
> 
> > tst_kconfig.c:252: INFO: Missing kernel CONFIG_X86_INTEL_UMIP|CONFIG_X86_UMIP=y
> > tst_kconfig.c:284: CONF: Aborting due to unsuitable kernel config, see above!
> 
> > which confirm my statement there is no bitwise or support implemented :).
> > Or am I missing something?
> 
> OK I now realized, that it's a 4th patch of patchset. I thought it's just single
> patch, because the rest was rejected by Cyril:
> https://patchwork.ozlabs.org/project/ltp/list/?series=149804&state=*
> 
> But it looks like Cyril is not against the implementation, it just needs to be
> fixed:
> https://patchwork.ozlabs.org/comment/2352151/

You are right, actually it could be worked as my suggest way:
"CONFIG_A|CONFIG_B=Y".
I tried to use Cyril's advice "CONFIG_A=X|CONFIG_B=Y" way, which will
add more code complexity, so I just want to solve the problem I am currently
facing.
If we really need the "CONFIG_A=X|CONFIG_B=Y" function, which cannot be
satisfied by "CONFIG_A|CONFIG_B=Y" function in the future, then we could add
this function I think.
Thanks for your considering.

BR
Thanks!

Pengfei

> 
> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
