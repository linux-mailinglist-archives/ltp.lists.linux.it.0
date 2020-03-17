Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B5210187B05
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 09:15:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E56063C0270
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 09:15:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id D33CF3C0270
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 09:15:52 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id CA7D56017EF
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 09:15:51 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 55B83AB3D;
 Tue, 17 Mar 2020 08:15:50 +0000 (UTC)
Date: Tue, 17 Mar 2020 09:15:47 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200317081547.GA15989@dell5510>
References: <20200313141458.GB21248@dell5510>
 <CAEemH2cNc7pCc-wB=4hGVquJT1Y5NCeZ_z8nH6D9V+J_5o_TWw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cNc7pCc-wB=4hGVquJT1Y5NCeZ_z8nH6D9V+J_5o_TWw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC] Define minimal supported kernel and (g)libc version
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

Hi Li,

> This is a good topic, thanks for kicking off this initiative!
Thanks for your input.

> > I'm sorry, I've raised this question in the past, but it got lost.
> > I remember we talked about 2.6 something.

> Yes, the past discussion is still valuable to us. see:
> http://lists.linux.it/pipermail/ltp/2019-May/011990.html
Great, thanks!

> > It'd be good to state publicly the oldest kernel and glibc (or even other
> > libc
> > versions) we support.  This would allow us to remove some legacy code or
> > force
> > support for legacy code.


> Maybe we could also state the oldest GCC version too? Though I haven't seen
> any conflict or supporting issue from my side, it helps avoid some
> potential error in cross-compilation I guess.
+1
Not sure if we want to specify also clang.

>     i.e.  kernel-3.10.0 / glibc-2.17 / gcc-4.8.0
This is for RHEL7 I guess.

The oldest system in travis we have CentOS 6: kernel-2.6.32 / glibc-2.12 /
gcc-4.4.7 (clang-3.4.2, but we don't test it with clang). I'm ok to have this
older dependency, just to make sure it builds.  But code would be cleaner for
sure if we drop it.

BTW I also occasionally test build on SLES 11-SP3 (kernel 3.0 / glibc-2.11.3 /
gcc-4.3.4 - older glibc and gcc), but this is not even in travis.
But for testing these distros we use older releases (the same mentioned Jan [1]).
I wonder if there is really somebody using 2.6.x or 3.x < 3.10 on master.
If not, we can drop some lapi files which mention 2.6.

Kind regards,
Petr

[1] http://lists.linux.it/pipermail/ltp/2019-May/011991.html

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
