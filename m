Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A8C2FEBED
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 14:32:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2D3413C639B
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 14:32:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 070D33C3043
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 14:32:43 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id AF2E01000A6D
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 14:32:43 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B08BCAF6C;
 Thu, 21 Jan 2021 13:32:42 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 21 Jan 2021 14:32:30 +0100
Message-Id: <20210121133233.29007-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v4 0/3] Kernel module detection (own implementation)
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
Cc: kernel-team@android.com, Steve Muckle <smuckle@google.com>,
 Sandeep Patil <sspatil@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

changes v3->v4:
* fix memory leaks (add missing free())
* optimize handling input string (avoid unnecessary fgets())
* add missing static
* new commit: re-add tst_require_drivers veth in tst_net.sh

I'm for merging this variant which works with text files.
I haven't check the binary format yet, but it'd would most likely
require using libkmod. Do we want that?

Kind regards,
Petr

Petr Vorel (3):
  lib: Fix kernel module detection on BusyBox
  zram: Fix module detection on BusyBox
  tst_net.sh: Require veth for netns (again)

 lib/tst_kernel.c                              | 104 ++++++++++++++++--
 .../kernel/device-drivers/zram/zram_lib.sh    |   6 +-
 testcases/lib/tst_net.sh                      |   1 +
 3 files changed, 95 insertions(+), 16 deletions(-)

-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
