Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 778BB35668B
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Apr 2021 10:22:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 46A283C1DF7
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Apr 2021 10:22:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 229EA3C1DDA
 for <ltp@lists.linux.it>; Wed,  7 Apr 2021 10:22:03 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E75FB200A10
 for <ltp@lists.linux.it>; Wed,  7 Apr 2021 10:22:01 +0200 (CEST)
Received: from dggeml405-hub.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FFcjC56cczWV1F
 for <ltp@lists.linux.it>; Wed,  7 Apr 2021 16:18:23 +0800 (CST)
Received: from DGGEML511-MBS.china.huawei.com ([169.254.4.237]) by
 dggeml405-hub.china.huawei.com ([10.3.17.49]) with mapi id 14.03.0513.000;
 Wed, 7 Apr 2021 16:21:43 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP] [PATCH] syscalls/getdtablesize01: Add abnormal handling
Thread-Index: AdcrhhJoGwfPCDV+SJWKcOAg/dsBqw==
Date: Wed, 7 Apr 2021 08:21:43 +0000
Message-ID: <F3D3F6AC3820BB4C9FCA340DB5C32CB4038A8DA8@dggeml511-mbs.china.huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.110.209]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/getdtablesize01: Add abnormal handling
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

Thanks for your review!

I have resubmit the patch and rewrite the getdtablesize01.c with new api.

See https://patchwork.ozlabs.org/project/ltp/patch/20210407081415.8353-1-zhaogongyi@huawei.com/

Thanks!

Best Regards,
Gongyi

> 
> Hi,
> 
> > When /etc/hosts is not exist, test would fail, actually, we chould
> > skip the the problem to improve maintainability.
> 
> ...
> > +++ b/testcases/kernel/syscalls/getdtablesize/getdtablesize01.c
> > @@ -100,6 +100,8 @@ int main(void)
> >  		tst_resm(TPASS, "%d = %d", count, (max_val_opfiles - 1));
> >  	else if (fd < 0 && errno == ENFILE)
> >  		tst_brkm(TCONF, cleanup, "Reached maximum number of open
> files for
> > the system");
> > +	else if (fd == 0)
> > +		tst_brkm(TCONF, cleanup, "Maybe /etc/hosts is not exist");
> >  	else
> >  		tst_resm(TFAIL, "%d != %d", count, (max_val_opfiles - 1));
> 
> Why not to test for existence of the file in main(), where is file being
> opened?
> 
> 	fd = open("/etc/hosts", O_RDONLY);
> 
> Also current patch does not work when I test on system without
> /etc/hosts:
> 
> ./getdtablesize01
> getdtablesize01    0  TINFO  :  Maximum number of files a process can
> have opened is 1024
> getdtablesize01    0  TINFO  :  Checking with the value returned by
> getrlimit...RLIMIT_NOFILE
> getdtablesize01    1  TPASS  :  got correct dtablesize, value is 1024
> getdtablesize01    0  TINFO  :  Checking Max num of files that can be
> opened by a process.Should be: RLIMIT_NOFILE - 1
> getdtablesize01    2  TFAIL  :  getdtablesize01.c:106: 0 != 1023
> 
> Besides, it'd help to also rewrite the test to the new API.
> 
> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
