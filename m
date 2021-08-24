Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D973F5DB5
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 14:13:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B0B683C31F2
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 14:13:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4AC2E3C03AB
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 14:13:19 +0200 (CEST)
Received: from ATCSQR.andestech.com (atcsqr.andestech.com [60.248.187.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 855E71000DF0
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 14:13:16 +0200 (CEST)
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 17OCCciY073194;
 Tue, 24 Aug 2021 20:12:38 +0800 (GMT-8)
 (envelope-from ycliang@andestech.com)
Received: from ubuntu02 (10.0.12.212) by ATCPCS16.andestech.com (10.0.1.222)
 with Microsoft SMTP Server id 14.3.498.0; Tue, 24 Aug 2021 20:12:38 +0800
Date: Tue, 24 Aug 2021 20:12:31 +0800
From: Leo Liang <ycliang@andestech.com>
To: <ltp@lists.linux.it>
Message-ID: <YSTiLyXItnm6UdyR@ubuntu02>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Originating-IP: [10.0.12.212]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 17OCCciY073194
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v7,
 0/4] cgroup/cgroup_regression_test: Fix umount failure
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
Cc: "richiejp@f-m.fm" <richiejp@f-m.fm>, ycliang@cs.nctu.edu.tw, Alan
 Quey-Liang =?utf-8?B?S2FvKOmrmOmtgeiJryk=?= <alankao@andestech.com>,
 "metan@ucw.cz" <metan@ucw.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The test sequence
	mount -t cgroup -o <controllers> <path>
	mkdir <path>/<dir>
	rmdir <path>/<dir>
	umount <path>
	mount -t cgroup -o <controllers> <path>
would easily fail at the last mount with -EBUSY on certain platform.

Adding a little delay between "rmdir" and "umount" could fix the problem,
so use tst_umount API instead of umount in "rmdir, umount" sequence.

tst_umount API is ambiguous when checking for whether a device is mounted.
Modify it to check an actual mount point instead of device
and reject anything that does not start with '/' as an argument.

Changes since v1
- Use "tst_umount" instead of "sync" as suggested
- Make "tst_umount" work with argument that has terminating slash

Changes since v2
- Filter out the trailing slash instead of using mountpoint command

Changes since v3
- Filter out the trailing slash only in grep command
- Add comment in the test script

Changes since v4
- Remove unnecessary stderr redirection

Changes since v5
- Make tst_umount to only accept absolute mount point as an argument
- Modify tests that use tst_umount to pass mount point in instead of device

Changes since v6
- Use grep instead of "bashism [[]]" to determine if the argument starts with '/'
- Change the default TST_MNTPOINT to $PWD/mntpoint

Leo Yu-Chi Liang (4):
  lib: tst_umount: umount a mount point instead of a device
  doc: change the default behavior of tst_umount
  cgroup/cgroup_regression_test: Fix umount failure
  Make argument to tst_umount an absolute path

 doc/shell-test-api.txt                        |  8 ++++----
 .../cgroup/cgroup_regression_test.sh          | 10 +++++-----
 .../fs/quota_remount/quota_remount_test01.sh  |  2 +-
 .../integrity/ima/tests/evm_overlay.sh        |  2 +-
 .../tracing/dynamic_debug/dynamic_debug01.sh  |  2 +-
 testcases/lib/tst_test.sh                     | 20 +++++++++++--------
 6 files changed, 24 insertions(+), 20 deletions(-)

-- 
2.17.0

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
