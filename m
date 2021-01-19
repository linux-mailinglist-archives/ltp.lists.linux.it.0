Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2122FBBDD
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Jan 2021 17:03:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E97A53C53E0
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Jan 2021 17:03:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 8F24F3C308C
 for <ltp@lists.linux.it>; Tue, 19 Jan 2021 17:03:25 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3A92E1A0090E
 for <ltp@lists.linux.it>; Tue, 19 Jan 2021 17:03:24 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3F0CCAD11;
 Tue, 19 Jan 2021 16:03:24 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 19 Jan 2021 17:03:14 +0100
Message-Id: <20210119160316.4776-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3 0/2] kernel module detection (own implementation)
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
Cc: Steve Muckle <smuckle@google.com>, Sandeep Patil <sspatil@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

changes v2->v3:
* treat '-' and '_' as the same (follow kmod implementation)
* drop unused MODULES_DIR definition
* code readability (more use of SAFE_ASPRINTF())

It'd deserve a test.

Kind regards,
Petr


Petr Vorel (2):
  lib: Fix kernel module detection on BusyBox
  zram: Fix module detection on BusyBox

 lib/tst_kernel.c                              | 99 ++++++++++++++++---
 .../kernel/device-drivers/zram/zram_lib.sh    |  6 +-
 2 files changed, 89 insertions(+), 16 deletions(-)

-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
