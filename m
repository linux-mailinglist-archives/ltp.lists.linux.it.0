Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A05332668
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 14:17:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 24C723C6A94
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 14:17:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 5C05F3C0BAF
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 14:17:31 +0100 (CET)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id AB7AB6003CB
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 14:17:28 +0100 (CET)
Received: from DGGEML404-HUB.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Dvwgh6kyVzYHF7
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 21:15:44 +0800 (CST)
Received: from DGGEML511-MBS.china.huawei.com ([169.254.4.181]) by
 DGGEML404-HUB.china.huawei.com ([fe80::b177:a243:7a69:5ab8%31]) with mapi id
 14.03.0513.000; Tue, 9 Mar 2021 21:17:13 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP] [PATCH] max_map_count: Add judgment of abnormal situation
Thread-Index: AdcU5W2jpsunhk5+QIyDA/V+vZEQ1g==
Date: Tue, 9 Mar 2021 13:17:12 +0000
Message-ID: <F3D3F6AC3820BB4C9FCA340DB5C32CB4038900ED@dggeml511-mbs.china.huawei.com>
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

Hi petr,

> 
> Hi,
> 
> > When CommitLimit - Committed_AS < 128, there is no post processing,
> > and the test will report "TBROK: Test haven't reported results".
> 
> > Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
> > ---
> >  testcases/kernel/mem/tunable/max_map_count.c | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> > diff --git a/testcases/kernel/mem/tunable/max_map_count.c
> > b/testcases/kernel/mem/tunable/max_map_count.c
> > index aa70fde59..ffc53cbb5 100644
> > --- a/testcases/kernel/mem/tunable/max_map_count.c
> > +++ b/testcases/kernel/mem/tunable/max_map_count.c
> > @@ -162,6 +162,8 @@ static void max_map_count_test(void)
> >  	max_iters = memfree / sysconf(_SC_PAGESIZE) * 1024 - 64;
> >  	if (max_iters > MAX_MAP_COUNT)
> >  		max_iters = MAX_MAP_COUNT;
> > +	if (max_iters < 0)
> > +		tst_brk(TCONF, "Test nees max_iters > 0, test skipped");
> typo: nees => needs (no need to repost, can be changed during merge).
> 
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 
> You seems to exploring limits. Out of curiosity, which system / hw do you
> test?

We are testing linux on some different embedded systems whose hw resource is limited. 

Thanks for your review!

Best Regards,
Gongyi

> Kind regards,
> Petr
> 
> >  	max_maps = MAP_COUNT_DEFAULT;
> >  	while (max_maps <= max_iters) {

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
