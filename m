Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 44795109D70
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Nov 2019 13:02:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EEF6B3C240F
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Nov 2019 13:02:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 407943C2026
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 13:02:43 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D4230600F84
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 13:02:42 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0C982B23D
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 12:02:42 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 26 Nov 2019 13:02:38 +0100
Message-Id: <20191126120241.5460-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 0/3] Improve test_1_to_1_initmsg_connect SCTP test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

One of the SCTP tests often fails on older kernels on some platforms
due to memory allocation issues. This patchset ports the test to the new LTP
library and fixes the failures by splitting the test into two test cases:
1. Functional test with reduced number of connection streams
2. Stress test with original (maximum) number of connection streams

The stress test accepts ENOMEM error in connect() as success.

This patchset also adds SAFE_ACCEPT() function to the LTP library to simplify
network tests.

Martin Doucha (3):
  Add SAFE_ACCEPT() to LTP safe net library
  Port test_1_to_1_initmsg_connect (SCTP) to new API
  Split SCTP initmsg test into two test cases

 include/safe_net_fn.h                         |   3 +
 include/tst_safe_net.h                        |   3 +
 lib/safe_net.c                                |  16 ++
 .../func_tests/test_1_to_1_initmsg_connect.c  | 161 +++++++++---------
 4 files changed, 98 insertions(+), 85 deletions(-)

-- 
2.24.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
