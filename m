Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C72BA86DF2
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Aug 2019 01:39:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2C26B3C1D73
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Aug 2019 01:39:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 9B0233C1808
 for <ltp@lists.linux.it>; Fri,  9 Aug 2019 01:39:33 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B39F4601F15
 for <ltp@lists.linux.it>; Fri,  9 Aug 2019 01:39:32 +0200 (CEST)
Received: from localhost.localdomain (c-73-223-200-170.hsd1.ca.comcast.net
 [73.223.200.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 555262173E;
 Thu,  8 Aug 2019 23:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565307569;
 bh=DkAAejaivtf5zjkmcresyTQ54IwUXOKSGkqOhqPx9q8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=c5T+9+7pTiq+M8+tRJnzWxAdk5YAAoix4royPR9zIimI3fX2zFgoXWpW/NMtliOdE
 HiW9bJP2T3sY3hkPDdPCAiM0fDFC70VcHJa0tzJi7i4wi5fW6XgFKvPqJNQ4Rpij5r
 Vj8g+vFbWO3xkgW88RwCDFXw9p4DZOq4QsHt+1PU=
Date: Thu, 8 Aug 2019 16:39:28 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Michal Hocko <mhocko@kernel.org>
Message-Id: <20190808163928.118f8da4f4289f7c51b8ffd4@linux-foundation.org>
In-Reply-To: <20190808185313.GG18351@dhcp22.suse.cz>
References: <20190808000533.7701-1-mike.kravetz@oracle.com>
 <20190808074607.GI11812@dhcp22.suse.cz>
 <20190808074736.GJ11812@dhcp22.suse.cz>
 <416ee59e-9ae8-f72d-1b26-4d3d31501330@oracle.com>
 <20190808185313.GG18351@dhcp22.suse.cz>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] hugetlbfs: fix hugetlb page migration/fault race
 causing SIGBUS
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
Cc: xishi.qiuxishi@alibaba-inc.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>,
 ltp@lists.linux.it, Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, 8 Aug 2019 20:53:13 +0200 Michal Hocko <mhocko@kernel.org> wrote:

> > https://lkml.org/lkml/2019/6/1/165
> > 
> > Ironic to find that commit message in a stable backport.
> > 
> > I'm happy to drop the Fixes tag.
> 
> No, please do not drop the Fixes tag. That is a very _useful_
> information. If the stable tree maintainers want to abuse it so be it.
> They are responsible for their tree. If you do not think this is a
> stable material then fine with me. I tend to agree but that doesn't mean
> that we should obfuscate Fixes.

Well, we're responsible for stable trees too.  And yes, I find it
irksome.  I/we evaluate *every* fix for -stable inclusion and if I/we
decide "no" then dangit, it should be backported.

Maybe we should introduce the Fixes-no-stable: tag.  That should get
their attention.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
