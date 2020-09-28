Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8227927A60B
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Sep 2020 05:56:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 463E43C2A33
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Sep 2020 05:56:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id CC6B83C2C21
 for <ltp@lists.linux.it>; Mon, 28 Sep 2020 05:56:21 +0200 (CEST)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id E2CDE6005C8
 for <ltp@lists.linux.it>; Mon, 28 Sep 2020 05:56:20 +0200 (CEST)
Received: from tusharsu-Ubuntu.lan (c-71-197-163-6.hsd1.wa.comcast.net
 [71.197.163.6])
 by linux.microsoft.com (Postfix) with ESMTPSA id BCECB20B7178;
 Sun, 27 Sep 2020 20:56:18 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BCECB20B7178
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1601265379;
 bh=/ZKbn+BtdcYwqnMPh/CImefmolSKnKyfq10Qq7zbHdE=;
 h=From:To:Cc:Subject:Date:From;
 b=F8PplHXIjEOHGi7H/NErKYjuXhYbC344HjpTmKTcLkLWUyybK+1UCGN/7nyd3cFfI
 tzBEMBP8o43/3vfW+YfTXx7mJYKpbtPvgBwebqP6DLDt9xy4xL616KoGdm+tEgpP+G
 svAaDFwQ9ngxmSbjpHE7whQeq8HdpPWCL9Zz7EZE=
From: Tushar Sugandhi <tusharsu@linux.microsoft.com>
To: zohar@linux.ibm.com, agk@redhat.com, snitzer@redhat.com,
 gmazyland@gmail.com, pvorel@suse.cz
Date: Sun, 27 Sep 2020 20:56:03 -0700
Message-Id: <20200928035605.22701-1-tusharsu@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_PASS,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/2] IMA: Add test for dm-crypt measurement
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
Cc: nramas@linux.microsoft.com, linux-integrity@vger.kernel.org,
 dm-devel@redhat.com, ltp@lists.linux.it
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

New functionality is being added to IMA to measure data provided by
kernel components. With this feature, IMA policy can be set to enable
measuring data provided by device-mapper targets. Currently one such
device-mapper target - dm-crypt, is being updated to use this
functionality. This new functionality needs test automation in LTP.

Some of the existing functionality in ima_keys.sh can be reused for
this, but it needs to be refactored into generic functions first.

Add a testcase which verifies that the IMA subsystem correctly measures
the data coming from a device-mapper target - dm-crypt.
Refactor common functionality in ima_keys.sh for this, and move the
generic functions to ima_setup.sh.

This series needs a kernel built on the following repo/branch/patches:
 repo: https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git
 branch: next-integrity
 commit aa662fc04f5b ("ima: Fix NULL pointer dereference in ima_file_hash")

And the following patch series should be applied in the following order:
 1. https://patchwork.kernel.org/patch/11795559/
 2. https://patchwork.kernel.org/patch/11801525/
 3. https://patchwork.kernel.org/patch/11743715/

Change Log v2:
Incorporated feedback from Petr Vorel on v1.
 - Updated TST_NEEDS_CMDS to correctly reflects commands used in tests.
 - Removed unnecessary debugging info.
 - Refactored common functionality in ima_keys.sh, and moved the generic
   functions to ima_setup.sh.
 - Removed the use of eval, and replaced it with the recommended ROD()
   function.
 - All temporary files now get created under $TST_TMPDIR, instead of
   current directory.
 - Removed unnecessary TFAIL, to avoid double counting failures.
 - Updated log messages to be consistent.
 - Moved code to cleanup() to avoid code duplication.

Tushar Sugandhi (2):
  IMA: generalize key measurement tests
  IMA: Add test for dm-crypt measurement

 runtest/ima                                   |  1 +
 .../kernel/security/integrity/ima/README.md   | 20 +++++
 .../integrity/ima/tests/ima_dm_crypt.sh       | 60 ++++++++++++++
 .../security/integrity/ima/tests/ima_keys.sh  | 62 +++------------
 .../security/integrity/ima/tests/ima_setup.sh | 79 +++++++++++++++++++
 5 files changed, 173 insertions(+), 49 deletions(-)
 create mode 100755 testcases/kernel/security/integrity/ima/tests/ima_dm_crypt.sh

-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
