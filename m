Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1185B645
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 10:03:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D34933C1DC1
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 10:03:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id D8B683C1D77
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 10:03:37 +0200 (CEST)
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3BC55140054E
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 10:03:36 +0200 (CEST)
Received: from pd9ef1cb8.dip0.t-ipconnect.de ([217.239.28.184] helo=nanos)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1hhrHd-0000IT-DL; Mon, 01 Jul 2019 10:03:29 +0200
Date: Mon, 1 Jul 2019 10:03:28 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Li Wang <liwang@redhat.com>
In-Reply-To: <CAEemH2cg01cdz=amrCWU00Xof9+cxmfR_DqCBaQe36QoGsakmA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1907010959390.1802@nanos.tec.linutronix.de>
References: <CAEemH2cg01cdz=amrCWU00Xof9+cxmfR_DqCBaQe36QoGsakmA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
Cc: kernellwp@gmail.com, ricardo.neri-calderon@linux.intel.com,
 ricardo.neri@intel.com, linux-kernel <linux-kernel@vger.kernel.org>,
 Ping Fang <pifang@redhat.com>, pbonzini@redhat.com,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, 1 Jul 2019, Li Wang wrote:

> Hello there,
> 
> LTP/umip_basic_test get failed on KVM UMIP system(kernel-v5.2-rc4.x86_64).
> The test is only trying to do
>      asm volatile("smsw %0\n" : "=m" (val));
> and expect to get SIGSEGV in this SMSW operation, but it exits with 0
> unexpectedly.
> 
> ====================
> # grep CONFIG_X86_INTEL_UMIP /boot/config-5.2.0-0.rc4.x86_64
> CONFIG_X86_INTEL_UMIP=y
> 
> # lscpu |grep umip
> Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
> mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp
> lm constant_tsc rep_good nopl xtopology cpuid tsc_known_freq pni pclmulqdq
> ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer
> aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch cpuid_fault
> invpcid_single pti ssbd ibrs ibpb stibp fsgsbase tsc_adjust bmi1 hle avx2
> smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt
> clwb avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 xsaves arat umip
> pku ospke md_clear
> 
> # ./umip_basic_test
> ...
> umip_basic_test.c:68: INFO: TEST smsw, smsw result save at [0x7ffda00dca70]
> umip_basic_test.c:118: FAIL: Didn't receive SIGSEGV, child exited with
> exited with 0

SMSW is emulated and returns a constant value:

#define CR0_STATE       (X86_CR0_PE | X86_CR0_MP | X86_CR0_ET | \
                         X86_CR0_NE | X86_CR0_WP | X86_CR0_AM | \
                         X86_CR0_PG)

IIRC that is done to not break stuff like Wine. Ricardo should know the
details.

Thanks,

	tglx


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
