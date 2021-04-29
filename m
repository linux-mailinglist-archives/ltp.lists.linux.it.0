Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B73536EB1B
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 15:05:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 857C33C19C3
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 15:05:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AF3113C19C3
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 15:05:33 +0200 (CEST)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 86C5B60102D
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 15:05:31 +0200 (CEST)
Received: from dggeml756-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4FWFxh1Vfvz19Hn0
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 21:01:28 +0800 (CST)
Received: from dggeml753-chm.china.huawei.com (10.1.199.152) by
 dggeml756-chm.china.huawei.com (10.1.199.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 29 Apr 2021 21:05:26 +0800
Received: from dggeml753-chm.china.huawei.com ([10.1.199.152]) by
 dggeml753-chm.china.huawei.com ([10.1.199.152]) with mapi id 15.01.2176.012;
 Thu, 29 Apr 2021 21:05:26 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH] ttype: Replase TINFO with TPASS or TFAIL
Thread-Index: Adc89tnAI5llxpgnRzqxEsEovYQQNw==
Date: Thu, 29 Apr 2021 13:05:26 +0000
Message-ID: <7acd6d963f8b478e83f10fea1f27bb75@huawei.com>
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
Subject: Re: [LTP] [PATCH] ttype: Replase TINFO with TPASS or TFAIL
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

Hi Cyril,

I have split the commit to 4 separate commits and resubmit according your review. 

Pleas see:
https://patchwork.ozlabs.org/project/ltp/patch/20210429125322.31559-1-zhaogongyi@huawei.com/
https://patchwork.ozlabs.org/project/ltp/patch/20210429125255.31510-1-zhaogongyi@huawei.com/
https://patchwork.ozlabs.org/project/ltp/patch/20210429125237.31461-1-zhaogongyi@huawei.com/
https://patchwork.ozlabs.org/project/ltp/patch/20210429125220.31412-1-zhaogongyi@huawei.com/

And for the files fcntl19.c/fcntl20.c/fcntl21.c, there are some difficult problems to cleanup, it would be fixed in latter patches.


Thanks so much!

Best Regards,
Gongyi


> Hi!
> > diff --git a/testcases/kernel/syscalls/fcntl/fcntl16.c
> > b/testcases/kernel/syscalls/fcntl/fcntl16.c
> > index a77a81298..f12474f79 100644
> > --- a/testcases/kernel/syscalls/fcntl/fcntl16.c
> > +++ b/testcases/kernel/syscalls/fcntl/fcntl16.c
> > @@ -673,10 +673,10 @@ int main(int ac, char **av)
> >  		 */
> >  		tst_resm(TINFO, "Entering block 1");
> >  		if (run_test(O_CREAT | O_RDWR | O_TRUNC, 0777, 0, 11)) {
> > -			tst_resm(TINFO, "Test case 1: without mandatory "
> > +			tst_resm(TFAIL, "Test case 1: without mandatory "
> >  				 "locking FAILED");
> >  		} else {
> > -			tst_resm(TINFO, "Test case 1: without manadatory "
> > +			tst_resm(TPASS, "Test case 1: without manadatory "
> >  				 "locking PASSED");
> >  		}
> 
> I would be happier if we fixed the run_test() function to report
> TFAIL/TPASS in all cases and just called run_test() from the main().
> 
> It shouldn't be even a big change since we report most of the failures
> there, what we need is to change one TINFO into TFAIL and report TPASS at
> the end of the function.
> 
> >  		tst_resm(TINFO, "Exiting block 1");
> 
> Also can we please get rid of the useless entering/exitting block
> messages?
> 
> 
> And the same applies for the rest of the tests changed by this patch.
> 
> --
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
