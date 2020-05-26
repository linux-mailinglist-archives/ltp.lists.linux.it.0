Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 468281E1E71
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 11:23:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1662D3C3270
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 11:23:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 0AED83C136F
 for <ltp@lists.linux.it>; Tue, 26 May 2020 11:23:48 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 97CEA600052
 for <ltp@lists.linux.it>; Tue, 26 May 2020 11:23:48 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 91D92AB76;
 Tue, 26 May 2020 09:23:50 +0000 (UTC)
Date: Tue, 26 May 2020 11:23:46 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Pengfei Xu <pengfei.xu@intel.com>
Message-ID: <20200526092346.GB10775@dell5510>
References: <20191220092529.3239-1-pengfei.xu@intel.com>
 <20191220092529.3239-4-pengfei.xu@intel.com>
 <20200525212401.GA30581@dell5510>
 <20200526023233.GA14105@xpf-desktop.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200526023233.GA14105@xpf-desktop.sh.intel.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Su Heng <heng.su@intel.com>, Neri Ricardo <ricardo.neri@intel.com>,
 ltp <ltp@lists.linux.it>, Kasten Robert <robert.a.kasten@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Xu,

...
> > Thanks for a report and your effort to fix the problem. But this does not work,
> > because current implementation does not support '|' as bitwise or, with this
> > patch will result on tests being skipped for both cases.
>   CONFIG_A|CONFIG_B=y means CONGIG_A or CONGIG_B equal 'y', it will meet the
>   test condition. So it's as expected; only could not find CONFIG_A and
>   CONFIG_B equal to 'y', then it will not meet the test condition and exit.
>   It should be as expected.
>   Thank you for considering this patch again.

Well, I understand your syntax, that you mean | as bitwise or :).
But where did you find that this syntax is supported? Have a look in
tst_kconfig_read() implementation (lib/tst_kconfig.c), there is nothing like
this. And, indeed, if you test your patch on both CONFIG_X86_INTEL_UMIP=y and
CONFIG_X86_UMIP=y, it end up with:

tst_kconfig.c:252: INFO: Missing kernel CONFIG_X86_INTEL_UMIP|CONFIG_X86_UMIP=y
tst_kconfig.c:284: CONF: Aborting due to unsuitable kernel config, see above!

which confirm my statement there is no bitwise or support implemented :).
Or am I missing something?

And it might be questionable if CONFIG_A|CONFIG_B=y would mean (CONFIG_A|CONFIG_B)=y
or (CONFIG_A|CONFIG_B=y), thus it should be CONFIG_A=y|CONFIG_B=y

But given the fact this functionality is needed just for a single test and can
be workarounded I suggested to use LINUX_VERSION_CODE instead.
The only problem can happen when this is backported to the old code. But we
could also try to detect that with custom call twice tst_kconfig_read() in the
test setup.

Kind regards,
Petr

> > While it'd be easy to implement support for bitwise or in tst_kconfig_read(),
> > it might be enough just to check for kernel version:

> > .needs_kconfigs = (const char *[]) {
> > #if LINUX_VERSION_CODE < KERNEL_VERSION(5, 5, 0)
> > 	"CONFIG_X86_INTEL_UMIP=y",
> > #else
> > 	"CONFIG_X86_UMIP=y",
> > #endif

> > But that will work unless this feature is not backported (IMHO commit
> > b971880fe79f ("x86/Kconfig: Rename UMIP config parameter") is kind of cleanup,
> > therefore unlikely to be backported, but it can happen).

> > Kind regards,
> > Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
