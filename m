Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB2F192D8D
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 16:56:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0165B3C4BB1
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 16:56:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 4B14D3C0796
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 16:56:27 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D2F5210016F2
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 16:56:26 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1CAA9AB76;
 Wed, 25 Mar 2020 15:56:26 +0000 (UTC)
Date: Wed, 25 Mar 2020 16:56:24 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200325155624.GC21800@dell5510>
References: <CAEemH2fhRYefq_9LmSmDvujS1OQa7rCeF7V=mJQrLhz0bwpo0A@mail.gmail.com>
 <CAEemH2e4sRwZ8HRm-w5CD=Wm8-SW+LaA5XHDnXdqrOL1t4FdtA@mail.gmail.com>
 <20200323160415.GC15673@dell5510> <20200324235150.GC4521@yuki.lan>
 <20200324172102.GA1307@dell5510> <20200325015324.GA15127@yuki.lan>
 <CAEemH2doL4m4-TLBBWTHygTRPSTa68dkoAFjZJrDmzrkmgUrSQ@mail.gmail.com>
 <20200325170739.GA2461@yuki.lan> <20200325093427.GA23023@dell5510>
 <1dea6ff2-f32d-c797-b52d-716efe73d4a6@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1dea6ff2-f32d-c797-b52d-716efe73d4a6@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] Use SAFE_RUNCMD()
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Xu,

> I have seen the history about this problem. We have few C cases to use many
> commands(copy_file_range02.c is a specify case, I ported it from xfstest to
> increase coverage), do we really want to implement need_cmd or
> want_cmds(Usually, we seldom use command in c case and  we should avoid this
> for reduce unnecessary dependencies, except user level command such as mkfs
> or makeswap or useradd)? It will give user a mislead.

> ps:copy_file_range02.c should use swapon and swapoff syscall instead of
> command.
Yes, rewriting to C would be an improvement for non-standard linux platforms
(but then you need to deal with other exceptions: e.g. whether
swapon()/swapoff() is even supported on platforms like Android and you might
endup with 1) much more code 2) TCONF anyway for these platforms.
And there is also chattr and mkswap.

Besides this IMHO there will always be a need for running some command via
tst_run_cmd() in the test instead of reimplementing a wheel. Some of other
dependencies:

cat (testcases/cve/stack_clash.c this one could be using C code),
mpdprobe, make, mkswap, quotacheck,
useradd/userdel (I plan to put these into the library, but still it's much
easier to use them than reimplement code in C).

Also library itself (these will not use the flag): insmod, modprobe, rmmod,  mkfs.*,
systemd-detect-virt (this one is not a hard dependency).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
