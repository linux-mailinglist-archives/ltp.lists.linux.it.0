Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 698293752E1
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 13:15:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E35243C56D8
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 13:15:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 75FC23C56ED
 for <ltp@lists.linux.it>; Thu,  6 May 2021 13:15:29 +0200 (CEST)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3C7A3601635
 for <ltp@lists.linux.it>; Thu,  6 May 2021 13:15:28 +0200 (CEST)
Received: from dggeml705-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4FbWBJ2NZxz5yCv
 for <ltp@lists.linux.it>; Thu,  6 May 2021 19:12:08 +0800 (CST)
Received: from dggeml753-chm.china.huawei.com (10.1.199.152) by
 dggeml705-chm.china.huawei.com (10.3.17.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 6 May 2021 19:15:24 +0800
Received: from dggeml753-chm.china.huawei.com ([10.1.199.152]) by
 dggeml753-chm.china.huawei.com ([10.1.199.152]) with mapi id 15.01.2176.012;
 Thu, 6 May 2021 19:15:23 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP] [PATCH 2/4] syscalls/modify_ldt: Replace TINFO with TPASS
 or TFAIL
Thread-Index: AddCaKa/4h/kEFduAk+t6gp3EWmZgg==
Date: Thu, 6 May 2021 11:15:23 +0000
Message-ID: <de4753117e194231bc2d5c0b0762b5c1@huawei.com>
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

Hi Petr,

Before my MR merged, the test case would not eixt a nozero value, is it the root cause of the problem?

> 
> Hi Zhao, Cyril,
> 
> > diff --git a/testcases/kernel/syscalls/modify_ldt/modify_ldt01.c
> b/testcases/kernel/syscalls/modify_ldt/modify_ldt01.c
> ...
> > @@ -149,15 +132,13 @@ int main(int ac, char **av)
> >  		(void)waitpid(pid, &status, 0);
> 
> >  		if (WEXITSTATUS(status) != 0) {
> > -			flag = FAILED;
> >  			tst_resm(TFAIL, "Did not generate SEGV, child returned "
> >  				 "unexpected status");
> > -		}
> > -
> > -		if (flag) {
> > -			tst_resm(TINFO, "block 2 FAILED");
> >  		} else {
> > -			tst_resm(TINFO, "block 2 PASSED");
> > +			if (WIFSIGNALED(status) && (WTERMSIG(status) == SIGSEGV))
> > +				tst_resm(TPASS, "generate SEGV as expected");
> > +			else
> > +				tst_resm(TFAIL, "Did not generate SEGV");
> FYI: since merging this patch (f5e8e6b11) test fails on this. Is it expected?
> I haven't looked closer whether it's a test bug or real issue.
> 
> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
