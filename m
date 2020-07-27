Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3BF22FC32
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jul 2020 00:31:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5CFD73C60F2
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jul 2020 00:31:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 5935B3C0488
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 00:30:53 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 762466017E6
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 00:30:52 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0CEBAAD76;
 Mon, 27 Jul 2020 22:31:02 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 28 Jul 2020 00:30:37 +0200
Message-Id: <20200727223041.13110-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v5 0/4] IMA: kexec cmdline measurement
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
Cc: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 balajib@linux.microsoft.com, Mimi Zohar <zohar@linux.vnet.ibm.com>,
 linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

sending hopefully the last version. In the end I did quite few changes,
thus sending patchset instead of merging without review.

Tested on various setup:
ima_kexec 1 TCONF: IMA policy does not specify '^measure.*func=KEXEC_CMDLINE'
---
ima_kexec 1 TPASS: kexec -s -l /boot/vmlinuz-5.3.13-1-default --append=foo passed as expected
ima_kexec 1 TPASS: kexec cmdline for --append=foo was measured correctly
ima_kexec 2 TPASS: kexec -s -l /boot/vmlinuz-5.3.13-1-default --command-line=bar passed as expected
ima_kexec 2 TPASS: kexec cmdline for --command-line=bar was measured correctly
---
ima_kexec 1 TBROK: kexec failed: kexec_file_load failed: Required key not available
---
ima_kexec 1 TWARN: policy not readable, it might not contain required measure func=KEXEC_CMDLINE
ima_kexec 1 TBROK: unable to find a correct entry for --reuse-cmdline

Kind regards,
Petr

Lachlan Sneff (1):
  IMA: Add test for kexec cmdline measurement

Petr Vorel (3):
  IMA: Rename helper to require_ima_policy_cmdline
  IMA: Add policy related helpers
  IMA/ima_keys.sh: Fix policy readability check

 runtest/ima                                   |   1 +
 .../kernel/security/integrity/ima/README.md   |   8 ++
 .../integrity/ima/datafiles/kexec.policy      |   1 +
 .../integrity/ima/tests/evm_overlay.sh        |   2 +-
 .../security/integrity/ima/tests/ima_kexec.sh | 111 ++++++++++++++++++
 .../security/integrity/ima/tests/ima_keys.sh  |  10 +-
 .../integrity/ima/tests/ima_measurements.sh   |   2 +-
 .../security/integrity/ima/tests/ima_setup.sh |  41 ++++++-
 8 files changed, 164 insertions(+), 12 deletions(-)
 create mode 100644 testcases/kernel/security/integrity/ima/datafiles/kexec.policy
 create mode 100755 testcases/kernel/security/integrity/ima/tests/ima_kexec.sh

-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
