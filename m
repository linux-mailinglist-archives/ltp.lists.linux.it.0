Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E23251E6591
	for <lists+linux-ltp@lfdr.de>; Thu, 28 May 2020 17:13:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F218F3C3208
	for <lists+linux-ltp@lfdr.de>; Thu, 28 May 2020 17:13:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 1B8DA3C207E
 for <ltp@lists.linux.it>; Thu, 28 May 2020 17:13:09 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7F68A6562E5
 for <ltp@lists.linux.it>; Thu, 28 May 2020 17:13:08 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1C1FCAC2C;
 Thu, 28 May 2020 15:13:07 +0000 (UTC)
Date: Thu, 28 May 2020 17:13:05 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20200528151305.GA22505@dell5510>
References: <64a5e1c5c8041679e3024b564f2c67ace779c110.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <64a5e1c5c8041679e3024b564f2c67ace779c110.camel@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] Memory requirements for ltp
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Richard,

> I work on the Yocto Project and we run ltp tests as part of our testing
> infrastructure. We're having problems where the tests hang during
> execution and are trying to figure out why as this is disruptive.

> It appears to be the controllers tests which hang. Its also clear we
> are running the tests on a system with too little memory (512MB) as
> there is OOM killer activity all over the logs (as well as errors from
> missing tools like nice, bc, gdb, ifconfig and others).
TCONF messages for missing tools are ok (although many of the dependencies are
available in busybox).

> I did dump all the logs and output I could find into a bug for tracking
> purposes, https://bugzilla.yoctoproject.org/show_bug.cgi?id=13802

> Petr tells me SUSE use 4GB for QEMU, does anyone have any other
> boundaries on what works/doesn't work?

Maybe memory itself isn't the only parameter, more would be interesting
available memory, which depends on used user space and particular kernel
configuration (which can be different embedded targets).

> Other questions that come to mind:

> Could/should ltp test for the tools it uses up front?
> Are there any particular tests we should avoid as they are known to be
> unreliable?
IMHO generally anything which haven't been changed for 10+ years :).
Thus tests which are using legacy API (test.h or test.sh).
(well, of course, some old tests are stable and new can be broken).

> The ones we're currently running are:

> "math", "syscalls", "dio", "io", "mm", "ipc", "sched", "nptl", "pty",
> "containers", "controllers", 
> "filecaps", "cap_bounds", "fcntl-locktests", "connectors", "commands",
> "net.ipv6_lib", "input",
> "fs_perms_simple", "fs", "fsx", "fs_bind"
IMHO cve (many of these are also in other runtest files, but here with CVE
number), uevent (new one), maybe pty (has found some bugs).
Maybe you're also interested to test some networking: net_stress.interface,
net_stress.ipsec_icmp are stable.

Last release there was added lvmtest.sh, which does testing filesystems over
LVM (maybe not interesting for you due not having enough disc capacity. What I
like that it detect presented filesystems via generate_lvm_runfile.sh).

> someone suggested I should just remove controllers but I'm not sure
> that is the best way forward.
Until tests are fixed, it's really better to disable them.
They need to be revised, there are bugs [1] and no support for cgroup2.

BTW C based tests in testcases/kernel/mem/ use cgroups, thus there will be some
(very limited) cgroups testing. And there is an attempt to improve these tests
[2] to fix use with cgroup2 [3].

> I will test with more memory (not sure how much yet) but I'd welcome
> more data if anyone has any.
Please report back your investigation.

Kind regards,
Petr

[1] https://github.com/linux-test-project/ltp/issues?q=is%3Aissue+is%3Aopen+cgroup
[2] https://patchwork.ozlabs.org/project/ltp/list/?series=178573
[3] https://github.com/linux-test-project/ltp/issues/611

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
