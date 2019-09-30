Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DECFC23D2
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Sep 2019 17:00:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 242393C2316
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Sep 2019 17:00:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id AA4F83C17CE
 for <ltp@lists.linux.it>; Mon, 30 Sep 2019 16:59:29 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id CC1061400E6C
 for <ltp@lists.linux.it>; Mon, 30 Sep 2019 16:59:28 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EB53CB181;
 Mon, 30 Sep 2019 14:59:27 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 30 Sep 2019 16:59:11 +0200
Message-Id: <20190930145916.20465-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [RFC PATCH v4 0/5] shell: Introduce TST_TIMEOUT variable
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

changes v3->v4:
* add test runner test_timeout.sh, move tests into separate directory
issues reported by Cyril:
* ceil LTP_TIMEOUT_MUL to int instead of complicating code with float
* Don't add LTP_TIMEOUT_MUL docs. This should be added to somewhere else, maybe to
  doc/user-guide.txt if [1] is accepted
* don't renumber sections
* move memcg_stress_test.sh change into separate commit

[1] https://patchwork.ozlabs.org/patch/1169282/

Petr Vorel (5):
  shell: Add tst_is_num()
  shell: Introduce TST_TIMEOUT variable, add checks
  shell: Add timeout shell API tests
  memcg_stress_test.sh: use TST_TIMEOUT (replace LTP_TIMEOUT_MUL)
  net/if-mtu-change.sh: set TST_TIMEOUT

 doc/test-writing-guidelines.txt               | 14 ++++++-
 lib/newlib_tests/shell/test_timeout.sh        | 38 ++++++++++++++++++
 lib/newlib_tests/shell/timeout01.sh           | 13 +++++++
 lib/newlib_tests/shell/timeout02.sh           | 13 +++++++
 .../memcg/stress/memcg_stress_test.sh         |  2 +-
 testcases/lib/tst_test.sh                     | 39 +++++++++++++++++--
 .../network/stress/interface/if-mtu-change.sh |  4 +-
 7 files changed, 116 insertions(+), 7 deletions(-)
 create mode 100755 lib/newlib_tests/shell/test_timeout.sh
 create mode 100755 lib/newlib_tests/shell/timeout01.sh
 create mode 100755 lib/newlib_tests/shell/timeout02.sh

-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
