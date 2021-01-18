Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A3C2FA551
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 16:58:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 28B813C318F
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 16:58:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 723593C0548
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 16:58:22 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D51CF600940
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 16:58:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1610985501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=YZw1jkjlUNss58mpzxfotx4D3qMDF4W4dBiefYVR0CU=;
 b=Caa3DF3OJDCMCy5EfBr9iNOlIHHWD3tVl3+hnlE6fIpJLZAgvD2cwi/am9GiMe0XCAaZ/6
 +O6CoOipfOvEzdLKHpZGKLAfU0oATqlwwtqMyUBCOw/6b0pAafbTVQ78nFPpQ5LcCDpr9r
 ZKEI9UF/DlmQxw1IS0Ne+1hfkm3Nb6Q=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 054A6ABDA;
 Mon, 18 Jan 2021 15:58:21 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 18 Jan 2021 15:56:23 +0000
Message-Id: <20210118155628.9248-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 0/5] Convert CAN tests to new LTP API
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: socketcan-users@lists.berlios.de,
 Oliver Hartkopp <oliver.hartkopp@volkswagen.de>,
 Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

This is an attempt to convert the CAN tests to the (modern) LTP API
and removes the wrapper script. I have tried to keep the core test
behaviour the same, but (for example) moving to the SAFE_ functions
will naturally introduce some changes in error checking. Deliberate
behavioral changes have been noted in the commit messages.

Richard Palethorpe (5):
  API: Add FILE_SCANF to new lib
  can: Add can_common.h for vcan device setup
  can_filter: Convert to new library
  can_recv_own_msgs: Convert to new library
  can: Remove obsolete test wrapper script

 include/tst_safe_file_ops.h                   |   3 +
 testcases/network/can/Makefile                |   2 -
 .../can/filter-tests/00_Descriptions.txt      |   1 +
 testcases/network/can/filter-tests/INSTALL    |   3 +-
 testcases/network/can/filter-tests/Makefile   |   2 -
 .../network/can/filter-tests/can_common.h     |  70 ++++
 .../network/can/filter-tests/can_filter.c     | 317 +++++++-----------
 .../can/filter-tests/can_rcv_own_msgs.c       | 273 +++++----------
 .../network/can/filter-tests/can_run_tests.sh | 106 ------
 9 files changed, 288 insertions(+), 489 deletions(-)
 create mode 100644 testcases/network/can/filter-tests/can_common.h
 delete mode 100755 testcases/network/can/filter-tests/can_run_tests.sh

-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
