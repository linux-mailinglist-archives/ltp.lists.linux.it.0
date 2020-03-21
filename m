Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6111118DE4F
	for <lists+linux-ltp@lfdr.de>; Sat, 21 Mar 2020 07:46:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1000C3C4FD3
	for <lists+linux-ltp@lfdr.de>; Sat, 21 Mar 2020 07:46:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id DD77E3C050E
 for <ltp@lists.linux.it>; Sat, 21 Mar 2020 07:46:47 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C09C11A00CAC
 for <ltp@lists.linux.it>; Sat, 21 Mar 2020 07:46:45 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 79FF5AFE3;
 Sat, 21 Mar 2020 06:46:44 +0000 (UTC)
Date: Sat, 21 Mar 2020 07:46:41 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20200321064641.GA3196159@x230>
References: <20200313141458.GB21248@dell5510>
 <CAEemH2cNc7pCc-wB=4hGVquJT1Y5NCeZ_z8nH6D9V+J_5o_TWw@mail.gmail.com>
 <20200317081547.GA15989@dell5510>
 <2016207059.2611128.1584622138390.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2016207059.2611128.1584622138390.JavaMail.zimbra@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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

Hi,

> Correct, it's still active (though in less extent than RHEL8). But
> I still see value of running/supporting LTP here.

> As I said in previous thread, if we want to draw a line somewhere,
> e.g. say anything older 10 years is too old, RHEL6/Centos6 would
> fall in that. For regression tests it should be OK to use older
> stable release.

OK. We can remove CentOS 6 (or probably replace with CentOS 7) now or after next
release. I don't have a strong opinion about it.
After it's removal all that 2.6.x fixes in m4/ should be deleted.

I'd be for putting supported versions in README.md.

> > The oldest system in travis we have CentOS 6: kernel-2.6.32 / glibc-2.12 /
> > gcc-4.4.7 (clang-3.4.2, but we don't test it with clang). I'm ok to have this
> > older dependency, just to make sure it builds.  But code would be cleaner for
> > sure if we drop it.

> > BTW I also occasionally test build on SLES 11-SP3 (kernel 3.0 / glibc-2.11.3
> > /
> > gcc-4.3.4 - older glibc and gcc), but this is not even in travis.
> > But for testing these distros we use older releases (the same mentioned Jan
> > [1]).
> > I wonder if there is really somebody using 2.6.x or 3.x < 3.10 on master.
> > If not, we can drop some lapi files which mention 2.6.

> There are some, since LTP didn't reject such patches yet. But updates to
> those old kernels are few and far between, so it might be not be worth
> the trouble from LTP point of view.

No strong opinion. I wouldn't be against asking these people directly
(which would lead to postpone deleting legacy support after next release).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
