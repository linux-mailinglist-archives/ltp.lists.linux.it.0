Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1F4278FCE
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Sep 2020 19:44:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 071233C30D4
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Sep 2020 19:44:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 21A9F3C2991
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 19:44:46 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C922B1000A50
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 19:44:45 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 26C30B20D;
 Fri, 25 Sep 2020 17:44:45 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 25 Sep 2020 19:44:35 +0200
Message-Id: <20200925174439.9534-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 0/4] TPM 2.0 fixes in IMA tests
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
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

finally managed to fix most of the problems with TPM 2.0 and non-sha1
algorithms supported by 6f1a1d103b48 ima: ("Switch to ima_hash_algo for
boot aggregate") from v5.8-rc1.

I still have problem with boot aggregate (test1) which fails with TPM
2.0 on kernel < v5.8-rc1.

Any idea what's wrong?

Otherwise I'm quite confident with changes, I'd prefer to get it merge
to this release. But that'd require to be reviewed and tested ASAP
(ideally during Monday).

Kind regards,
Petr

Petr Vorel (4):
  IMA: Move get_algorithm_digest(), set_digest_index() to ima_setup.sh
  IMA: Rewrite ima_boot_aggregate.c to new API
  ima_tpm.sh: Fix calculating boot aggregate
  ima_tpm.sh: Fix calculating PCR aggregate

 .../integrity/ima/src/ima_boot_aggregate.c    | 110 ++++----
 .../integrity/ima/tests/ima_measurements.sh   |  62 +----
 .../security/integrity/ima/tests/ima_setup.sh |  70 ++++++
 .../security/integrity/ima/tests/ima_tpm.sh   | 238 +++++++++++++-----
 4 files changed, 311 insertions(+), 169 deletions(-)

-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
