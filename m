Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE511262FB
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Dec 2019 14:11:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9FA363C23B9
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Dec 2019 14:11:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 75EB53C2284
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 14:11:42 +0100 (CET)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 55E49608A83
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 14:11:39 +0100 (CET)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Dec 2019 05:11:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,332,1571727600"; d="scan'208";a="218493964"
Received: from xpf-desktop.sh.intel.com (HELO xpf-desktop) ([10.239.13.102])
 by orsmga003.jf.intel.com with ESMTP; 19 Dec 2019 05:11:35 -0800
Date: Thu, 19 Dec 2019 21:18:07 +0800
From: Pengfei Xu <pengfei.xu@intel.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20191219131807.cxwfm2mib6wqhwaj@xpf-desktop>
References: <20191218122504.9985-1-pengfei.xu@intel.com>
 <c97da094-a320-e4b4-dee9-423a3e306ecf@cn.fujitsu.com>
 <b19e2cd0-964f-2fe3-860f-039d63088d52@cn.fujitsu.com>
 <20191219100602.mpyelysyizonfrit@xpf-desktop>
 <cfa113f3-56b8-f93f-b3ed-50e9bd9f849a@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cfa113f3-56b8-f93f-b3ed-50e9bd9f849a@cn.fujitsu.com>
User-Agent: NeoMutt/20170609 (1.8.3)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib/tst_kconfig.c: add or select kconfig
 function
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

Hi Xu,

On 2019-12-19 at 19:03:16 +0800, Yang Xu wrote:
> Hi Pengfei
> > Hi Xu,
> >    Thanks for your advice!
> >    My concern is that:
> >    If some one need any CONFIG_A, CONFIG_B, CONFIG_C ... set to y.
> >    We need rewrite again.
> >    Also, thanks for advice, I will used newlib_tests to double check.:)
> > 
> I see. Also, you should add example to lib/newlib_tests/test_kconfig.c so we
> can know the kconfig feature is ok when maintainer merges your patch.
> Usually, if we modify or add lib feature, we will document it in
> doc/test-writing-guidelines.txt. So if you do it , it will be better.
> as below:
> diff --git a/lib/newlib_tests/test_kconfig.c
> b/lib/newlib_tests/test_kconfig.c
> index d9c662fc5..9515b60e2 100644
> --- a/lib/newlib_tests/test_kconfig.c
> +++ b/lib/newlib_tests/test_kconfig.c
> @@ -14,6 +14,7 @@ static const char *kconfigs[] = {
>         "CONFIG_MMU",
>         "CONFIG_EXT4_FS=m",
>         "CONFIG_PGTABLE_LEVELS=4",
> +       "CONFIG_X86_INTEL_UMIP|CONFIG_X86_UMIP=y",
>         NULL
>  };
  Thanks for your advice! I will add them.

  Thanks!
  BR.
> 
> Kind Regards
> Yang Xu
> >    Thanks!
> >    BR.
> 
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
