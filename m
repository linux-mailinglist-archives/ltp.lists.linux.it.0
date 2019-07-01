Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 692E05BEFF
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 17:05:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2D0E63C1D88
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 17:05:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 16FD03C1D65
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 16:53:42 +0200 (CEST)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D37061A010F8
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 16:53:40 +0200 (CEST)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Jul 2019 07:53:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,439,1557212400"; d="scan'208";a="174246309"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by orsmga002.jf.intel.com with ESMTP; 01 Jul 2019 07:53:36 -0700
Date: Mon, 1 Jul 2019 07:53:08 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20190701145308.GA19368@ranerica-svr.sc.intel.com>
References: <CAEemH2cg01cdz=amrCWU00Xof9+cxmfR_DqCBaQe36QoGsakmA@mail.gmail.com>
 <5622c0ac-236f-4e3e-a132-c8d3bd8fadc4@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5622c0ac-236f-4e3e-a132-c8d3bd8fadc4@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 01 Jul 2019 17:05:32 +0200
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
 tglx@linutronix.de, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, Jul 01, 2019 at 02:02:35PM +0200, Paolo Bonzini wrote:
> On 01/07/19 09:50, Li Wang wrote:
> > Hello there,
> > =

> > LTP/umip_basic_test get failed on KVM UMIP
> > system(kernel-v5.2-rc4.x86_64). The test is only trying to do
> > =A0 =A0 =A0asm volatile("smsw %0\n" : "=3Dm" (val));
> > and expect to get SIGSEGV in this SMSW operation, but it exits with 0
> > unexpectedly.
> =

> In addition to what Thomas said, perhaps you are using a host that does
> *not* have UMIP, and configuring KVM to emulate it(*).  In that case, it
> is not possible to intercept SMSW, and therefore it will incorrectly
> succeed.

Also, emulation for SMSW, SIDT, and SGDT is done only for 32-bit
processes. As Thomas said, the purpose is not on break Wine. In 64-bit
processes, we sould always see a #GP exception.
> =

> Paolo
> =

> (*) before the x86 people jump at me, this won't happen unless you
> explicitly pass an option to QEMU, such as "-cpu host,+umip". :)  The
> incorrect emulation of SMSW when CR4.UMIP=3D1 is why.

Paolo, what do you mean by the incorrect emulation of SMSW?

Thanks and BR,
Ricardo

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
