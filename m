Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E8659191841
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 18:57:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 67F383C4D9A
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 18:57:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id C82D63C4D2D
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 18:57:35 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 23E45140121C
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 18:57:34 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5482DAAB8;
 Tue, 24 Mar 2020 17:57:34 +0000 (UTC)
Date: Wed, 25 Mar 2020 02:53:25 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200325015324.GA15127@yuki.lan>
References: <20200320134937.16616-1-pvorel@suse.cz>
 <20200320134937.16616-2-pvorel@suse.cz>
 <CAEemH2f7TB9sMt-+YE2zF5KztT4O64VN9L4AZWdS3nU1uJX5_w@mail.gmail.com>
 <303d1019-f836-b2ae-ce51-d2c46dd7fb1e@cn.fujitsu.com>
 <20200323113738.GA4807@dell5510>
 <CAEemH2fhRYefq_9LmSmDvujS1OQa7rCeF7V=mJQrLhz0bwpo0A@mail.gmail.com>
 <CAEemH2e4sRwZ8HRm-w5CD=Wm8-SW+LaA5XHDnXdqrOL1t4FdtA@mail.gmail.com>
 <20200323160415.GC15673@dell5510> <20200324235150.GC4521@yuki.lan>
 <20200324172102.GA1307@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200324172102.GA1307@dell5510>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=DATE_IN_FUTURE_06_12,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Also if we are going to add this functionality it should be added as an
> > .needs_cmds array in the tst_test structure.
> .needs_cmds sounds as a good idea. But let's do it as a separate effort.
> I'll leave already sent v2 for review. Once .needs_cmds is implemented, we can
> use it as well for copy_file_range02.c.

Actually I would like to avoid exposing the function to the tests and
force people to use the .needs_cmds instead in order to have a proper
metadata.

> BTW what do you think on changing 255 (and 254) for something less common?
> It's just a corner case swapon on certain setup in copy_file_range02.c returns
> 255 on error:

I do not think that this will solve the problem. We may hit the same
problem with any random number we will choose.

I guess checking for the command existence before we vfork() would be
safer bet here.

> Setting up swapspace version 1, size = 36 KiB (36864 bytes)
> no label, UUID=bae78639-be0b-42b2-9e91-815b05f5751b
> swapon: /tmp/msT4Ch/file_swap: swapon failed: Invalid argument
> copy_file_range02.c:95: CONF: swapon binary not installed or failed
> 
> Kind regards,
> Petr

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
