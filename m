Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDB9B88DE
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Sep 2019 03:19:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F24983C2170
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Sep 2019 03:19:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 21CB73C2096
 for <ltp@lists.linux.it>; Fri, 20 Sep 2019 03:19:19 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 44A01601F71
 for <ltp@lists.linux.it>; Fri, 20 Sep 2019 03:19:17 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,526,1559491200"; d="scan'208";a="75740542"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Sep 2019 09:19:13 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 7D7D04CDFCE9;
 Fri, 20 Sep 2019 09:19:10 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Fri, 20 Sep 2019 09:19:10 +0800
To: Petr Vorel <pvorel@suse.cz>
References: <20190919094544.GA21345@rei>
 <1568889488-4032-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190919140931.GA14614@x230>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <02ed63c6-102d-4aeb-39db-b9ea8f561b9c@cn.fujitsu.com>
Date: Fri, 20 Sep 2019 09:19:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20190919140931.GA14614@x230>
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 7D7D04CDFCE9.AECDF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] cgroup_regression_test.sh: Remove obselte
 test_5
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


on 2019/09/19 22:09, Petr Vorel wrote:
> Hi Xu,
> 
>> test_5 is a very old regresstion test and kernel code has been
>> rewritten completely since 2.6. No user will use such old kernel
>> code to test. So I think we can remove it.
> 
>> Also rename test10 as test5, modify TST_CNT.
> 
> Merged, with additional note, why it's safe to remove it:
> 
>      [ pvorel: test_5 is testing 839ec5452ebf ("cgroup: fix root_count when
>      mount fails due to busy subsystem") from v2.6.29-rc4 which fixes
>      e5f6a8609bab ("cgroups: make root_list contains active hierarchies
>      only") from v2.6.24-rc1. While there are still people testing LTP on
>      2.6.x, nobody should be using -rc version now. ]
I think your wrote v2.6.24-rc1 unexpectedly. commit e5f6a8609bab fixes 
the bug since v2.6.29-rc1 not v2.6.24-rc1. In addition to this typo, 
this reason looks good to me.

> 
> Kind regards,
> Petr
> 
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
