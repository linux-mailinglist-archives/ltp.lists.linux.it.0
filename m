Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0841EA679
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jun 2020 17:06:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5BCCD3C30A5
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jun 2020 17:06:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 0C9D43C309A
 for <ltp@lists.linux.it>; Mon,  1 Jun 2020 17:06:16 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C2606140076D
 for <ltp@lists.linux.it>; Mon,  1 Jun 2020 17:06:15 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 00905AD1E;
 Mon,  1 Jun 2020 15:06:16 +0000 (UTC)
Date: Mon, 1 Jun 2020 17:06:37 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20200601150637.GA25335@yuki.lan>
References: <64a5e1c5c8041679e3024b564f2c67ace779c110.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <64a5e1c5c8041679e3024b564f2c67ace779c110.camel@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> I work on the Yocto Project and we run ltp tests as part of our testing
> infrastructure. We're having problems where the tests hang during
> execution and are trying to figure out why as this is disruptive.
> 
> It appears to be the controllers tests which hang. Its also clear we
> are running the tests on a system with too little memory (512MB) as
> there is OOM killer activity all over the logs (as well as errors from
> missing tools like nice, bc, gdb, ifconfig and others).

We do have plans to scale memory intensive testcases with the system
memory, but that haven't been put into an action yet. See:

https://github.com/linux-test-project/ltp/issues/664

Generally most of the tests should run fine with 1GB of RAM and
everything should well with 2GB.

The cgroup stress tests are creating a lot of directories in the
hierarchy and attaching processes there, so they may cause OOM and
timeouts on embedded hardware. Ideally they should have some heuristic
on how much processes we can fork given the system available memory and
skip the more intesive testcases if needed. But even estimating how much
memory process and cgroup hierarchy could take would be not that
trivial...

> I did dump all the logs and output I could find into a bug for tracking
> purposes, https://bugzilla.yoctoproject.org/show_bug.cgi?id=13802
> 
> Petr tells me SUSE use 4GB for QEMU, does anyone have any other
> boundaries on what works/doesn't work?
> 
> Other questions that come to mind:
> 
> Could/should ltp test for the tools it uses up front?

This is actually being solved slowly, we are moving to a declarative
approach where test requirements are listed in a static structure. There
is also parser that can extract that information and produce a json file
that describes all (new library) tests in LTP testsuite. However this is
still experimental and out-of-tree at this point. But I do have a web
page demo that renders that json at:

http://metan.ucw.cz/outgoing/metadata.html

So in the (hopefully not so far) future the testrunner would consume
that file and could make much better decisions based on that metadata.

The main motivation for me are parallel testruns, if the testrunner
knows what testcases require/use we can easily avoid them competing for
resources and false possitives caused by this.

> Are there any particular tests we should avoid as they are known to be
> unreliable?
> 
> The ones we're currently running are:
> 
> "math", "syscalls", "dio", "io", "mm", "ipc", "sched", "nptl", "pty",
> "containers", "controllers", 
> "filecaps", "cap_bounds", "fcntl-locktests", "connectors", "commands",
> "net.ipv6_lib", "input",
> "fs_perms_simple", "fs", "fsx", "fs_bind"
> 
> someone suggested I should just remove controllers but I'm not sure
> that is the best way forward.
> 
> I will test with more memory (not sure how much yet) but I'd welcome
> more data if anyone has any.

I would advise to filter out oom* testcases from mm if you have problems
with OOM killing the wrong processes, these testcases are intended to
trigger OOM and test that the kernel is able to recover, but they tend
to be problematic especially on machines with little RAM.

Apart from that the rest should be reasonably safe on modern hardware,
but with less than 1G of RAM you mileage may vary.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
