Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E71DC7A321
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jul 2019 10:31:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A71533C1D4A
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jul 2019 10:31:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id CBCE93C1D1C
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 10:31:44 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 34A45140148E
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 10:31:42 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,326,1559491200"; d="scan'208";a="72514075"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 30 Jul 2019 16:31:39 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id B60774B4041E;
 Tue, 30 Jul 2019 16:31:40 +0800 (CST)
Received: from [10.167.215.46] (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Tue, 30 Jul 2019 16:31:35 +0800
Message-ID: <5D400066.2090204@cn.fujitsu.com>
Date: Tue, 30 Jul 2019 16:31:34 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <5D30200B.4050306@cn.fujitsu.com>
 <1564030915-3211-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1564030915-3211-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190729140043.GB31077@dell5510> <20190729141011.GA1965@dell5510>
In-Reply-To: <20190729141011.GA1965@dell5510>
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: B60774B4041E.AA4B0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 2/3] syscalls/copy_file_range01: add
 cross-device test
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


> Hi,
>
>>> Amir has relaxed cross-device constraint since commit[1], I think we can test it in
>>> copy_file_range01.
>>> [1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5dae222a5
>>> Signed-off-by: Yang Xu<xuyang2018.jy@cn.fujitsu.com>
>>> Reviewed-by: Amir Goldstein<amir73il@gmail.com>
>> Now sent to the correct patchset version:
>> Whole patchset LGTM, but here we got quite a lot of failures after increasing
>> test coverage with .all_filesystems = 1 (which use should be noted in commit
>> message):
>> copy_file_range02.c:120: FAIL: copy_file_range failed unexpectedly; expected EOVERFLOW, but got: EINVAL
>> copy_file_range02.c:126: FAIL: copy_file_range returned wrong value: 16
>> ...
>> copy_file_range02.c:126: FAIL: copy_file_range returned wrong value: 16
Hi Petr
can you give more information? such as distros, filesystem, envrionment,  do you get 16(EBUSY) on all filesystems?
Because on my machine, I get the following result on 4.18.0-80.el8.x86_64(I test on vfat, extN,xfs,btrfs).

copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EISDIR
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 32
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 0
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 0
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:122: FAIL: copy_file_range failed unexpectedly; expected EOVERFLOW, but got: EINVAL
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 0


> Also .mount_device = 1 and .all_filesystems = 1 require
> .needs_root = 1 definition or you get
>
> tst_device.c:97: INFO: Not allowed to open /dev/loop-control. Are you root?: EACCES
> tst_device.c:132: INFO: No free devices found
> tst_device.c:308: BROK: Failed to acquire device
>
> BTW I wonder whether these could be detected automatically.
Here needs root because /dev/loop-control needs it.  But it doesn't represent mount_device and all_filesystems
  need root.
Or, I misunderstand your idea?

> Kind regards,
> Petr
>
>
> .
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
