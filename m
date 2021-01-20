Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E2C2FD2C3
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 15:37:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ABFDF3C6503
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 15:37:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id F09003C0194
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 15:37:37 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7CA771400043
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 15:37:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1611153456; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=IjY/D1iXjKz54pM82wpuiKbmLEMaLpoadCsoWoh5Jog=;
 b=pVOso3GEue7YH2GAuPKkrbOTS3CfmWwpiTy8dfAgeu/OebjoVkWVRPLBizO0kUKvCzxU6h
 NBXx/IdPHyqyyBjkA6bKz8qkR9qQSFj6kdT7cWEB6zZprn7bfMgjsv2BKIuTH2qEOCHTJt
 QFDuK5vPTdvoMAfSAdg2h2+cGHXTx6g=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A9971AB9F;
 Wed, 20 Jan 2021 14:37:36 +0000 (UTC)
To: ltp@lists.linux.it
Date: Wed, 20 Jan 2021 14:37:16 +0000
Message-Id: <20210120143723.26483-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v3 0/7] Convert CAN tests to new LTP API
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
Cc: Oliver Hartkopp <socketcan@hartkopp.net>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Richard Palethorpe <rpalethorpe@suse.com>, linux-can@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

This is an attempt to convert the CAN tests to the (modern) Linux Test
Project API and removes the wrapper script. To be clear, this is a
patch-set for the LTP *not* the kernel tree or can-utils.

I have tried to keep the core test behaviour the same, but (for
example) moving to the SAFE_ functions will naturally introduce some
changes in error checking. Deliberate behavioral changes have been
noted in the commit messages.

FYI, we appear to have 4 CAN tests in LTP including two tests for
SLCAN (pty03, pty04).

V2: Update e-mail addresses and resend
V3:
* Add COPYING and use dual license SPDX identifier
* Fix compilation issues with can_common.h

Richard Palethorpe (7):
  API: Add FILE_SCANF to new lib
  can: Add can_common.h for vcan device setup
  can: Add COPYING with dual license text
  can_filter: Convert to new library
  can_recv_own_msgs: Convert to new library
  can: Remove obsolete test wrapper script
  can: Update contact details

 include/tst_safe_file_ops.h                   |   3 +
 testcases/network/can/Makefile                |   2 -
 .../can/filter-tests/00_Descriptions.txt      |   6 +-
 testcases/network/can/filter-tests/COPYING    |  35 ++
 testcases/network/can/filter-tests/INSTALL    |   3 +-
 testcases/network/can/filter-tests/Makefile   |   4 -
 .../network/can/filter-tests/can_common.h     |  75 +++++
 .../network/can/filter-tests/can_filter.c     | 317 +++++++-----------
 .../can/filter-tests/can_rcv_own_msgs.c       | 273 +++++----------
 .../network/can/filter-tests/can_run_tests.sh | 106 ------
 10 files changed, 331 insertions(+), 493 deletions(-)
 create mode 100644 testcases/network/can/filter-tests/COPYING
 create mode 100644 testcases/network/can/filter-tests/can_common.h
 delete mode 100755 testcases/network/can/filter-tests/can_run_tests.sh

-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
