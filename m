Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 141B132946B
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Mar 2021 23:02:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 83A853C7EDD
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Mar 2021 23:02:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id E9DB83C575A
 for <ltp@lists.linux.it>; Mon,  1 Mar 2021 23:02:31 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6E9E31A0068B
 for <ltp@lists.linux.it>; Mon,  1 Mar 2021 23:02:31 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AD202AB8C
 for <ltp@lists.linux.it>; Mon,  1 Mar 2021 22:02:30 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  1 Mar 2021 23:02:15 +0100
Message-Id: <20210301220222.22705-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 0/7] zram cleanup, tst_set_timeout(timeout)
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

Cc: Cyril Hrubis <chrubis@suse.cz>,
    Li Wang <liwang@redhat.com>,
    Joerg Vehlow <joerg.vehlow@aox-tech.de>,
    Joerg Vehlow <lkml@jv-coder.de>

Petr Vorel (7):
  zram: Calculate dev_num variable
  zram01.sh: Generate test setup variables in setup
  zram: Add zram_compress_alg() to zram02.sh
  zram: Move test specific functions out of zram_lib.sh
  tst_test.sh: Introduce tst_set_timeout(timeout)
  tst_test.sh: Run cleanup also after test timeout
  zram: Increase timeout according to used devices

 doc/test-writing-guidelines.txt               | 16 ++-
 .../kernel/device-drivers/zram/zram01.sh      | 99 +++++++++++++++----
 .../kernel/device-drivers/zram/zram02.sh      | 48 +++++++--
 .../kernel/device-drivers/zram/zram_lib.sh    | 85 ++++------------
 testcases/lib/tst_test.sh                     | 34 +++++--
 5 files changed, 175 insertions(+), 107 deletions(-)

-- 
2.30.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
