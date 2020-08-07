Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F26CE23F3F7
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 22:47:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8ED1E3C320B
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 22:47:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 47CCB3C31E2
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 22:47:01 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id CC490601102
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 22:46:59 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ADC03AC41;
 Fri,  7 Aug 2020 20:47:17 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  7 Aug 2020 22:46:48 +0200
Message-Id: <20200807204652.5928-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/4] IMA: verify measurement of certificate
 imported into a keyring
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
Cc: Mimi Zohar <zohar@linux.vnet.ibm.com>, linux-integrity@vger.kernel.org,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

sending enhanced Lachlan's version.
I haven't tested this patchset, could please anybody test it?

Kind regards,
Petr

Lachlan Sneff (1):
  IMA: Add a test to verify measurement of certificate imported into a
    keyring

Petr Vorel (3):
  IMA/ima_keys.sh Fix policy content check usage
  IMA: Refactor datafiles directory
  IMA/ima_keys.sh: Enhance policy checks

 .../kernel/security/integrity/ima/README.md   |  12 ++-
 .../security/integrity/ima/datafiles/Makefile |  10 +-
 .../ima/datafiles/ima_kexec/Makefile          |  11 ++
 .../datafiles/{ => ima_kexec}/kexec.policy    |   0
 .../integrity/ima/datafiles/ima_keys/Makefile |  11 ++
 .../datafiles/{ => ima_keys}/keycheck.policy  |   2 +-
 .../ima/datafiles/ima_keys/x509_ima.der       | Bin 0 -> 650 bytes
 .../ima/datafiles/ima_policy/Makefile         |  11 ++
 .../datafiles/{ => ima_policy}/measure.policy |   0
 .../{ => ima_policy}/measure.policy-invalid   |   0
 .../security/integrity/ima/tests/ima_keys.sh  |  96 +++++++++++++++---
 11 files changed, 129 insertions(+), 24 deletions(-)
 create mode 100644 testcases/kernel/security/integrity/ima/datafiles/ima_kexec/Makefile
 rename testcases/kernel/security/integrity/ima/datafiles/{ => ima_kexec}/kexec.policy (100%)
 create mode 100644 testcases/kernel/security/integrity/ima/datafiles/ima_keys/Makefile
 rename testcases/kernel/security/integrity/ima/datafiles/{ => ima_keys}/keycheck.policy (59%)
 create mode 100644 testcases/kernel/security/integrity/ima/datafiles/ima_keys/x509_ima.der
 create mode 100644 testcases/kernel/security/integrity/ima/datafiles/ima_policy/Makefile
 rename testcases/kernel/security/integrity/ima/datafiles/{ => ima_policy}/measure.policy (100%)
 rename testcases/kernel/security/integrity/ima/datafiles/{ => ima_policy}/measure.policy-invalid (100%)

-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
