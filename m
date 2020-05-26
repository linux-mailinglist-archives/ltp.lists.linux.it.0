Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B681E194F
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 04:22:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4E2453C334A
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 04:22:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 2CFF93C136F
 for <ltp@lists.linux.it>; Tue, 26 May 2020 04:22:40 +0200 (CEST)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 025491A00E03
 for <ltp@lists.linux.it>; Tue, 26 May 2020 04:22:37 +0200 (CEST)
IronPort-SDR: /N5cBNQIGPb/5C3N+ZkRSPxHJrtC45aEe9WbLSxBHVlZuQYbigXOp2Sg6rVs0z7LdKVCfT2dOZ
 xHJxe36CPXRg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2020 19:22:34 -0700
IronPort-SDR: 6qzMfrdJEmQ7w7Xvd1VZajkDeuZfL50YVlSXLgAXx8tnAxT0WVGDTlYwZySk4j/0UncQUNvgNm
 fFVAHrSYifUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,435,1583222400"; d="scan'208";a="413657708"
Received: from xpf-desktop.sh.intel.com ([10.239.13.107])
 by orsmga004.jf.intel.com with ESMTP; 25 May 2020 19:22:33 -0700
Date: Tue, 26 May 2020 10:32:33 +0800
From: Pengfei Xu <pengfei.xu@intel.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200526023233.GA14105@xpf-desktop.sh.intel.com>
References: <20191220092529.3239-1-pengfei.xu@intel.com>
 <20191220092529.3239-4-pengfei.xu@intel.com>
 <20200525212401.GA30581@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200525212401.GA30581@dell5510>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
  Thanks and my feedback is as below.

  Thanks.
  BR.

On 2020-05-25 at 23:24:01 +0200, Petr Vorel wrote:
> Hi Xu,
> 
> > From v5.5 main line, umip kconfig changed from "CONFIG_X86_INTEL_UMIP=y"
> > to "CONFIG_X86_UMIP=y".
> > We could use "CONFIG_X86_INTEL_UMIP|CONFIG_X86_UMIP=y" to check kconfig
> > CONFIG_X86_INTEL_UMIP=y(old kernel) or CONFIG_X86_UMIP=y(new kernel) for umip.
> 
> > Signed-off-by: Pengfei Xu <pengfei.xu@intel.com>
> > ---
> >  testcases/kernel/security/umip/umip_basic_test.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> > diff --git a/testcases/kernel/security/umip/umip_basic_test.c b/testcases/kernel/security/umip/umip_basic_test.c
> > index 1baa26c52..24eca8890 100644
> > --- a/testcases/kernel/security/umip/umip_basic_test.c
> > +++ b/testcases/kernel/security/umip/umip_basic_test.c
> > @@ -171,7 +171,7 @@ static struct tst_test test = {
> >  	.forks_child = 1,
> >  	.test = verify_umip_instruction,
> >  	.needs_kconfigs = (const char *[]){
> > -		"CONFIG_X86_INTEL_UMIP=y",
> > +		"CONFIG_X86_INTEL_UMIP|CONFIG_X86_UMIP=y",
> 
> We're sorry to get to your patch now, after 5 months.
> 
> Thanks for a report and your effort to fix the problem. But this does not work,
> because current implementation does not support '|' as bitwise or, with this
> patch will result on tests being skipped for both cases.
  CONFIG_A|CONFIG_B=y means CONGIG_A or CONGIG_B equal 'y', it will meet the
  test condition. So it's as expected; only could not find CONFIG_A and
  CONFIG_B equal to 'y', then it will not meet the test condition and exit.
  It should be as expected.
  Thank you for considering this patch again.

> 
> While it'd be easy to implement support for bitwise or in tst_kconfig_read(),
> it might be enough just to check for kernel version:
> 
> .needs_kconfigs = (const char *[]){
> #if LINUX_VERSION_CODE < KERNEL_VERSION(5, 5, 0)
> 	"CONFIG_X86_INTEL_UMIP=y",
> #else
> 	"CONFIG_X86_UMIP=y",
> #endif
> 
> But that will work unless this feature is not backported (IMHO commit
> b971880fe79f ("x86/Kconfig: Rename UMIP config parameter") is kind of cleanup,
> therefore unlikely to be backported, but it can happen).
> 
> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
