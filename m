Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 190588A979
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2019 23:37:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A05553C1D17
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2019 23:37:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 757C23C0302
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 23:37:36 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5418F1000AC3
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 23:37:29 +0200 (CEST)
Received: from akpm3.svl.corp.google.com (unknown [104.133.8.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 25FB2206C1;
 Mon, 12 Aug 2019 21:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565645852;
 bh=07tJJiA2VR08JnF9uwMOoDCaKsZwYqGb2v9SvApZzMc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=xHPKjAQr8eR3Ys5t2F8n8lhJx/sQg6Qgi3Km8sf0/tf137IyaQhuxWflV6htZbHui
 kpSIg+UULX+BoKkMpAo+Sx8XyPE8Jl/KJ3HJq7Aevp+VoNDiBBFPV+L4dhqxK59Toh
 kUg/XzZ9wWOiMo6oYMgEAxSGz3yUuPiS3S+nDnYg=
Date: Mon, 12 Aug 2019 14:37:31 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sasha Levin <sashal@kernel.org>
Message-Id: <20190812143731.3f46b952e53ff3434e04bcf9@linux-foundation.org>
In-Reply-To: <20190812153326.GB17747@sasha-vm>
References: <20190808074736.GJ11812@dhcp22.suse.cz>
 <416ee59e-9ae8-f72d-1b26-4d3d31501330@oracle.com>
 <20190808185313.GG18351@dhcp22.suse.cz>
 <20190808163928.118f8da4f4289f7c51b8ffd4@linux-foundation.org>
 <20190809064633.GK18351@dhcp22.suse.cz>
 <20190809151718.d285cd1f6d0f1cf02cb93dc8@linux-foundation.org>
 <20190811234614.GZ17747@sasha-vm>
 <20190812084524.GC5117@dhcp22.suse.cz>
 <39b59001-55c1-a98b-75df-3a5dcec74504@suse.cz>
 <20190812132226.GI5117@dhcp22.suse.cz>
 <20190812153326.GB17747@sasha-vm>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Vlastimil Babka <vbabka@suse.cz>, Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>,
 ltp@lists.linux.it, Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, 12 Aug 2019 11:33:26 -0400 Sasha Levin <sashal@kernel.org> wrote:

> >I thought that absence of the Cc is the indication :P. Anyway, I really
> >do not understand why should we bother, really. I have tried to explain
> >that stable maintainers should follow Cc: stable because we bother to
> >consider that part and we are quite good at not forgetting (Thanks
> >Andrew for persistence). Sasha has told me that MM will be blacklisted
> >from automagic selection procedure.
> 
> I'll add mm/ to the ignore list for AUTOSEL patches.

Thanks, I'm OK with that.  I'll undo Fixes-no-stable.

Although I'd prefer that "akpm" was ignored, rather than "./mm/". 
Plenty of "mm" patches don't touch mm/, such as drivers/base/memory.c,
include/linux/blah, fs/, etc.  And I am diligent about considering
-stable for all the other code I look after.

This doesn't mean that I'm correct all the time, by any means - I'd
like to hear about patches which autosel thinks should be backported
but which don't include the c:stable tag.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
