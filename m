Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCAEBEFB1
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 12:34:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2CC223C232B
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 12:34:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 697CC3C23CB
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 12:33:56 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 99D5C10011D1
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 10:29:35 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 83AA87FDCA;
 Thu, 26 Sep 2019 08:29:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78B796012C;
 Thu, 26 Sep 2019 08:29:41 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 484C418089C8;
 Thu, 26 Sep 2019 08:29:41 +0000 (UTC)
Date: Thu, 26 Sep 2019 04:29:41 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <748796853.2255246.1569486581084.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190925112236.GA17496@rei.lan>
References: <20190906130707.GA7515@rei.lan> <20190925112236.GA17496@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.5]
Thread-Topic: LTP Release
Thread-Index: oT2+AwqUrf6/Jyh3dfqjdF69EWLWuQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Thu, 26 Sep 2019 08:29:41 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] LTP Release
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> Hi!
> I did a few testruns and so far it looks good.
> 
> I've send one patch for acct02, which is mostly cosmetic, that I would
> like to get merged.
> 
> I would still consider merging the eBPF regression test, does anybody
> have a strong opinion on this?
> 
> Apart from this preadv203 sometimes fails to trigger EAGAIN on virtual
> machines, but I doubt we can fix this before the release, I will try to
> do so later on.
> 
> The rest seems to be good, i.e. failures does not seem to be bugs in
> tests.
> 
> What is the status from rest of you? Is there anything that should be
> considered for the release? Is something failing unexpectedly?

I'm thinking if we should patch BPF tests to increase max lock memory
to +1MB. On Fedora30 default limit is '64', and I found couple
systems which by default come very close to that limit right after boot.
So even one iteration of BPF tests will hit a failure.

# lscpu 
Architecture:        x86_64
CPU op-mode(s):      32-bit, 64-bit
Byte Order:          Little Endian
Address sizes:       40 bits physical, 48 bits virtual
CPU(s):              16
On-line CPU(s) list: 0-15
Thread(s) per core:  2
Core(s) per socket:  4
Socket(s):           2
NUMA node(s):        2
Vendor ID:           GenuineIntel
CPU family:          6
Model:               26
Model name:          Intel(R) Xeon(R) CPU           E5530  @ 2.40GHz
Stepping:            5
CPU MHz:             1596.091
CPU max MHz:         2395.0000
CPU min MHz:         1596.0000
BogoMIPS:            4788.26
Virtualization:      VT-x
L1d cache:           32K
L1i cache:           32K
L2 cache:            256K
L3 cache:            8192K
NUMA node0 CPU(s):   0,2,4,6,8,10,12,14
NUMA node1 CPU(s):   1,3,5,7,9,11,13,15
Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm dca sse4_1 sse4_2 popcnt lahf_lm pti tpr_shadow vnmi flexpriority ept vpid dtherm ida

# uname -r
5.3.0-351c8a0.cki

# cat /etc/redhat-release 
Fedora release 30 (Thirty)

> 
> --
> Cyril Hrubis
> chrubis@suse.cz
> 
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
