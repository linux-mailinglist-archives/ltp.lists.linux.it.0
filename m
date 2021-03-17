Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D85E733E8AD
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 06:03:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EF0493C642F
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 06:03:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id EE2563C2DB2
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 06:03:00 +0100 (CET)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id EF31D20093D
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 06:02:59 +0100 (CET)
Received: from DGGEML401-HUB.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4F0dKB0wCMz5d3j
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 13:01:02 +0800 (CST)
Received: from DGGEML511-MBS.china.huawei.com ([169.254.4.181]) by
 DGGEML401-HUB.china.huawei.com ([fe80::89ed:853e:30a9:2a79%31]) with mapi id
 14.03.0513.000; Wed, 17 Mar 2021 13:02:46 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH] runtest/syscalls: Add testcases to test list
Thread-Index: Adca6kIci9qPmqu5TYeVI2l7XCBDSA==
Date: Wed, 17 Mar 2021 05:02:46 +0000
Message-ID: <F3D3F6AC3820BB4C9FCA340DB5C32CB4038927DB@dggeml511-mbs.china.huawei.com>
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
Subject: Re: [LTP] [PATCH] runtest/syscalls: Add testcases to test list
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

I have resubmit the patch according your review. The problem of test case mem03.c and mmap10.c may be fixed in later work.

Thanks so much!

Best Regards,
Gongyi

> 
> Hi!
> > Add syscall test cases to test list.
> 
> I've looked at the tests the brk02 and get_mempolicy02 should have been
> added to syscalls, this was a mistake that needs to be fixed ASAP.
> 
> As for the mem03.c the test is in a wrong place and should be moved and
> reviewed first. It looks like it should be, at least, moved to the
> syscalls/mmap/ directory and renamed to mmapXX.c
> 
> And similarily mmap10.c needs review and cleanup, it does not even print
> pass/fail report at the end.
> 
> --
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
