Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BAF131D67
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Jan 2020 03:04:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 59D743C24A0
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Jan 2020 03:04:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 494593C1824
 for <ltp@lists.linux.it>; Tue,  7 Jan 2020 03:04:00 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 8B06C10009B5
 for <ltp@lists.linux.it>; Tue,  7 Jan 2020 03:03:57 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,404,1571673600"; d="scan'208";a="81410250"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 07 Jan 2020 10:03:53 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 72C6D406AB15;
 Tue,  7 Jan 2020 09:54:50 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Tue, 7 Jan 2020 10:03:47 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <20191213125435.GB20795@rei.lan> <20200106150329.GC26880@rei.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <c3c2588b-edc5-ddeb-eb0d-992041d4ff67@cn.fujitsu.com>
Date: Tue, 7 Jan 2020 10:03:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200106150329.GC26880@rei.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 72C6D406AB15.ACA90
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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



Hi Cyril
> Hi!
> First of all Happy New Year!
> 
> I'm back at patch review and we are getting close to a pre-release
> testing freeze.
> 
> As I stated before I will have a look at he fallocate05 test and the
> capset/capget patches. Is there anything else that should be part of the
> release?
> 
> Looking at the patch queue we should probably include:
> 
> tst_dev_bytes_written: parsing /proc/diskstats instead of sys file
> syscalls/userfaultfd01: add hint about unprivileged_userfaultfd
> 
> Anything else I should look at?
Yes. I also sent a pipe test[1]to ltp(it has undefined F_GETPIPE_SZ 
error on old kernel [2]and I will fix it in v2), as below:
syscalls/pipe12: add new test for piep when write bytes > PIPE_BUF

Also, Cypresslin has a pull[3] about syscalls/statx05: add mkfs.ext4 
package version check.

[1]https://patchwork.ozlabs.org/patch/1215360/
[2]https://travis-ci.org/xuyang0410/ltp/jobs/629597516?utm_medium=notification&utm_source=github_status
[3]https://github.com/linux-test-project/ltp/pull/626

Best Regards
Yang Xu
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
