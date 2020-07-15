Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE272206EA
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jul 2020 10:19:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6B1B53C29F5
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jul 2020 10:19:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 4BE573C1D4B
 for <ltp@lists.linux.it>; Wed, 15 Jul 2020 10:19:00 +0200 (CEST)
Received: from mx2.suse.de (unknown [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6054A1400E55
 for <ltp@lists.linux.it>; Wed, 15 Jul 2020 10:18:59 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 38EA1B023;
 Wed, 15 Jul 2020 08:19:02 +0000 (UTC)
Date: Wed, 15 Jul 2020 10:18:57 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Lachlan Sneff <t-josne@linux.microsoft.com>
Message-ID: <20200715081857.GB10916@dell5510>
References: <20200702153545.3126-1-t-josne@linux.microsoft.com>
 <20200702153545.3126-2-t-josne@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200702153545.3126-2-t-josne@linux.microsoft.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.3 required=7.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] IMA: Verify that the kernel cmdline is passed
 and measured correctly through the kexec barrier.
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
Cc: nramas@linux.microsoft.com, linux-integrity@vger.kernel.org,
 ltp@lists.linux.it, balajib@linux.microsoft.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Add a testcase that verifies that kexec correctly logs the
> kernel command line to the IMA buffer and that the command
> line is then correctly measured.

> This test must be run standalone, since it runs kexec
> multiple times (and therefore reboots several times).

> Signed-off-by: Lachlan Sneff <t-josne@linux.microsoft.com>
...
> +++ b/testcases/kexec/utils.sh
> @@ -0,0 +1,47 @@
> +#!/bin/sh
> +
> +install() {
> +    local arg="$1"
> +
> +    if [ ! -d "/etc/init.d" ]; then
> +        mkdir /etc/init.d
> +    fi
I'm not sure if tests like this are suitable for LTP.
Ideal LTP test is a normal test, which is able to run with runltp, cleanup after
itself and use LTP C or/and shell API. LTP is full of tests which needs special
handling and thus not being run, not sure if it's a good idea to introduce yet
another one.

Also test shouldn't not significantly modify SUT to make it unbootable, which
I'm not sure in this case. This is a big difference to kselftests which are
meant to help during kernel development which somehow expects some system
modifications (as you install your custom build kernel).

I wonder if using QEMU would help to implement this test while not touching SUT
(thus be able to run this test with runltp). If you miss something in LTP API
just let us know.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
