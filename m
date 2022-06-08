Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8A25420D1
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jun 2022 05:24:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4FD6D3C8F91
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jun 2022 05:24:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C29D03C06E0
 for <ltp@lists.linux.it>; Wed,  8 Jun 2022 05:24:20 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id AC62F1A0099F
 for <ltp@lists.linux.it>; Wed,  8 Jun 2022 05:24:19 +0200 (CEST)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LHswg5vz6zggBH
 for <ltp@lists.linux.it>; Wed,  8 Jun 2022 11:22:27 +0800 (CST)
Received: from canpemm500005.china.huawei.com (7.192.104.229) by
 canpemm500007.china.huawei.com (7.192.104.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 8 Jun 2022 11:24:16 +0800
Received: from canpemm500005.china.huawei.com ([7.192.104.229]) by
 canpemm500005.china.huawei.com ([7.192.104.229]) with mapi id 15.01.2375.024; 
 Wed, 8 Jun 2022 11:24:16 +0800
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH v2] futex_waitv01: Add test verifies EAGIN/ETIMEDOUT
Thread-Index: Adh65u1rTXI+2i4lhkyiAcYtsL6TFw==
Date: Wed, 8 Jun 2022 03:24:16 +0000
Message-ID: <731d89efc64e4444be65dc6fe860e346@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.110.209]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] futex_waitv01: Add test verifies
 EAGIN/ETIMEDOUT
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
From: zhaogongyi via ltp <ltp@lists.linux.it>
Reply-To: zhaogongyi <zhaogongyi@huawei.com>
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

I have submit a new patch according your review, please see: https://patchwork.ozlabs.org/project/ltp/patch/20220608031953.152525-1-zhaogongyi@huawei.com/

Thanks for your review!

Best wishes,
Gongyi

> 
> Hi!
> > +static void test_mismatch_between_uaddr_and_val(void)
> > +{
> > +	struct timespec to;
> > +
> > +	waitv->uaddr = (uintptr_t)futex;
> > +	waitv->flags = FUTEX_32 | FUTEX_PRIVATE_FLAG;
> > +	waitv->val = 1;
> > +
> > +	init_timeout(&to);
> > +
> > +	TST_EXP_FAIL(futex_waitv(waitv, 1, 0, &to, CLOCK_MONOTONIC),
> EAGAIN,
> > +			"futex_waitv mismatch between value of uaddr and val");
> 
> The init_timeout(&to) inits the timeout with CLOCK_REALTIME time, so we
> should pass CLOCK_REALTIME to the futex_waitv() as well.
> 
> > +}
> > +
> > +static void test_timeout(void)
> > +{
> > +	struct timespec to;
> > +
> > +	waitv->uaddr = (uintptr_t)futex;
> > +	waitv->flags = FUTEX_32 | FUTEX_PRIVATE_FLAG;
> > +	waitv->val = 0;
> > +
> > +	init_timeout(&to);
> 
> I guess that we can as well just do:
> 
> SAFE_CLOCK_GETTIME(CLOCK_REALTIME, &to);
> 
> Which would make the test much faster as we will not have to wait for one
> second for the timeout.
> 
> Eventually we can as well add a few miliseconds to the timeout, we do
> have a nice functions to work with different time structures in this case we
> can just do:
> 
> 	to = tst_timespec_add_us(to, 10000);
> 
> To add 10ms to the timeout.
> 
> > +	TST_EXP_FAIL(futex_waitv(waitv, 1, 0, &to, CLOCK_REALTIME),
> ETIMEDOUT,
> > +			"futex_waitv timeout");
> > +
> > +}
> > +
> >  static void cleanup(void)
> >  {
> >  	free(futex);
> > @@ -126,6 +154,8 @@ static void run(void)
> >  	test_null_waiters();
> >  	test_invalid_clockid();
> >  	test_invalid_nr_futexes();
> > +	test_mismatch_between_uaddr_and_val();
> > +	test_timeout();
> >  }
> >
> >  static struct tst_test test = {
> > --
> > 2.17.1
> >
> >
> > --
> > Mailing list info: https://lists.linux.it/listinfo/ltp
> 
> --
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
