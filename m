Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DB8DC53A
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Oct 2019 14:45:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6F42E3C237B
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Oct 2019 14:45:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 36A6C3C226C
 for <ltp@lists.linux.it>; Fri, 18 Oct 2019 14:45:26 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 44E5614012AF
 for <ltp@lists.linux.it>; Fri, 18 Oct 2019 14:45:24 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 881B6B3C4;
 Fri, 18 Oct 2019 12:45:24 +0000 (UTC)
From: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
To: ltp@lists.linux.it
Date: Fri, 18 Oct 2019 14:44:57 +0200
Message-Id: <20191018124502.25599-1-cfamullaconrad@suse.de>
X-Mailer: git-send-email 2.16.4
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v4 0/5] tst_test.sh: Use LTP_TIMEOUT_MUL in
 TST_RETRY_FN()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

* tst_test.sh:
  Force one parameter and fix bashisms.
  But I still need two time eval.
* test_timeout_mul.sh:
  Formatting, but don't add PATH somewhere, as we wait for a runner.
* Mention LTP_TIMEOUT_MUL usage in TST_RETRY_FN() in doc


Clemens Famulla-Conrad (5):
  tst_test.sh: Use LTP_TIMEOUT_MUL in TST_RETRY_FN()
  tst_test.c: Add tst_multiply_timeout()
  tst_common.h: Use tst_multiply_timeout in TST_RETRY_FN()
  Add newlib shell test for tst_multiply_timeout()
  Adopt doc for TST_RETRY_FUNC for LTP_TIMEOUT_MUL

 doc/test-writing-guidelines.txt            |  3 ++-
 include/tst_common.h                       |  6 +++--
 include/tst_test.h                         |  1 +
 lib/newlib_tests/shell/test_timeout_mul.sh | 43 ++++++++++++++++++++++++++++++
 lib/tst_test.c                             | 43 ++++++++++++++++++++++--------
 testcases/lib/tst_test.sh                  | 34 ++++++++++++++++-------
 6 files changed, 106 insertions(+), 24 deletions(-)
 create mode 100755 lib/newlib_tests/shell/test_timeout_mul.sh

--
2.16.4


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
