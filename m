Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D775131DD2
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Jan 2020 04:03:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 415703C24D0
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Jan 2020 04:03:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 4FDAE3C245E
 for <ltp@lists.linux.it>; Tue,  7 Jan 2020 04:03:07 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 8986C1A00CA6
 for <ltp@lists.linux.it>; Tue,  7 Jan 2020 04:03:05 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,404,1571673600"; d="scan'208";a="81416742"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 07 Jan 2020 11:03:04 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 1045749E932C;
 Tue,  7 Jan 2020 10:54:01 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Tue, 7 Jan 2020 11:02:57 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: Cyril Hrubis <chrubis@suse.cz>
References: <20191213125435.GB20795@rei.lan> <20200106150329.GC26880@rei.lan>
 <c3c2588b-edc5-ddeb-eb0d-992041d4ff67@cn.fujitsu.com>
Message-ID: <1317ae5a-5f74-73bc-66fa-0da43793def8@cn.fujitsu.com>
Date: Tue, 7 Jan 2020 11:02:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <c3c2588b-edc5-ddeb-eb0d-992041d4ff67@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 1045749E932C.AF6E0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] LTP Release plans
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



on 2020/01/07 10:03, Yang Xu wrote:
> 
> 
> Hi Cyril
>> Hi!
>> First of all Happy New Year!
>>
>> I'm back at patch review and we are getting close to a pre-release
>> testing freeze.
>>
>> As I stated before I will have a look at he fallocate05 test and the
>> capset/capget patches. Is there anything else that should be part of the
>> release?
>>
>> Looking at the patch queue we should probably include:
>>
>> tst_dev_bytes_written: parsing /proc/diskstats instead of sys file
>> syscalls/userfaultfd01: add hint about unprivileged_userfaultfd
>>
>> Anything else I should look at?
Also. In December-end, pengfei sent a kconfig patch set to support 
CONFIG_X86_INTEL_UMIP|CONFIG_X86_UMIP=y. CONFIG_X86_INTEL_UMIP=y for 
umip kconfig before and v5.4  mainline kernel. CONFIG_X86_UMIP=y for 
umip kconfig after v5.5 mainline kernel. I think we can include this 
patchset before release if it is ok.

url:
http://lists.linux.it/pipermail/ltp/2019-December/014841.html
> Yes. I also sent a pipe test[1]to ltp(it has undefined F_GETPIPE_SZ 
> error on old kernel [2]and I will fix it in v2), as below:
> syscalls/pipe12: add new test for piep when write bytes > PIPE_BUF
> 
> Also, Cypresslin has a pull[3] about syscalls/statx05: add mkfs.ext4 
> package version check.
> 
> [1]https://patchwork.ozlabs.org/patch/1215360/
> [2]https://travis-ci.org/xuyang0410/ltp/jobs/629597516?utm_medium=notification&utm_source=github_status 
> 
> [3]https://github.com/linux-test-project/ltp/pull/626
> 
> Best Regards
> Yang Xu
>>
> 
> 
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
