Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C4FC13A5
	for <lists+linux-ltp@lfdr.de>; Sun, 29 Sep 2019 08:28:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7FC383C110C
	for <lists+linux-ltp@lfdr.de>; Sun, 29 Sep 2019 08:28:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id E72093C0FE7
 for <ltp@lists.linux.it>; Sun, 29 Sep 2019 08:28:09 +0200 (CEST)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8F13C1A00CD8
 for <ltp@lists.linux.it>; Sun, 29 Sep 2019 08:28:05 +0200 (CEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Sep 2019 23:28:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,562,1559545200"; d="scan'208";a="181000627"
Received: from xpf-desktop.sh.intel.com (HELO xpf-desktop) ([10.239.13.102])
 by orsmga007.jf.intel.com with ESMTP; 28 Sep 2019 23:28:01 -0700
Date: Sun, 29 Sep 2019 14:34:55 +0800
From: Pengfei Xu <pengfei.xu@intel.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190929063455.ympb34kmlmrgxbl2@xpf-desktop>
References: <20190927034635.28521-1-pengfei.xu@intel.com>
 <CAEemH2dGOcpSmD=BkvQZW=JTtbpkoUSN+tqffkDu+jV=vJsUqA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dGOcpSmD=BkvQZW=JTtbpkoUSN+tqffkDu+jV=vJsUqA@mail.gmail.com>
User-Agent: NeoMutt/20170609 (1.8.3)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] umip_basic_test.c: update umip basic test for new
 kernel v5.4
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

Hi Li Wang,

  My feedback is as below, thanks!

On 2019-09-29 at 11:47:21 +0800, Li Wang wrote:
> On Fri, Sep 27, 2019 at 11:39 AM Pengfei Xu <pengfei.xu@intel.com> wrote:
> 
> > After linux kernel v5.4 mainline, 64bit SGDT SIDT SMSW will return
> > dummy value and not trigger SIGSEGV due to kernel code change.
> > For detailed kernel update info, you could check v5.4 commit:
> > x86/umip: Add emulation (spoofing) for UMIP covered instructions in
> > 64-bit processes as well
> >
> > Signed-off-by: Pengfei Xu <pengfei.xu@intel.com>
> > ---
> >  testcases/kernel/security/umip/umip_basic_test.c | 25
> > ++++++++++++++++++++++--
> >  1 file changed, 23 insertions(+), 2 deletions(-)
> >
> > diff --git a/testcases/kernel/security/umip/umip_basic_test.c
> > b/testcases/kernel/security/umip/umip_basic_test.c
> > index 37850ef9f..278ae92f6 100644
> > --- a/testcases/kernel/security/umip/umip_basic_test.c
> > +++ b/testcases/kernel/security/umip/umip_basic_test.c
> > @@ -21,6 +21,7 @@
> >  #include <string.h>
> >  #include <sys/wait.h>
> >  #include <signal.h>
> > +#include <linux/version.h>
> >
> >  #include "tst_test.h"
> >  #include "tst_safe_stdio.h"
> > @@ -112,11 +113,31 @@ static void verify_umip_instruction(unsigned int n)
> >
> >         SAFE_WAITPID(pid, &status, 0);
> >
> > +       switch (n) {
> > +       case 0:
> > +       case 1:
> > +       case 3:
> > +               /* after linux kernel v5.4 mainline, 64bit SGDT SIDT SMSW
> > will return
> > +                  dummy value and not trigger SIGSEGV due to kernel code
> > change */
> > +               #if LINUX_VERSION_CODE >= KERNEL_VERSION(5,4,0)
> > +                       tst_res(TINFO, "Linux kernel version is after than
> > v5.4");
> > +                       if (WIFSIGNALED(status) && WTERMSIG(status) ==
> > SIGSEGV) {
> > +                               tst_res(TFAIL, "Got SIGSEGV\n\n");
> > +                               return;
> > +                       }
> > +                       tst_res(TPASS, "Didn't receive SIGSEGV, child
> > exited with %s\n\n",
> > +                               tst_strstatus(status));
> > +                               return;
> > +               #else
> > +                       tst_res(TINFO, "Linux kernel version is before
> > than v5.4");
> >
> 
> Thank you for fixing this.
> 
> My concern is that if an LTS distro backports the patch(commit e86c2c8b93),
> then it will break this hardcode kernel-version comparing.
> 
> 
  Ok, let's wait to confirm umip patch merged into Linux kernel main line,
  and then merge the patch into LTP. :)
  Thanks for your advice!

> 
> > +               #endif
> > +       }
> > +
> >         if (WIFSIGNALED(status) && WTERMSIG(status) == SIGSEGV) {
> > -               tst_res(TPASS, "Got SIGSEGV");
> > +               tst_res(TPASS, "Got SIGSEGV\n\n");
> >
> 
> Why we need two '\n' here?
> 
  Because it could help to split umip cases in LTP, there are 5 umip cases
  in LTP tests, and we could check each umip case easily in LTP log,
  like as below:
  
"
 # ./umip_basic_test
 tst_kconfig.c:62: INFO: Parsing kernel config '/lib/kernel/config-5.3.0-xsuper+'
 tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
 umip_basic_test.c:160: INFO: cpuinfo contains umip, CPU supports umip
 umip_basic_test.c:41: INFO: TEST sgdt, sgdt result save at [0x7fff930bda8e]
 umip_basic_test.c:132: INFO: Linux kernel version is before v5.4
 umip_basic_test.c:137: PASS: Got SIGSEGV


 umip_basic_test.c:51: INFO: TEST sidt, sidt result save at [0x7fff930bda8e]

 umip_basic_test.c:132: INFO: Linux kernel version is before v5.4
 umip_basic_test.c:137: PASS: Got SIGSEGV


 umip_basic_test.c:60: INFO: TEST sldt, sldt result save at [0x7fff930bda80]

 umip_basic_test.c:137: PASS: Got SIGSEGV


 umip_basic_test.c:69: INFO: TEST smsw, smsw result save at [0x7fff930bda80]

 umip_basic_test.c:132: INFO: Linux kernel version is before v5.4
 umip_basic_test.c:137: PASS: Got SIGSEGV
"
Thanks! :)
> 
> >                 return;
> >         }
> > -       tst_res(TFAIL, "Didn't receive SIGSEGV, child exited with %s",
> > +       tst_res(TFAIL, "Didn't receive SIGSEGV, child exited with %s\n\n",
> >                 tst_strstatus(status));
> >  }
> >
> > --
> > 2.14.1
> >
> >
> > --
> > Mailing list info: https://lists.linux.it/listinfo/ltp
> >
> 
> 
> -- 
> Regards,
> Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
