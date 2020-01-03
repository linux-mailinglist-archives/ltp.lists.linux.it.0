Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8747012FA6C
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jan 2020 17:30:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 43E933C244E
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jan 2020 17:30:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id AF2EB3C242A
 for <ltp@lists.linux.it>; Fri,  3 Jan 2020 17:30:27 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D7B201000D91
 for <ltp@lists.linux.it>; Fri,  3 Jan 2020 17:30:26 +0100 (CET)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1507A21734;
 Fri,  3 Jan 2020 16:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578069024;
 bh=9Ik8cMfPBaJNUHWmeVYHaV2wMG09CyYTlz0uvCUc4vU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PSmXGRlShemnVOVqF7OVCtoOCif3mmdRlrF6xvtHYL72TL1I3xoAxAoUiPMwpK+bO
 fuXSE+Yebics1udKzuT45xqPSyZYRvxnfdPLpeASYZO3CTtFh2d/5XwA1bwUKHKsQd
 cxzO6Cn+2zizlhAvO+EJiINIwEkcTv1OOTSatYG4=
Date: Fri, 3 Jan 2020 17:30:22 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Guenter Roeck <linux@roeck-us.net>
Message-ID: <20200103163022.GA1205191@kroah.com>
References: <20200102215829.911231638@linuxfoundation.org>
 <CA+G9fYuPkOGKbeQ0FKKx4H0Bs-nRHALsFtwyRw0Rt5DoOCvRHg@mail.gmail.com>
 <CAK8P3a1+Srey_7cUd0xfaO8HdMv5tkUcs6DeDXzcUKkUD-DnGQ@mail.gmail.com>
 <CAK8P3a24EkUXTu-K2c-5B3w-LZwY7zNcX0dZixb3gd59vRw_Kw@mail.gmail.com>
 <180c36d7-336b-f7a9-66d4-49703eca2aa9@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <180c36d7-336b-f7a9-66d4-49703eca2aa9@roeck-us.net>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5.4 000/191] 5.4.8-stable review
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
Cc: Al Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>,
 Ben Hutchings <ben.hutchings@codethink.co.uk>, Arnd Bergmann <arnd@arndb.de>,
 Sasha Levin <sashal@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 patches@kernelci.org, Chengguang Xu <cgxu519@mykernel.net>,
 John Stultz <john.stultz@linaro.org>, linux- stable <stable@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 LTP List <ltp@lists.linux.it>, Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Jan 03, 2020 at 07:48:49AM -0800, Guenter Roeck wrote:
> On 1/3/20 7:29 AM, Arnd Bergmann wrote:
> > On Fri, Jan 3, 2020 at 4:25 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > 
> > > On Fri, Jan 3, 2020 at 4:03 PM Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > > > 
> > > > On Fri, 3 Jan 2020 at 03:42, Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org> wrote:
> > > 
> > > -ENOENT is what you get when hugetlbfs is not mounted, so this hints to
> > > 
> > > 8fc312b32b2  mm/hugetlbfs: fix error handling when setting up mounts
> > > 
> > > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?h=linux-5.4.y&id=3f549fb42a39bea3b29c0fc12afee53c4a01bec9
> > 
> > I see that Mike Kravetz suggested not putting this patch into stable in
> > 
> > https://lore.kernel.org/lkml/befca227-cb8a-8f47-617d-e3bf9972bfec@oracle.com/
> > 
> > but it was picked through the autosel mechanism later.
> > 
> 
> I think autosel is way too aggressive. This is an excellent example.

Why?  It fixes a bug, the text says so, and the code shows it.  This is
a great example of a patch that autosel _should_ be picking up.  Now the
fact that it happens to break existing functionality is not an
autosel-detectable thing.  Especially as that same functionality is now
broken in Linus's tree :)

Autosel assumes that patches are correct, it can't know that they are
buggy.  That should have been weeded out by the developers and testing
before they hit Linus's tree.

thanks,

greg k-h

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
