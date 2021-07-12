Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7F73C45D8
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 09:29:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 24BFB3C6742
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 09:29:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3D50B3C1B32
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 09:29:31 +0200 (CEST)
Received: from ATCSQR.andestech.com (exmail.andestech.com [60.248.187.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A532E2009F3
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 09:29:28 +0200 (CEST)
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 16C7Sjs6091456;
 Mon, 12 Jul 2021 15:28:45 +0800 (GMT-8)
 (envelope-from ycliang@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Mon, 12 Jul 2021
 15:28:43 +0800
Date: Mon, 12 Jul 2021 15:28:40 +0800
From: Leo Liang <ycliang@andestech.com>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Message-ID: <20210712072840.GA9612@andestech.com>
References: <20210628033002.GA1469@andestech.com>
 <caf1bb46-5212-3c3d-f180-e722ef2cf8dd@jv-coder.de>
 <YNnJ18Q+cqb8zM5K@yuki> <20210706032748.GA16346@andestech.com>
 <60E3EE1D.2090800@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <60E3EE1D.2090800@fujitsu.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 16C7Sjs6091456
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] cgroup/cgroup_regression_test: Fix umount
 failure
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
Cc: "richiejp@f-m.fm" <richiejp@f-m.fm>,
 "alankao@andestech.com" <alankao@andestech.com>, "metan@ucw.cz" <metan@ucw.cz>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Yang,

On Tue, Jul 06, 2021 at 05:45:32AM +0000, xuyang2018.jy@fujitsu.com wrote:
> Hi Leo
> >
> >> IMO, Even we call sync, this umount may fail because sync ensures
> >> nothing.  Why not use tst_umount?
> >
> > Hi Yang,
> >
> > I think this might be a timing issue and a little delay could fix this problem. (e.g. 'sleep 1')
> > Using 'sync' here IMHO would be more descriptive and has a semantic meaning.
> Yes, it is a timing issue.
> I also met a similar problem because of sync to lead EBUSY error in 
> xfstests log time ago.
> 
> https://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git/commit/?id=b536de2a042484bb241cca120ce55c974309513a
> 
> So, I don't think using sync is a good idea because sync will make 
> metadata into disk but no ensure it. So if we have other io work, then 
> sync may push other's metadata into disk firstly instead of here's data.
> 
> Since we have tst_umount api to avoid EBUSY error, why not to use it in 
> here to avoid your problem?
> >
> > Speaking of tst_umount, do you mean to convert this test to C code ?
> No, we also have shell api  for tst_umount.

Thanks for the suggestion.
I've tested the cgroup_regression_test with the tst_umount api
and it works fine!

I will convert "add sync" patch to this!
Thanks again.

> >
> >> Best Regards
> >> Yang Xu
> >
> > Best regards,
> > Leo

Best regards,
Leo

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
