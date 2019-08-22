Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC6999F9B
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Aug 2019 21:14:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A76013C1D01
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Aug 2019 21:14:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 09D6E3C17A2
 for <ltp@lists.linux.it>; Thu, 22 Aug 2019 21:14:56 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C673E14001EF
 for <ltp@lists.linux.it>; Thu, 22 Aug 2019 21:14:55 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6E52BAD7B
 for <ltp@lists.linux.it>; Thu, 22 Aug 2019 19:14:54 +0000 (UTC)
From: Christian Lanig <clanig@suse.com>
To: ltp@lists.linux.it
Date: Thu, 22 Aug 2019 21:12:44 +0200
Message-Id: <cover.1566500817.git.clanig@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20181003113215.GB21139@dell5510>
References: <20181003113215.GB21139@dell5510>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [RFC PATCH v2 0/1] Add automated tests for shell lib
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

Hi,

I am sorry that my reply took so long. Thank you very much for your comments
which helped me to improve the code.
I have made an overhaul of the code based on your suggestions but an option to
pass parameters to the tests is still not implemented. 
I'm sending you what I have so far because it would help me when you could
provide me more information regarding this.

I agree that it is difficult to find a way to process text the way needed here
without disregarding the Linux Kernel Coding Style that asks for code which is
transparent and easy to read when we only consider Shell commands. To address
this issue I have drafted a Python script that might go in the tools folder and
may perhaps be helpful in other cases as well. Since there are already Python
files in the project it might be a valid option.

Thank you very much for your patience.

Regards,
Christian Lanig

Christian Lanig (1):
  Add automated tests for shell lib

 doc/write-tests-for-shell-lib.txt                  |  59 ++++++++++
 lib/newlib_tests/shell/test_sh_newlib.sh           | 102 ++++++++++++++++++
 .../testcases/test.TST_TEST.TST_CNT.separate.sh    |  30 ++++++
 .../shell/testcases/test.TST_TEST.TST_CNT.sh       |  28 +++++
 .../shell/testcases/test.TST_TEST.getopts.sh       |  49 +++++++++
 lib/newlib_tests/shell/testcases/test.TST_TEST.sh  |  33 ++++++
 .../test.TST_TEST_DATA.TST_CNT.separate.sh         |  33 ++++++
 .../shell/testcases/test.TST_TEST_DATA.TST_CNT.sh  |  31 ++++++
 .../shell/testcases/test.TST_TEST_DATA.getopts.sh  |  51 +++++++++
 .../shell/testcases/test.TST_TEST_DATA.sh          |  25 +++++
 .../testcases/test.TST_TEST_DATA_IFS.getopts.sh    |  53 +++++++++
 .../shell/testcases/test.TST_TEST_DATA_IFS.sh      |  28 +++++
 tools/lookup_split_cut.py                          | 120 +++++++++++++++++++++
 13 files changed, 642 insertions(+)
 create mode 100644 doc/write-tests-for-shell-lib.txt
 create mode 100755 lib/newlib_tests/shell/test_sh_newlib.sh
 create mode 100755 lib/newlib_tests/shell/testcases/test.TST_TEST.TST_CNT.separate.sh
 create mode 100755 lib/newlib_tests/shell/testcases/test.TST_TEST.TST_CNT.sh
 create mode 100755 lib/newlib_tests/shell/testcases/test.TST_TEST.getopts.sh
 create mode 100755 lib/newlib_tests/shell/testcases/test.TST_TEST.sh
 create mode 100755 lib/newlib_tests/shell/testcases/test.TST_TEST_DATA.TST_CNT.separate.sh
 create mode 100755 lib/newlib_tests/shell/testcases/test.TST_TEST_DATA.TST_CNT.sh
 create mode 100755 lib/newlib_tests/shell/testcases/test.TST_TEST_DATA.getopts.sh
 create mode 100755 lib/newlib_tests/shell/testcases/test.TST_TEST_DATA.sh
 create mode 100755 lib/newlib_tests/shell/testcases/test.TST_TEST_DATA_IFS.getopts.sh
 create mode 100755 lib/newlib_tests/shell/testcases/test.TST_TEST_DATA_IFS.sh
 create mode 100755 tools/lookup_split_cut.py

-- 
2.16.4


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
