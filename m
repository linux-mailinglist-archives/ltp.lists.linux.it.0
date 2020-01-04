Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A25513018B
	for <lists+linux-ltp@lfdr.de>; Sat,  4 Jan 2020 10:06:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B8CA13C23F5
	for <lists+linux-ltp@lfdr.de>; Sat,  4 Jan 2020 10:06:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 4B7283C23E4
 for <ltp@lists.linux.it>; Sat,  4 Jan 2020 10:06:13 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 520031000CE7
 for <ltp@lists.linux.it>; Sat,  4 Jan 2020 10:06:11 +0100 (CET)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9876D2464E;
 Sat,  4 Jan 2020 09:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578128769;
 bh=MHDULSZzfbYAw761SebMDzHsX+7nHNjvGFgET6+nwGc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R6bJdEMmHaIUoKdghC/bYEEgRfD85nyPldA7HwhFLXraqYVd1QQ9XLJ4QsuRgzQtk
 RnEKxtx8UeXxfx8IjsBCMK9HdIVGemqSb57rvh3nHV8LWI+IGayTSmM8jkMTqGYIfm
 r3OLYM4+IvS2cspA6+yWsNuRwTl/zVhmXe/nYWf8=
Date: Sat, 4 Jan 2020 10:06:06 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <20200104090606.GA1249964@kroah.com>
References: <20200102215829.911231638@linuxfoundation.org>
 <CA+G9fYuPkOGKbeQ0FKKx4H0Bs-nRHALsFtwyRw0Rt5DoOCvRHg@mail.gmail.com>
 <CAK8P3a1+Srey_7cUd0xfaO8HdMv5tkUcs6DeDXzcUKkUD-DnGQ@mail.gmail.com>
 <CAK8P3a24EkUXTu-K2c-5B3w-LZwY7zNcX0dZixb3gd59vRw_Kw@mail.gmail.com>
 <20200103154518.GB1064304@kroah.com>
 <CAK8P3a00SpVfSE5oL8_F_8jHdg_8A5fyEKH_DWNyPToxack=zA@mail.gmail.com>
 <a2fc8b36-c512-b6dd-7349-dfb551e348b6@oracle.com>
 <8283b231-f6e8-876f-7094-d3265096ab9a@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8283b231-f6e8-876f-7094-d3265096ab9a@oracle.com>
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
Cc: Sasha Levin <sashal@kernel.org>, David Howells <dhowells@redhat.com>,
 Ben Hutchings <ben.hutchings@codethink.co.uk>, Arnd Bergmann <arnd@arndb.de>,
 Shuah Khan <shuah@kernel.org>, LTP List <ltp@lists.linux.it>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 patches@kernelci.org, Chengguang Xu <cgxu519@mykernel.net>,
 John Stultz <john.stultz@linaro.org>, linux- stable <stable@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Jan 03, 2020 at 09:56:52AM -0800, Mike Kravetz wrote:
> On 1/3/20 9:33 AM, Mike Kravetz wrote:
> > On 1/3/20 7:56 AM, Arnd Bergmann wrote:
> >> On Fri, Jan 3, 2020 at 4:45 PM Greg Kroah-Hartman
> >> <gregkh@linuxfoundation.org> wrote:
> >>> On Fri, Jan 03, 2020 at 04:29:56PM +0100, Arnd Bergmann wrote:
> >>>> On Fri, Jan 3, 2020 at 4:25 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >>>>>
> >>>>> On Fri, Jan 3, 2020 at 4:03 PM Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >>>>>>
> >>>>>> On Fri, 3 Jan 2020 at 03:42, Greg Kroah-Hartman
> >>>>>> <gregkh@linuxfoundation.org> wrote:
> >>>>>
> >>>>> -ENOENT is what you get when hugetlbfs is not mounted, so this hints to
> >>>>>
> >>>>> 8fc312b32b2  mm/hugetlbfs: fix error handling when setting up mounts
> >>>>>
> >>>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?h=linux-5.4.y&id=3f549fb42a39bea3b29c0fc12afee53c4a01bec9
> >>>>
> >>>> I see that Mike Kravetz suggested not putting this patch into stable in
> >>>>
> >>>> https://lore.kernel.org/lkml/befca227-cb8a-8f47-617d-e3bf9972bfec@oracle.com/
> >>>>
> >>>> but it was picked through the autosel mechanism later.
> >>>
> >>> So does that mean that Linus's tree shows this LTP failure as well?
> >>
> >> Yes, according to
> >> https://qa-reports.linaro.org/lkft/linux-mainline-oe/tests/ltp-syscalls-tests/memfd_create04
> >> mainline has the same testcase failure, it started happening between
> >> v5.4-10135-gc3bfc5dd73c6 and v5.4-10271-g596cf45cbf6e, when the patch
> >> was originally merged into 5.5-rc1.
> >>
> >>> This does seem to fix a real issue, as shown by the LTP test noticing
> >>> it, so should the error code value be fixed in Linus's tree?
> >>
> >> No idea what to conclude from the testcase failure, let's see if Mike has
> >> any suggestions.
> >>
> > 
> > Thanks for isolating to this patch!
> > 
> > There are dependencies between arch specific code and arch independent code
> > during the setup of hugetlb sizes/mounts.  Let me take a closer look at the
> > arm64 code and get access to a system for debug.
> 
> Before I started investigating, Jan Stancek found and fixed the issue.
> 
> http://lkml.kernel.org/r/a14b944b6e5e207d2f84f43227c98ed1f68290a2.1578072927.git.jstancek@redhat.com

Great, thanks for this, now queued up.

greg k-h

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
