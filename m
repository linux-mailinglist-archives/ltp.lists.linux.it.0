Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C09E01F1722
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jun 2020 13:01:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 77E543C2E80
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jun 2020 13:01:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id ED8E53C1484
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 13:01:20 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 3A7116011B6
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 13:01:18 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,487,1583164800"; d="scan'208";a="94083858"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 08 Jun 2020 19:01:16 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 51EF950A9975;
 Mon,  8 Jun 2020 19:01:15 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 8 Jun 2020 19:01:18 +0800
To: Petr Vorel <pvorel@suse.cz>
References: <1591083478-5342-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200608101032.GA9222@dell5510>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <9e9b223b-833b-0023-cfc7-7fbe22cb9b45@cn.fujitsu.com>
Date: Mon, 8 Jun 2020 19:01:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200608101032.GA9222@dell5510>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 51EF950A9975.AA6B5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] LIB: Use INTERNAL_LIB for ltp lib
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

Hi Petr


> Hi Xu,
> 
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 
> Cyril concerned 3rd party use of lib/libltp.a, but nobody complained.
> Given Jan acked v1, I'd be also for merge.
> 
  We also should include android_libpthread and android_librt Makefile.

>> Use INTERNAL_LIB for ltp lib because installing these ltp static
>> library in any situation is meaningless.
> 
>> all static library as below:
>> ./libs/libltpuinput/libltpuinput.a
>> ./libs/libltpnewipc/libltpnewipc.a
>> ./libs/libltpnuma/libltpnuma.a
>> ./libs/libltpipc/libltpipc.a
>> ./libs/libltpipc/libltpmsgctl.a
>> ./utils/sctp/lib/libsctp.a
>> ./utils/sctp/testlib/libsctputil.a
>> ./lib/libltp.a
>> ./testcases/network/rpc/basic_tests/rpc01/lib/librpc01.a
>> ./testcases/network/rpc/rpc-tirpc/tests_pack/lib/librpc-tirpc.a
>> ./testcases/kernel/containers/libclone/libclone.a
>> ./testcases/kernel/mem/hugetlb/lib/libhugetlb.a
>> ./testcases/kernel/mem/lib/libmem.a
>> ./testcases/kernel/controllers/libcontrollers/libcontrollers.a
>> ./testcases/kernel/controllers/cpuset/cpuset_lib/libcpu_set.a
>> ./testcases/kernel/lib/libkerntest.a
> nit: I'd remove './' from commit message.
> 
> Kind regards,
> Petr
> 
>> Also include Android_libpthread and android_librt and remove useless
>> libdir variable.
> 
>> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
>> ---
>> v1->v2:
>> 1.remove ./testcases/commands/nm/datafiles/lib.a from commit message
>> 2.add two anroid Makefiles
>> 3.remove useless libdir
> FYI I'm still having in my mind trying dynamic library linking.
> But if I ever do it I'll just re-add this variable.
Yes, for now, this variable is meaningless unless using dynamic libraries.

Best Regards
Yang Xu
> 
> Kind regards,
> Petr
> 
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
