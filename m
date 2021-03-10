Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5148D3332F5
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 03:06:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D7D273C6A89
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 03:06:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 4C2A63C4B96
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 03:06:28 +0100 (CET)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 689156011F5
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 03:06:27 +0100 (CET)
Received: from DGGEML403-HUB.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4DwFl118XQzRGmV
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 10:04:45 +0800 (CST)
Received: from DGGEML511-MBS.china.huawei.com ([169.254.4.181]) by
 DGGEML403-HUB.china.huawei.com ([fe80::74d9:c659:fbec:21fa%31]) with mapi id
 14.03.0513.000; Wed, 10 Mar 2021 10:06:15 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP] [PATCH] max_map_count: Add judgment of abnormal situation
Thread-Index: AdcVUecXHCGJW+FXSeOlttle9Fq7MQ==
Date: Wed, 10 Mar 2021 02:06:14 +0000
Message-ID: <F3D3F6AC3820BB4C9FCA340DB5C32CB40389041F@dggeml511-mbs.china.huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.110.209]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] max_map_count: Add judgment of abnormal situation
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

I have resubmit the patch as your review.

Thanks!

Best Regards,
Gongyi

> 
> Hi Gongyi,
> 
> > > > When CommitLimit - Committed_AS < 128, there is no post
> > > > processing, and the test will report "TBROK: Test haven't reported
> results".
> Actually, I have problem for CommitLimit - Committed_AS < 5280
> (depends on actual system).
> 
> But that means that even check for max_iters < 0 is not enough, because
> while (max_maps <= max_iters) block should be run at least once to avoid
> TBROK: Test haven't reported results!
> 
> max_maps is always 1024, thus how about this?
> 
> 	max_maps = MAP_COUNT_DEFAULT;
> +	if (max_iters < max_maps)
> +		tst_brk(TCONF, "test requires more free memory");
> 
> 
> > > You seems to exploring limits. Out of curiosity, which system / hw
> > > do you test?
> 
> > We are testing linux on some different embedded systems whose hw
> resource is limited.
> Thanks for info.
> 
> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
