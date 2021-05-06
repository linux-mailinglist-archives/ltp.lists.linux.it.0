Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DA93752FB
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 13:23:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5B6963C5758
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 13:23:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 59E573C19D6
 for <ltp@lists.linux.it>; Thu,  6 May 2021 13:23:42 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 91C0E600F4B
 for <ltp@lists.linux.it>; Thu,  6 May 2021 13:23:40 +0200 (CEST)
Received: from dggeml708-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FbWNm3xcqzYhZX
 for <ltp@lists.linux.it>; Thu,  6 May 2021 19:21:12 +0800 (CST)
Received: from dggeml753-chm.china.huawei.com (10.1.199.152) by
 dggeml708-chm.china.huawei.com (10.3.17.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 6 May 2021 19:23:35 +0800
Received: from dggeml753-chm.china.huawei.com ([10.1.199.152]) by
 dggeml753-chm.china.huawei.com ([10.1.199.152]) with mapi id 15.01.2176.012;
 Thu, 6 May 2021 19:23:35 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP] [PATCH 2/4] syscalls/modify_ldt: Replace TINFO with TPASS
 or TFAIL
Thread-Index: AddCaKa/4EoYP0EUQh+J8X0sYZhmyAAAOfFQ
Date: Thu, 6 May 2021 11:23:35 +0000
Message-ID: <0c99f4553e894db4bfc8bd3141e092d8@huawei.com>
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
Subject: Re: [LTP] [PATCH 2/4] syscalls/modify_ldt: Replace TINFO with TPASS
 or TFAIL
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

Hi,

I have reviewed the patch for some time, but I have not find the possible reason of it. Theoretically the patch didn't change the logic.

Because I have not the i386 machine, so I can't run it.

Best Regards,
Gongyi

> 
> Hi Petr,
> 
> Before my MR merged, the test case would not eixt a nozero value, is it
> the root cause of the problem?
> 
> >
> > Hi Zhao, Cyril,
> >
> > > diff --git a/testcases/kernel/syscalls/modify_ldt/modify_ldt01.c
> > b/testcases/kernel/syscalls/modify_ldt/modify_ldt01.c
> > ...
> > > @@ -149,15 +132,13 @@ int main(int ac, char **av)
> > >  		(void)waitpid(pid, &status, 0);
> >
> > >  		if (WEXITSTATUS(status) != 0) {
> > > -			flag = FAILED;
> > >  			tst_resm(TFAIL, "Did not generate SEGV, child returned "
> > >  				 "unexpected status");
> > > -		}
> > > -
> > > -		if (flag) {
> > > -			tst_resm(TINFO, "block 2 FAILED");
> > >  		} else {
> > > -			tst_resm(TINFO, "block 2 PASSED");
> > > +			if (WIFSIGNALED(status) && (WTERMSIG(status) ==
> SIGSEGV))
> > > +				tst_resm(TPASS, "generate SEGV as expected");
> > > +			else
> > > +				tst_resm(TFAIL, "Did not generate SEGV");
> > FYI: since merging this patch (f5e8e6b11) test fails on this. Is it
> expected?
> > I haven't looked closer whether it's a test bug or real issue.
> >
> > Kind regards,
> > Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
