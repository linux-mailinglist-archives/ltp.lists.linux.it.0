Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF20184006
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 05:31:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4DDD83C5EB4
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 05:31:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 35FCE3C05ED
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 05:31:47 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 9C8AA1002756
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 05:31:44 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,546,1574092800"; d="scan'208";a="86253892"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 Mar 2020 12:31:41 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 1663850A9975;
 Fri, 13 Mar 2020 12:21:40 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Fri, 13 Mar 2020 12:31:40 +0800
To: Cyril Hrubis <chrubis@suse.cz>, Martin Doucha <mdoucha@suse.cz>
References: <20200224100932.10349-1-mdoucha@suse.cz>
 <20200226135748.GD24080@rei> <0d875613-07a4-b9fe-9c83-76c2e403d6dc@suse.cz>
 <20200227141356.GA29089@rei>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <f3cbdd28-e89c-02e1-7f4b-0b62278b6edb@cn.fujitsu.com>
Date: Fri, 13 Mar 2020 12:31:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200227141356.GA29089@rei>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 1663850A9975.AC562
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5] Add test for misaligned fallocate()
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

Hi Cyril, Martin

When I test this case by using btrfs, this case failed as below:

fallocate06.c:174: CONF: File system does not support copy-on-write
tst_test.c:1290: INFO: Testing on btrfs
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with btrfs opts='' extra opts=''
tst_test.c:1229: INFO: Timeout per run is 0h 05m 00s
fallocate06.c:117: INFO: Copy-on-write is supported
fallocate06.c:168: INFO: Case 1. Fill FS: no; Use copy on write: no
fallocate06.c:157: PASS: write() successful
fallocate06.c:201: PASS: Misaligned allocation works as expected
fallocate06.c:157: PASS: fallocate(FALLOC_FL_PUNCH_HOLE | 
FALLOC_FL_KEEP_SIZE) successful
fallocate06.c:237: PASS: fallocate(FALLOC_FL_PUNCH_HOLE | 
FALLOC_FL_KEEP_SIZE) cleared the correct file range
fallocate06.c:168: INFO: Case 2. Fill FS: yes; Use copy on write: no
tst_fill_fs.c:32: INFO: Creating file mntpoint/file0 size 21710183
tst_fill_fs.c:32: INFO: Creating file mntpoint/file1 size 8070086
tst_fill_fs.c:32: INFO: Creating file mntpoint/file2 size 3971177
tst_fill_fs.c:32: INFO: Creating file mntpoint/file3 size 36915315
tst_fill_fs.c:32: INFO: Creating file mntpoint/file4 size 70310993
tst_fill_fs.c:32: INFO: Creating file mntpoint/file5 size 4807935
tst_fill_fs.c:32: INFO: Creating file mntpoint/file6 size 90739786
tst_fill_fs.c:32: INFO: Creating file mntpoint/file7 size 76896492
tst_fill_fs.c:32: INFO: Creating file mntpoint/file8 size 72228649
tst_fill_fs.c:32: INFO: Creating file mntpoint/file9 size 36207821
tst_fill_fs.c:32: INFO: Creating file mntpoint/file10 size 81483962
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fallocate06.c:157: PASS: write() successful
fallocate06.c:201: PASS: Misaligned allocation works as expected
fallocate06.c:146: FAIL: fallocate(FALLOC_FL_PUNCH_HOLE | 
FALLOC_FL_KEEP_SIZE) failed unexpectedly: ENOSPC (28)

It failed when we fill fs and not using cow. Is it a known issue(I see 
the previous eamils, but found nothing)?
I also used 5.6-rc3 kernel to test, it still failed.

Best Regards
Yang Xu

> Hi!
>>> Are the failures on xfs fixed by now?
>>>
>>> Do we have a upstrem kernel commit we can add to the test as a tag?
>>>
>>
>> Anthony Iliopoulos says in the BSC that the upstream fix is
>> commit e093c4be760e ("xfs: Fix tail rounding in xfs_alloc_file_space()")
> 
> I've added this as a tag and commend and also added a .gitignore entry
> and pushed. Thanks.
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
