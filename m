Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FDFB7AD5
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Sep 2019 15:51:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 523C33C2114
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Sep 2019 15:51:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id CABF63C20F2
 for <ltp@lists.linux.it>; Thu, 19 Sep 2019 15:50:58 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 97DD1140145E
 for <ltp@lists.linux.it>; Thu, 19 Sep 2019 15:50:57 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A50F4AFBB;
 Thu, 19 Sep 2019 13:50:56 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 19 Sep 2019 15:50:40 +0200
Message-Id: <20190919135043.14359-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v3 0/3] shell: Introduce TST_TIMEOUT variable
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

changes v2->v3:
* cast to int if awk is not available (Li) instead of TCONF
* actually round variable (with 0.5) (Clemens)
* fix variable description (Clemens)
* add 2 tests for TST_TIMEOUT (it'd be more useful to test
  LTP_TIMEOUT_MUL, but I'd wait for Christian's shell test
  patch [1] being merged)

NOTES:
There are a more changes in second patch, I kept them in the same commit
as it's related.
Current tests might not be much useful.

[1] https://patchwork.ozlabs.org/patch/1151766/

Petr Vorel (3):
  shell: Add tst_is_num()
  shell: Introduce TST_TIMEOUT variable, add checks
  net/if-mtu-change.sh: set TST_TIMEOUT

 doc/test-writing-guidelines.txt               | 89 ++++++++++++-------
 lib/newlib_tests/shell/timeout01.sh           | 13 +++
 lib/newlib_tests/shell/timeout02.sh           | 13 +++
 .../memcg/stress/memcg_stress_test.sh         |  2 +-
 testcases/lib/tst_test.sh                     | 49 +++++++++-
 .../network/stress/interface/if-mtu-change.sh |  4 +-
 6 files changed, 133 insertions(+), 37 deletions(-)
 create mode 100755 lib/newlib_tests/shell/timeout01.sh
 create mode 100755 lib/newlib_tests/shell/timeout02.sh

-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
