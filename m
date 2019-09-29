Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 62926C1401
	for <lists+linux-ltp@lfdr.de>; Sun, 29 Sep 2019 10:54:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 29D033C110D
	for <lists+linux-ltp@lfdr.de>; Sun, 29 Sep 2019 10:54:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id E146F3C101B
 for <ltp@lists.linux.it>; Sun, 29 Sep 2019 10:54:09 +0200 (CEST)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id BE6C1600941
 for <ltp@lists.linux.it>; Sun, 29 Sep 2019 10:54:06 +0200 (CEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Sep 2019 01:54:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,562,1559545200"; d="scan'208";a="215368986"
Received: from xpf-desktop.sh.intel.com (HELO xpf-desktop) ([10.239.13.102])
 by fmsmga004.fm.intel.com with ESMTP; 29 Sep 2019 01:54:01 -0700
Date: Sun, 29 Sep 2019 17:00:56 +0800
From: Pengfei Xu <pengfei.xu@intel.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190929090056.u34megeq5yen7j4i@xpf-desktop>
References: <20190927034635.28521-1-pengfei.xu@intel.com>
 <CAEemH2dGOcpSmD=BkvQZW=JTtbpkoUSN+tqffkDu+jV=vJsUqA@mail.gmail.com>
 <20190929063455.ympb34kmlmrgxbl2@xpf-desktop>
 <CAEemH2dG-7vsULkUuJSDu8-e-z7abRpBJ88ARPuEqOwM4bt=tA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dG-7vsULkUuJSDu8-e-z7abRpBJ88ARPuEqOwM4bt=tA@mail.gmail.com>
User-Agent: NeoMutt/20170609 (1.8.3)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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


On 2019-09-29 at 15:13:35 +0800, Li Wang wrote:
> Hi Pengfei,
> 
> Pengfei Xu <pengfei.xu@intel.com> wrote:
> 
> ...
> > >
> > > My concern is that if an LTS distro backports the patch(commit
> > e86c2c8b93),
> > > then it will break this hardcode kernel-version comparing.
> > >
> > >
> >   Ok, let's wait to confirm umip patch merged into Linux kernel main line,
> >   and then merge the patch into LTP. :)
> >
> 
> Sorry, I'm not talking merge time. I mean we have to consider more kernel
> distros(RHEL, SLES, Ubuntu) when writing/amending LTP test.
> 
> Imagine that, if RHEL8(kernel base on v4.18) backports the kernel
> patch(x86/umip: Add emulation (spoofing) for UMIP covered instructions in
> 64-bit processes) and what will happen after applying your patch in
> this umip_basic_test.c test? It will fail since that kernel version is less
> than 5.4. We probably need to find a way to solve this issue.
> 
 Ok, got it, we need consider one better way for it. :)
 Thanks for advice!

> >
> > > > +               #endif
> > > > +       }
> > > > +
> > > >         if (WIFSIGNALED(status) && WTERMSIG(status) == SIGSEGV) {
> > > > -               tst_res(TPASS, "Got SIGSEGV");
> > > > +               tst_res(TPASS, "Got SIGSEGV\n\n");
> > > >
> > >
> > > Why we need two '\n' here?
> > >
> >   Because it could help to split umip cases in LTP, there are 5 umip cases
> >   in LTP tests, and we could check each umip case easily in LTP log,
> >
> 
> It is unnecessary because each test shows TINFO before testing.
>   e.g  "umip_basic_test.c:41: INFO: TEST sgdt, sgdt result save at
> [0x7fff930bda8e]"
> 
 Ok thanks! :)

> -- 
> Regards,
> Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
