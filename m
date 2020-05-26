Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E0D1E1E7B
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 11:27:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C21013C3270
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 11:27:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 939333C136F
 for <ltp@lists.linux.it>; Tue, 26 May 2020 11:27:06 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 83486200D53
 for <ltp@lists.linux.it>; Tue, 26 May 2020 11:27:05 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 82A3FAD94;
 Tue, 26 May 2020 09:27:07 +0000 (UTC)
Date: Tue, 26 May 2020 11:27:03 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Pengfei Xu <pengfei.xu@intel.com>
Message-ID: <20200526092703.GC10775@dell5510>
References: <20191220092529.3239-1-pengfei.xu@intel.com>
 <20191220092529.3239-4-pengfei.xu@intel.com>
 <20200525212401.GA30581@dell5510>
 <20200526023233.GA14105@xpf-desktop.sh.intel.com>
 <20200526092346.GB10775@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200526092346.GB10775@dell5510>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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

> ...
> > > Thanks for a report and your effort to fix the problem. But this does not work,
> > > because current implementation does not support '|' as bitwise or, with this
> > > patch will result on tests being skipped for both cases.
> >   CONFIG_A|CONFIG_B=y means CONGIG_A or CONGIG_B equal 'y', it will meet the
> >   test condition. So it's as expected; only could not find CONFIG_A and
> >   CONFIG_B equal to 'y', then it will not meet the test condition and exit.
> >   It should be as expected.
> >   Thank you for considering this patch again.

> Well, I understand your syntax, that you mean | as bitwise or :).
> But where did you find that this syntax is supported? Have a look in
> tst_kconfig_read() implementation (lib/tst_kconfig.c), there is nothing like
> this. And, indeed, if you test your patch on both CONFIG_X86_INTEL_UMIP=y and
> CONFIG_X86_UMIP=y, it end up with:

> tst_kconfig.c:252: INFO: Missing kernel CONFIG_X86_INTEL_UMIP|CONFIG_X86_UMIP=y
> tst_kconfig.c:284: CONF: Aborting due to unsuitable kernel config, see above!

> which confirm my statement there is no bitwise or support implemented :).
> Or am I missing something?

OK I now realized, that it's a 4th patch of patchset. I thought it's just single
patch, because the rest was rejected by Cyril:
https://patchwork.ozlabs.org/project/ltp/list/?series=149804&state=*

But it looks like Cyril is not against the implementation, it just needs to be
fixed:
https://patchwork.ozlabs.org/comment/2352151/

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
