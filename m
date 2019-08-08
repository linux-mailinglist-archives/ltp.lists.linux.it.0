Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0BD8660B
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2019 17:38:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0D9EA3C1D8D
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2019 17:38:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id F1E333C1C90
 for <ltp@lists.linux.it>; Thu,  8 Aug 2019 17:38:45 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9AFCD601DBE
 for <ltp@lists.linux.it>; Thu,  8 Aug 2019 17:38:44 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 932CCAC2E
 for <ltp@lists.linux.it>; Thu,  8 Aug 2019 15:38:43 +0000 (UTC)
From: Richard Palethorpe <rpalethorpe@suse.com>
To: ltp@lists.linux.it
Date: Thu,  8 Aug 2019 17:38:24 +0200
Message-Id: <20190808153825.18363-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 0/1] tst API for dropping or requiring capabilities
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
Cc: mmoese@suse.com, Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

This API allows one to drop or require particular capabilities after setup.

It can be used like this:

	.caps = (struct tst_cap []) {
		TST_CAP(TST_DROP, CAP_SYS_ADMIN),
		{0, 0, 0},
	},

or

	.caps = (struct tst_cap []) {
	        TST_CAP(TST_DROP, CAP_SYS_ADMIN)
		TST_CAP(TST_REQUIRE, CAP_SOMETHING),
		{0, 0, 0},
	},

It uses capget and capset directly so that we do not need to link to libcap.

Richard Palethorpe (1):
  capability: Introduce capability API

 include/tst_capability.h | 56 +++++++++++++++++++++++++++++
 include/tst_test.h       |  6 ++++
 lib/tst_capability.c     | 78 ++++++++++++++++++++++++++++++++++++++++
 lib/tst_test.c           |  3 ++
 4 files changed, 143 insertions(+)
 create mode 100644 include/tst_capability.h
 create mode 100644 lib/tst_capability.c

-- 
2.22.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
