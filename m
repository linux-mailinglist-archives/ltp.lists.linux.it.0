Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8E5140FCB
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jan 2020 18:24:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 283C83C2275
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jan 2020 18:24:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 941743C2215
 for <ltp@lists.linux.it>; Fri, 17 Jan 2020 18:24:56 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 9EEF81000DAF
 for <ltp@lists.linux.it>; Fri, 17 Jan 2020 18:24:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579281894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9xJSRhNfq8Tr3ojPfxyB93atGe8xjio+WX3BHwdtb3E=;
 b=fBfVQH3NTGthNIG5ljm1qBQ7yORU3jsNmq1M4QoJYscnbw0LaxGnRXLeVxa1iUtSF3jJe5
 mRffyAdG4v+b0HKvPgjAacz/poimYp6KaEToetcc4cRa/Vf+aVfZHhozybwuK9GCF8oavQ
 T50cDKBPuDjk1H3Al+oZvCl7ilPYLuQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-ancvZ7HdO96rWud3lYvvqg-1; Fri, 17 Jan 2020 12:24:50 -0500
X-MC-Unique: ancvZ7HdO96rWud3lYvvqg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5196A800D41;
 Fri, 17 Jan 2020 17:24:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E45A7DB34;
 Fri, 17 Jan 2020 17:24:48 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9262787092;
 Fri, 17 Jan 2020 17:24:47 +0000 (UTC)
Date: Fri, 17 Jan 2020 12:24:47 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>, tytso@mit.edu,
 adilger@dilger.ca
Message-ID: <1555311261.2497849.1579281887353.JavaMail.zimbra@redhat.com>
In-Reply-To: <CA+G9fYuBdcZvE6VPm9i2=F0mK5u3j6Z+RHbFBQ1zh9qbN_4kaw@mail.gmail.com>
References: <CA+G9fYuBdcZvE6VPm9i2=F0mK5u3j6Z+RHbFBQ1zh9qbN_4kaw@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.23]
Thread-Topic: statx06: FAIL: Birth time < before time
Thread-Index: BGRUuw3BMnr+jewWkQoEmCDnUAKxyQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] LTP: statx06: FAIL: Birth time < before time
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
Cc: Arnd Bergmann <arnd@arndb.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 linux-ext4@vger.kernel.org, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> LTP syscalls statx06 test case getting failed from linux next 20200115
> tag onwards on all x86_64, i386, arm and arm64 devices
> 
> Test output:
> statx06.c:152: FAIL: Birth time < before time

[CC Theo & linux-ext4]

It's returning '0' in stx_btime for STATX_ALL or STATX_BTIME.

Looking at changes, I suspect:
  commit 927353987d503b24e1813245563cde0c6167af6e
  Author: Theodore Ts'o <tytso@mit.edu>
  Date:   Thu Nov 28 22:26:51 2019 -0500
    ext4: avoid fetching btime in ext4_getattr() unless requested

and that perhaps it should be instead...

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index c8355f022e6e..6d76eb6d2e7f 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -5398,7 +5398,7 @@ int ext4_getattr(const struct path *path, struct kstat *stat,
        struct ext4_inode_info *ei = EXT4_I(inode);
        unsigned int flags;

-       if ((query_flags & STATX_BTIME) &&
+       if ((request_mask & STATX_BTIME) &&
            EXT4_FITS_IN_INODE(raw_inode, ei, i_crtime)) {
                stat->result_mask |= STATX_BTIME;
                stat->btime.tv_sec = ei->i_crtime.tv_sec;

That allows test to pass again.

> statx06.c:156: PASS: Modified time Passed
> statx06.c:156: PASS: Access time Passed
> statx06.c:156: PASS: Change time Passed
> 
> strace output snippet:
> [pid   498] clock_getres(CLOCK_REALTIME_COARSE, {tv_sec=0, tv_nsec=1000000})
> = 0
> [pid   498] nanosleep({tv_sec=0, tv_nsec=1000000}, NULL) = 0
> [pid   498] openat(AT_FDCWD, \"mount_ext/test_file.txt\",
> O_RDWR|O_CREAT, 0666) = 3
> [pid   498] clock_getres(CLOCK_REALTIME_COARSE, {tv_sec=0, tv_nsec=1000000})
> = 0
> [pid   498] nanosleep({tv_sec=0, tv_nsec=1000000}, NULL) = 0
> [pid   498] statx(AT_FDCWD, \"mount_ext/test_file.txt\",
> AT_STATX_SYNC_AS_STAT, STATX_ALL, {stx_mask=STATX_BASIC_STATS,
> stx_attributes=0, stx_mode=S_IFREG|0644, stx_size=0, ...}) = 0
> [pid   498] write(2, \"statx06.c:152: \33[1;31mFAIL: \33[0m\"...,
> 57statx06.c:152: [1;31mFAIL: [0mBirth time < before time
> ) = 57
> 
> Full test log link,
> https://lkft.validation.linaro.org/scheduler/job/1107634#L2276
> 
> Test results comparison link,
> https://qa-reports.linaro.org/lkft/linux-next-oe/tests/ltp-syscalls-tests/statx06
> 
> Test case link,
> https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/syscalls/statx/statx06.c
> 
> --
> Linaro LKFT
> https://lkft.linaro.org
> 
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
