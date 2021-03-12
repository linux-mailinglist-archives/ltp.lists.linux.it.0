Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB7D3394FA
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 18:32:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 37F653C6865
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 18:32:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 5300F3C5548
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 18:32:09 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9073E601103
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 18:32:09 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B0D62AF62;
 Fri, 12 Mar 2021 17:32:08 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 12 Mar 2021 18:31:58 +0100
Message-Id: <20210312173201.27708-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 0/3] shell test timeout handling
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

changes before previous attempt [1]
* _tst_kill_test() (Cyril)
* added test timeout03.sh
* update trap message (Joerg)

NOTE: we have no way to print summary from _tst_do_exit if cleanup get
stuck, but IMHO there is no simple way how to solve it (we'd have to use
mapped memory to increment counter also in shell API as Cyril suggested)

[1] https://patchwork.ozlabs.org/project/ltp/patch/20210301220222.22705-7-pvorel@suse.cz/

Petr Vorel (3):
  tst_test.sh: Run cleanup also after test timeout
  test: Adding timeout03.sh for testing _tst_kill_test()
  zram: Increase timeout according to used devices

 lib/newlib_tests/shell/timeout03.sh           | 47 +++++++++++++++++++
 .../kernel/device-drivers/zram/zram_lib.sh    |  2 +
 testcases/lib/tst_test.sh                     | 25 ++++++++--
 3 files changed, 71 insertions(+), 3 deletions(-)
 create mode 100755 lib/newlib_tests/shell/timeout03.sh

-- 
2.30.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
