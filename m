Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EDE6B7D22
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Mar 2023 17:12:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 655883CAF72
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Mar 2023 17:12:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 585553C03AE
 for <ltp@lists.linux.it>; Mon, 13 Mar 2023 17:12:45 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2CF55200938
 for <ltp@lists.linux.it>; Mon, 13 Mar 2023 17:12:43 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E8FFE61359;
 Mon, 13 Mar 2023 16:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3A37C4331E;
 Mon, 13 Mar 2023 16:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678723961;
 bh=JMgBqqkMq8aazAV81LpMJjduhwTQKD7p13DYY8ThETE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LLGEodfJotMM/Ce/S9nXcb64TZrGFEy81O0upuGAIk/uWB9ZTJE4PwyVpdK+j5oEJ
 gJ2Lu35Vno7xzSnV3B7FtcYhGVb96KMPMmkV8E3rJ6ge/vfMA/n/D4XkdYeH4UbBEe
 IrojXwx616dF/pMY4+pKKwfUu75EK++nRYzxTCfw7tvZ5/As87rBeTexffLHPdJjtE
 yh66AMfxFV8pRtTtczktwkciIMJlwAvFGHIDJaLrZ2lTdC/xHon17eJHTMexu2JtIL
 AqBN4qC9jddd7b1kMXYUGyhUjHwmjV1Urr7AYzlpnwRW2+waj2ar1CQ0UAATzyw5cL
 N+gYv0YdcrlBg==
Date: Mon, 13 Mar 2023 09:12:40 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20230313161240.GA11394@frogsfrogsfrogs>
References: <20230307145517.1359-1-pvorel@suse.cz>
 <20230307145517.1359-3-pvorel@suse.cz> <ZA81c11hvBu4xlsd@yuki>
 <9e05fdea-94f5-c7a2-6bd2-3107f0410e17@redhat.com>
 <20230313153009.GA10305@pevik> <20230313153309.GC10305@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230313153309.GC10305@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] df01.sh: Use tst_fsfreeze for XFS on kernel
 >= 5.19
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
Cc: Eric Sandeen <sandeen@redhat.com>, Eric Sandeen <sandeen@sandeen.net>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, Mar 13, 2023 at 04:33:09PM +0100, Petr Vorel wrote:
> > > On 3/13/23 9:38 AM, Cyril Hrubis wrote:
> > > > Hi!
> > > >> XFS since kernel 5.19 postpone certain operation.  Use LTP fsfreeze
> > > >> implementation to force all the background garbage collection to run
> > > >> to completion.
> 
> > > >> Link: https://lore.kernel.org/linux-block/974cc110-d47e-5fae-af5f-e2e610720e2d@redhat.com/
> > > >> Suggested-by: Eric Sandeen <sandeen@redhat.com>
> > > >> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > > >> ---
> > > >>  testcases/commands/df/df01.sh | 7 ++++++-
> > > >>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> > > >> diff --git a/testcases/commands/df/df01.sh b/testcases/commands/df/df01.sh
> > > >> index ae0449c3c..699d1538f 100755
> > > >> --- a/testcases/commands/df/df01.sh
> > > >> +++ b/testcases/commands/df/df01.sh
> > > >> @@ -1,7 +1,7 @@
> > > >>  #!/bin/sh
> > > >>  # SPDX-License-Identifier: GPL-2.0-or-later
> > > >>  # Copyright (c) 2015 Fujitsu Ltd.
> > > >> -# Copyright (c) 2018-2022 Petr Vorel <pvorel@suse.cz>
> > > >> +# Copyright (c) 2018-2023 Petr Vorel <pvorel@suse.cz>
> > > >>  # Author: Zhang Jin <jy_zhangjin@cn.fujitsu.com>
> 
> > > >>  # Test df command with some basic options.
> > > >> @@ -46,6 +46,11 @@ df_test()
> 
> > > >>  	ROD_SILENT rm -rf $TST_MNTPOINT/testimg
> 
> > > >> +	# force all the background garbage collection to run to completion
> > > >> +	if [ "$TST_FS_TYPE" = "xfs" ] && tst_kvcmp -ge "5.19"; then
> > > >> +		tst_fsfreeze $TST_MNTPOINT
> > > >> +	fi
> 
> > > > This looks overly specific, can't we just freeze and unfreeze the FS
> > > > without looking at kernel version? Or will we get errors on older XFS?
> 
> > > > I suppose that this may still start to fail on distribution kernels if
> > > > some of the newer functionality gets backported...
> 
> > So far it's OK on SLES, likely nothing related has been backported to it.
> > I wonder if we should remove the check or just wait till first complaint.
> 
> Well, I haven't seen any problems with older kernels, but I'll retest it more.
> I don't expect any problems, thus I'm OK with removing it.

If the fs doesn't support freezing (e.g. tmpfs), you'll get a -1 return
value and errno == EOPNOTUPP or NOTTY.  Is that going to cause the test
to fail due to tst_brk?

> Kind regards,
> Petr
> 
> > > Yup, I agree. Freeze should be safe for any kernel, I wouldn't condition it either.
> 
> > > (You do want to be very sure that you're not freezing the root fs, tho,
> > > if that is any possibility.)

Why?  Are you worried about not being able to unfreeze the rootfs?
I know fstests has had problems with people doing:

xfs_io -c freeze "/$moo"	# whoops, moo is undefined
<something that blocks>
xfs_io -c thaw "/$moo"		# never gets here

But that's not the case here.

Even if it is the rootfs, the text page containing the two ioctls should
be in memory due to the instruction pointer, and even if it gets paged
out, freezes don't block read faults.

--D

> > $TST_MNTPOINT in on $TMPDIR, which is by default /tmp. In case of /tmp being on
> > root fs we're freezing root tmpfs. But it works on openSUSE, which found the
> > problem.
> 
> > Kind regards,
> > Petr
> 
> > > -Eric
> 
> > > > Otherwise it looks good.
> 
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
