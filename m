Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 293455A13BF
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Aug 2022 16:37:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 59FC53CA48A
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Aug 2022 16:37:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0C5063C0367
 for <ltp@lists.linux.it>; Thu, 25 Aug 2022 16:37:04 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id A67671400530
 for <ltp@lists.linux.it>; Thu, 25 Aug 2022 16:37:03 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38A3DD6E;
 Thu, 25 Aug 2022 07:37:05 -0700 (PDT)
Received: from e129169.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1D483F67D;
 Thu, 25 Aug 2022 07:36:59 -0700 (PDT)
From: Tudor Cretu <tudor.cretu@arm.com>
To: ltp@lists.linux.it
Date: Thu, 25 Aug 2022 15:38:17 +0100
Message-Id: <20220825143819.311023-1-tudor.cretu@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v4 0/2] syscalls: Fix various syscall tests when
 compiled with Musl
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

Hi,

There were a few issues with some syscalls tests when they were compiled
with Musl. This series attempts to improve the robustness of some syscall
tests.

changes v3->v4:
* My apologies, I was missing stdlib.h in [v3 Patch 2/2] so I updated the series.

Tudor Cretu (2):
  syscalls/statfs02,fstatfs02: Convert to new API
  syscalls/statfs02,fstatfs02: Accept segfault instead of EFAULT

 testcases/kernel/syscalls/fstatfs/fstatfs02.c | 111 ++++++------------
 testcases/kernel/syscalls/statfs/statfs02.c   | 108 ++++++-----------
 2 files changed, 78 insertions(+), 141 deletions(-)

-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
