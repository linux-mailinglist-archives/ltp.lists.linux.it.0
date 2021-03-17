Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A85033EDEF
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 11:05:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 379EC3C2D51
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 11:05:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 3F76D3C2CF7
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 11:05:04 +0100 (CET)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7335B600D1B
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 11:05:03 +0100 (CET)
Received: from dggeml405-hub.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4F0m0Q1554z142x8
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 18:01:58 +0800 (CST)
Received: from DGGEML421-HUB.china.huawei.com (10.1.199.38) by
 dggeml405-hub.china.huawei.com (10.3.17.49) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Wed, 17 Mar 2021 18:04:59 +0800
Received: from DGGEML511-MBS.china.huawei.com ([169.254.4.181]) by
 dggeml421-hub.china.huawei.com ([10.1.199.38]) with mapi id 14.03.0513.000;
 Wed, 17 Mar 2021 18:04:51 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP] [PATCH] cleanup: Unify the annotation style and remove
 Redundant code
Thread-Index: AdcbFLHJq8bTjmxtQfqnnMnh1y23vQ==
Date: Wed, 17 Mar 2021 10:04:48 +0000
Message-ID: <F3D3F6AC3820BB4C9FCA340DB5C32CB403892885@dggeml511-mbs.china.huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.110.209]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cleanup: Unify the annotation style and remove
 Redundant code
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
> HI Gongyi,
> 
> > Change 'Description' to 'DESCRIPTION' and change 'Algorithm' to
> > 'ALGORITHM' and remove Redundant tst_reap_children since
> > tst_reap_children has been called in the test skeleton.
> 
> Actually the preferred form is Description (only first letter capitalized), see
> f5a269142 ("docparse: Unify Description and Algorithm titles").
> (Better would be to also update it in tests, which I haven't done).
> 
> Thus I'd be for merging only removing tst_reap_children() (good catch).
> 
> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
