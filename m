Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 463365C0D3
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 18:04:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF4D43C1D92
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 18:04:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 9E3FC3C1D87
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 18:04:26 +0200 (CEST)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E2532600CF7
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 18:04:24 +0200 (CEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Jul 2019 09:04:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,439,1557212400"; d="scan'208";a="157335602"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by orsmga008.jf.intel.com with ESMTP; 01 Jul 2019 09:04:21 -0700
Date: Mon, 1 Jul 2019 09:03:52 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190701160352.GA19921@ranerica-svr.sc.intel.com>
References: <CAEemH2cg01cdz=amrCWU00Xof9+cxmfR_DqCBaQe36QoGsakmA@mail.gmail.com>
 <5622c0ac-236f-4e3e-a132-c8d3bd8fadc4@redhat.com>
 <CAEemH2fqMpoiBo+asyawHsOWgdXy-ggV0mwQs9A9EJ1kh=uhAA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2fqMpoiBo+asyawHsOWgdXy-ggV0mwQs9A9EJ1kh=uhAA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [Kernel BUG?] SMSW operation get success on UMIP KVM guest
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
Cc: kernellwp@gmail.com, ricardo.neri@intel.com,
 linux-kernel <linux-kernel@vger.kernel.org>, Ping Fang <pifang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, tglx@linutronix.de,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, Jul 01, 2019 at 08:57:28PM +0800, Li Wang wrote:
> On Mon, Jul 1, 2019 at 8:02 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
> 
> > On 01/07/19 09:50, Li Wang wrote:
> > > Hello there,
> > >
> > > LTP/umip_basic_test get failed on KVM UMIP
> > > system(kernel-v5.2-rc4.x86_64). The test is only trying to do
> > >      asm volatile("smsw %0\n" : "=m" (val));
> > > and expect to get SIGSEGV in this SMSW operation, but it exits with 0
> > > unexpectedly.
> >
> > In addition to what Thomas said, perhaps you are using a host that does
> > *not* have UMIP, and configuring KVM to emulate it(*).  In that case, it
> > is not possible to intercept SMSW, and therefore it will incorrectly
> > succeed.
> >
> 
> Right, I checked the host system, and confirmed that CPU doesn't support
> UMIP.
> 
> >
> > Paolo
> >
> > (*) before the x86 people jump at me, this won't happen unless you
> > explicitly pass an option to QEMU, such as "-cpu host,+umip". :)  The
> > incorrect emulation of SMSW when CR4.UMIP=1 is why.
> >
> Good to know this, is there any document for that declaration? It seems
> neither LTP issue nor kernel bug here. But anyway we'd better do something
> to avoid the error in the test.

The test case already checks for umip in /proc/cpuinfo, right? And in
long mode it always expects a SIGSEGV signal. If you did not add -cpu host,+umip,
how come umip was present in /proc/cpuinfo?

Thanks and BR,
Ricardo

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
