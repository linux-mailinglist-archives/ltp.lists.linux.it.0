Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE660894ED
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2019 01:46:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7E9493C1D26
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2019 01:46:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 068513C13DB
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 01:46:19 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id F18F710009F2
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 01:46:12 +0200 (CEST)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 79CB52084D;
 Sun, 11 Aug 2019 23:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565567176;
 bh=hxZGXq+1QClkJfpjPXEQ6VhU1iaPfgemO6jldgiK4ig=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MprxUavY8cQ6/cK9n6f1O0oHgjE9X38sSHpyXM3LvHswaNqflKU9ROrO5pDwSRbEk
 yAG/II7kSV3UVtPsliGyxkWlwMFGyTM4FcFFi2CkTMAI+HNoOsQwAmKvCqdn41gf+b
 clMk2UeA9ioWkiLaJJpl4S0Sa7srBhLMO2ljV9K8=
Date: Sun, 11 Aug 2019 19:46:14 -0400
From: Sasha Levin <sashal@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20190811234614.GZ17747@sasha-vm>
References: <20190808000533.7701-1-mike.kravetz@oracle.com>
 <20190808074607.GI11812@dhcp22.suse.cz>
 <20190808074736.GJ11812@dhcp22.suse.cz>
 <416ee59e-9ae8-f72d-1b26-4d3d31501330@oracle.com>
 <20190808185313.GG18351@dhcp22.suse.cz>
 <20190808163928.118f8da4f4289f7c51b8ffd4@linux-foundation.org>
 <20190809064633.GK18351@dhcp22.suse.cz>
 <20190809151718.d285cd1f6d0f1cf02cb93dc8@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809151718.d285cd1f6d0f1cf02cb93dc8@linux-foundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
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
 Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>, ltp@lists.linux.it,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Aug 09, 2019 at 03:17:18PM -0700, Andrew Morton wrote:
>On Fri, 9 Aug 2019 08:46:33 +0200 Michal Hocko <mhocko@kernel.org> wrote:
>
>> > Maybe we should introduce the Fixes-no-stable: tag.  That should get
>> > their attention.
>>
>> No please, Fixes shouldn't be really tight to any stable tree rules. It
>> is a very useful indication of which commit has introduced bug/problem
>> or whatever that the patch follows up to. We in Suse are using this tag
>> to evaluate potential fixes as the stable is not reliable. We could live
>> with Fixes-no-stable or whatever other name but does it really makes
>> sense to complicate the existing state when stable maintainers are doing
>> whatever they want anyway? Does a tag like that force AI from selecting
>> a patch? I am not really convinced.
>
>It should work if we ask stable trees maintainers not to backport
>such patches.
>
>Sasha, please don't backport patches which are marked Fixes-no-stable:
>and which lack a cc:stable tag.

I'll add it to my filter, thank you!

--
Thanks,
Sasha

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
