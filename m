Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F09125E5D
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Dec 2019 10:57:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 72BAD3C2241
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Dec 2019 10:57:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 1FFB43C17C7
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 10:57:12 +0100 (CET)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0621D1000CED
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 10:57:09 +0100 (CET)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Dec 2019 01:57:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,331,1571727600"; d="scan'208";a="228193571"
Received: from xpf-desktop.sh.intel.com (HELO xpf-desktop) ([10.239.13.102])
 by orsmga002.jf.intel.com with ESMTP; 19 Dec 2019 01:57:05 -0800
Date: Thu, 19 Dec 2019 18:03:37 +0800
From: Pengfei Xu <pengfei.xu@intel.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20191219100337.vv6p3gi5dddqdhjm@xpf-desktop>
References: <20191218122504.9985-1-pengfei.xu@intel.com>
 <c97da094-a320-e4b4-dee9-423a3e306ecf@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c97da094-a320-e4b4-dee9-423a3e306ecf@cn.fujitsu.com>
User-Agent: NeoMutt/20170609 (1.8.3)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
  Thanks for your comments!
  I made one wrong loop, which caused this issue.
  I will make another patch for any KCONFIG_AA or KCONFIG_AB is matached with
  y feature. : )

  Thanks!
  BR.

On 2019-12-19 at 12:02:34 +0800, Yang Xu wrote:
> Hi Pengfei
> 
> on 2019/12/18 20:25, Pengfei Xu wrote:
> > -	fp = open_kconfig();
> > -	if (!fp)
> > -		tst_brk(TBROK, "Cannot parse kernel .config");
> > +		while (fgets(buf, sizeof(buf), fp)) {
> > -	while (fgets(buf, sizeof(buf), fp)) {
> > -		for (i = 0; i < cnt; i++) {
> > -			if (match(&matches[i], kconfigs[i], &results[i], buf)) {
> > -				for (j = 0; j < cnt; j++) {
> > -					if (matches[j].match)
> > -						break;
> > -				}
> > +			memset(kconfig_multi, 0, sizeof(kconfig_multi));
> > +			/* strtok_r will split kconfigs[i] to multi string, so copy it */
> > +			memcpy(kconfig_multi, kconfigs[i], strlen(kconfigs[i]));
> > +
> > +			kconfig_token = strtok_r(kconfig_multi, "|=", &p_left)
> Here has a problem, if we use CONFIG_X86_INTEL_UMIP, it will report "miss
> this config" because it uses "=" or "|" to delim string.
> And I think you should use lib/newlib_tests/test_kconfig.c to test your
> introduced feature.
> 
> Also, it has another two problems even we use "|" or "=" in kconfigs
> 
> 1.If  use "CONFIG_X86_INTEL_UMIP=y|CONFIG_X86_UMIP=y" ,it will report y is
> invalid because we use "="or "|" to delim string.
> 2. If  use "CONFIG_X86_INTEL_UMIP|X86_INTEL_UMIP=y", it will doesn't check
> second config whether invalid if the first is ok.
> 
> Kind Regards
> Yang Xu
> > +			while (kconfig_token != NULL) {
> > +				if (strncmp("CONFIG_", kconfig_token, 7))
> > +					tst_brk(TBROK, "Invalid config string '%s'", kconfig_token);
> > +				matches[i].len = strlen(kconfig_token);
> > +				if (match(&matches[i], kconfig_token, &results[i], buf)) {
> > +					for (j = 0; j < cnt; j++) {
> > +						if (matches[j].match)
> > +							break;
> > +					}
> >   				if (j == cnt)
> >   					goto exit;
> > +				}
> > +				kconfig_token = strtok_r(NULL, "|=", &p_left);
> > +				/* avoid to use after "=" string */
> > +				if (strlen(p_left) == 0)
> > +					break;
> >   			}
> >   		}
> > -
> >   	}
> >   exit:
> > 
> 
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
