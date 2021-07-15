Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C583CA08F
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 16:21:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 076903C81F7
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 16:21:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 79E793C18F7
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 16:21:00 +0200 (CEST)
Received: from ATCSQR.andestech.com (atcsqr.andestech.com [60.248.187.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 664BC6000F0
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 16:20:57 +0200 (CEST)
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 16FEKfeW048634;
 Thu, 15 Jul 2021 22:20:41 +0800 (GMT-8)
 (envelope-from ycliang@andestech.com)
Received: from atcfdc88 (10.0.15.120) by ATCPCS16.andestech.com (10.0.1.222)
 with Microsoft SMTP Server id 14.3.498.0; Thu, 15 Jul 2021 22:20:43 +0800
Date: Thu, 15 Jul 2021 22:20:41 +0800
From: Leo Liang <ycliang@andestech.com>
To: <ltp@lists.linux.it>
Message-ID: <20210715142037.GA30536@atcfdc88>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 16FEKfeW048634
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2,
 0/2] cgroup/cgroup_regression_test: Fix umount failure
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
Cc: richiejp@f-m.fm, alankao@andestech.com, metan@ucw.cz,
 ycliang@cs.nctu.edu.tw
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

Changes since v1
- Use "tst_umount" instead of "sync" as suggested
- Make "tst_umount" work with argument that has terminating slash

Leo Yu-Chi Liang (2):
  lib/tst_test.sh: Make tst_umount work with argument that has
    terminating slash
  cgroup/cgroup_regression_test: Fix umount failure

 .../controllers/cgroup/cgroup_regression_test.sh       | 10 +++++-----
 testcases/lib/tst_test.sh                              |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.17.0

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
