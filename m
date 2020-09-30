Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A620027EE24
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 18:02:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4FD843C2A9F
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 18:02:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 1FFF83C26B1
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 18:02:21 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BFE4F1400214
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 18:02:20 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DC417AE02;
 Wed, 30 Sep 2020 16:02:19 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 30 Sep 2020 18:02:10 +0200
Message-Id: <20200930160214.29358-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v4 0/4]	TPM 2.0 fixes in IMA tests
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
Cc: linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Mimi, Lakshmi,

changes v3->v4:

test1:
* require 1.3.1 instead of 1.3 (simplification)

test2
* use --ignore-violations if evmctl >= 1.3.1 available
* check error only for 1.3.1, for others check only the result
* check for ima_policy=tcb (or ima_tcb) and require 1.3.1 if used
(to get --ignore-violations)

Kind regards,
Petr

Petr Vorel (4):
  IMA: Move get_algorithm_digest(), set_digest_index() to ima_setup.sh
  IMA: Rewrite ima_boot_aggregate.c to new API
  ima_tpm.sh: Fix calculating boot aggregate
  ima_tpm.sh: Fix calculating PCR aggregate

 .../integrity/ima/src/ima_boot_aggregate.c    | 113 ++++---
 .../integrity/ima/tests/ima_measurements.sh   |  62 +---
 .../security/integrity/ima/tests/ima_setup.sh |  84 +++++-
 .../security/integrity/ima/tests/ima_tpm.sh   | 284 ++++++++++++++----
 4 files changed, 371 insertions(+), 172 deletions(-)

-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
