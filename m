Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C2E308D88
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 20:42:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4FBE33C5E64
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 20:42:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 7FC523C5A22
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 20:42:00 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 390311400500
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 20:41:59 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5BCCAB113;
 Fri, 29 Jan 2021 19:41:59 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 29 Jan 2021 20:41:38 +0100
Message-Id: <20210129194144.31299-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/6] 	zram cleanup
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

changes v1->v2:
* rewritten variable setup in commit
  zram01.sh: Check properly mkfs.* dependencies
  to reflect Cyril's suggestions
* 2 new commits related to timeout:
  tst_test.sh: Run _tst_setup_timer after $TST_SETUP
  zram: Increase timeout according to used devices

Kind regards,
Petr

Petr Vorel (6):
  zram: Calculate dev_num variable
  zram01.sh: Generate test setup variables in setup
  zram: Move zram_compress_alg() to zram02.sh
  zram: Move test specific functions out of zram_lib.sh
  tst_test.sh: Run _tst_setup_timer after $TST_SETUP
  zram: Increase timeout according to used devices

 doc/test-writing-guidelines.txt               |   5 +-
 .../kernel/device-drivers/zram/zram01.sh      | 113 +++++++++++++----
 .../kernel/device-drivers/zram/zram02.sh      |  77 ++++++++++--
 .../kernel/device-drivers/zram/zram_lib.sh    | 116 +++---------------
 testcases/lib/tst_test.sh                     |   4 +-
 5 files changed, 180 insertions(+), 135 deletions(-)

-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
