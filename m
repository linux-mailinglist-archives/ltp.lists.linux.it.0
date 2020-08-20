Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 92ADB24B1B6
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 11:09:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 50C103C2FAC
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 11:09:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id F1CFA3C2F99
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 11:08:38 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6AACE20096D
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 11:08:38 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8B77EB75B;
 Thu, 20 Aug 2020 09:09:04 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 20 Aug 2020 11:08:19 +0200
Message-Id: <20200820090824.3033-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [LTP v4 0/5] IMA: verify measurement of certificate imported
 into a keyring
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
* Add new commit to add another policy dependency (template=ima-buf) and
and fix missing '.' in grep pattern
* Add cleanup function for test2: remove key with keyctl clear ID
instead of running keyctl new_session > /dev/null which was reported
as problematic (and still affects other tests which are run after this one)
* Update check_keys_policy() and checking the policy in general
* Remove new line when working policy to find keyrings and templates
* Replace tr with sed

I still kept keyctl new_session > /dev/null. Should I remove it?
Works for me without it, but that would probably require a cleanup.

Kind regards,
Petr

Lachlan Sneff (1):
  IMA: Add a test to verify measurement of certificate imported into a
    keyring

Petr Vorel (4):
  IMA/ima_keys.sh: Fix policy content check usage
  IMA/ima_keys.sh: Require template=ima-buf, fix grep pattern
  IMA: Refactor datafiles directory
  IMA/ima_keys.sh: Enhance policy checks

 .../kernel/security/integrity/ima/README.md   |  12 +-
 .../security/integrity/ima/datafiles/Makefile |  10 +-
 .../ima/datafiles/ima_kexec/Makefile          |  11 ++
 .../datafiles/{ => ima_kexec}/kexec.policy    |   0
 .../integrity/ima/datafiles/ima_keys/Makefile |  11 ++
 .../datafiles/{ => ima_keys}/keycheck.policy  |   2 +-
 .../ima/datafiles/ima_keys/x509_ima.der       | Bin 0 -> 650 bytes
 .../ima/datafiles/ima_policy/Makefile         |  11 ++
 .../datafiles/{ => ima_policy}/measure.policy |   0
 .../{ => ima_policy}/measure.policy-invalid   |   0
 .../security/integrity/ima/tests/ima_keys.sh  | 115 +++++++++++++++---
 11 files changed, 142 insertions(+), 30 deletions(-)
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
