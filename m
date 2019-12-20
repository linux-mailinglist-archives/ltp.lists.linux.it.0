Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B21B127613
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Dec 2019 08:03:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0DA3B3C243C
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Dec 2019 08:03:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id A80863C1443
 for <ltp@lists.linux.it>; Fri, 20 Dec 2019 08:03:14 +0100 (CET)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D2E551A023DA
 for <ltp@lists.linux.it>; Fri, 20 Dec 2019 08:03:11 +0100 (CET)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Dec 2019 23:02:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,334,1571727600"; d="scan'208";a="210728937"
Received: from xpf-desktop.sh.intel.com (HELO xpf-desktop) ([10.239.13.102])
 by orsmga008.jf.intel.com with ESMTP; 19 Dec 2019 23:02:55 -0800
Date: Fri, 20 Dec 2019 15:09:26 +0800
From: Pengfei Xu <pengfei.xu@intel.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20191220070926.i4jknfoo6pdhersl@xpf-desktop>
References: <20191219131855.28799-1-pengfei.xu@intel.com>
 <20191219131855.28799-4-pengfei.xu@intel.com>
 <9ac02979-d8ec-4a11-7705-bb484dd79a20@cn.fujitsu.com>
 <20191220060151.nqvekuzs24yipia7@xpf-desktop>
 <5e859ac0-d009-3281-e712-fc86f7c72986@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5e859ac0-d009-3281-e712-fc86f7c72986@cn.fujitsu.com>
User-Agent: NeoMutt/20170609 (1.8.3)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 4/4] lib: add any kconfig to match the expected
 value function document
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

Hi Xu,
  Due to memory copy, there is some bit and display issue in last string.

  So for your question, for CONFIG_A|CONFIG_B without expect value, maybe y
  or m.
  We could add it with below style:
  "CONFIG_A|CONFIG_B|NA", and add it into guidelines, NA will not be solved,
  actually you could fill with any string after last '|'.
  Is it ok?

  Thanks!

On 2019-12-20 at 14:00:00 +0800, Yang Xu wrote:
> Hi Pengfei
> > Hi Xu,
> > 
> > 
> > > Before your patch, I know we can use the following two formats kconfigs
> > > CONFIG_A
> > > CONFIG_A=y/m/v
> > > after your patch set, we can use the following three formats kconfigs
> > > CONFIG_A
> > > CONFIG_A=y/m/v
> > > CONFIG_A|CONFIGB=y/m/v
> > > As the usual extend logic,  we think  CONFIGA|CONFIGB is also ok. But in
> > > fact, we use "|" or "=" to delim string. So  we can't parse CONFIGA|CONFIGB
> > > correctly. So, if we can tell user or developer about this in here, it will
> > > be better.
> > > 
> > > ps: we can add configA| config B test in your third patch.
> > > 
> >    Actually present patch could support CONFIG_A|CONFIG_B style, and it works
> > well, you could change "CONFIG_X86_INTEL_UMIP|CONFIG_X86_UMIP=y" to
> > "CONFIG_X86_INTEL_UMIP|CONFIG_X86_UMIP" in test_kconfig.c and have a try. : )
> "CONFIG_X86_INTEL_UMIP|CONFIG_X86_UMIP" is useful because
> CONFIG_X86_INTEL_UMIP is in our kernel configs . If you use
> "CONFIG_X86_UMIP|CONFIG_X86_INTEL_UMIP", it will report error.
> 
> Kind Regards
> Yang Xu
> > 
> > Thanks!
> > > Kind Regards
> > > Yang Xu
> > > >    #include "tst_test.h"
> > > >    static const char *kconfigs[] = {
> > > > -	"CONFIG_X86_INTEL_UMIP",
> > > > +	"CONFIG_EXT4_FS=y",
> > > > +	"CONFIG_MMU",
> > > > +	"CONFIG_X86_INTEL_UMIP|CONFIG_X86_UMIP=y",
> > > >    	NULL
> > > >    };
> > > > 
> > > 
> > > 
> > 
> > 
> 
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
