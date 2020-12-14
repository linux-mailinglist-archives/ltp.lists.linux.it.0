Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 297A62DA331
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Dec 2020 23:20:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AFDC23C5839
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Dec 2020 23:19:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 2BD363C0194
 for <ltp@lists.linux.it>; Mon, 14 Dec 2020 23:19:56 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id ADB511A006FD
 for <ltp@lists.linux.it>; Mon, 14 Dec 2020 23:19:55 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7A192AC7F;
 Mon, 14 Dec 2020 22:19:54 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 14 Dec 2020 23:19:42 +0100
Message-Id: <20201214221946.6340-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v5 0/4] TPM 2.0 fixes in IMA tests
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
Cc: Tushar Sugandhi <tusharsu@linux.microsoft.com>,
 linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Mimi, Lakshmi, Tushar,

sending hopefully a final version. This version was done with big help
from Mimi. Mimi, thank you for your help with this!
I'd like to merge it this week and move on for your other IMA patches
(dm-crypt and SELinux).

Could you please test this, specially on TPM 2.0?
I tested it on tpm_tis MSFT0101:00: (Infineon 9665), which does not
export /sys/kernel/security/tpm0/binary_bios_measurements, but
reading PCR with tsspcrread works.

The only problem which bothers me is failure on ima_policy=tcb:

evmctl ima_measurement /sys/kernel/security/integrity/ima/binary_runtime_measurements -vv
...
sha256: PCRAgg  10: c19866f10132282d4cf20ca45f50078db843f95dc8d1ea8819d0e240cdf3b21c
sha256: TPM PCR-10: df913daa0437a2365f710f6d93a4f2d37146414425d9aaa60740dc635d187158
sha256: PCRAgg 10 does not match TPM PCR-10
Failed to match per TPM bank or SHA1 padded TPM digest(s) (count 1446)
errno: No such file or directory (2)

Thus test get failure for the fist run without --ignore-violations
...
ima_tpm 1 TINFO: using command: evmctl ima_boot_aggregate -v
Using tss2-rc-decode to read PCRs.
ima_tpm 1 TINFO: IMA boot aggregate: '0756853d9378ff6473966e20610a8d1cb97e4dc613cb87adf5e870c8eb93fd0f'
ima_tpm 1 TPASS: bios boot aggregate matches IMA boot aggregate
ima_tpm 2 TINFO: verify PCR values
ima_tpm 2 TINFO: real PCR-10: '6d8aec6291c0c19efdee50e20899939135be073cd4d6e9063e53386f54f9487d'
ima_tpm 2 TFAIL: evmctl failed, trying with --ignore-violations
ima_tpm 2 TINFO: aggregate PCR-10: '6d8aec6291c0c19efdee50e20899939135be073cd4d6e9063e53386f54f9487d'
ima_tpm 2 TPASS: aggregate PCR value matches real PCR value
ima_tpm 3 TINFO: AppArmor enabled, this may affect test results
ima_tpm 3 TINFO: it can be disabled with TST_DISABLE_APPARMOR=1 (requires super/root)
ima_tpm 3 TINFO: loaded AppArmor profiles: none

Summary:
passed   2
failed   1
skipped  0
warnings 0

IMHO unless this is specific for this particular TPM we should skip test
if ima_policy=tcb.

I tried LetsTrust TPM 2.0 for raspberry-pi (Infineon SLB9670, connected
over SPI), but that got even worse - TPM is registered after IMA, thus
unusable).

I'd also like you other IMA tests (dm-crypt and SELinux) before LTP release
(sometimes in January), but due summer vacation we have basically just
this week and maybe first week and maybe first week in January.

Changes v4->v5:
* improved TPM 2.0 detection (e.g. check for /dev/tpmrm0 and /dev/tpm0)
* test2: if evmctl ima_measurement fails, run again with --ignore-violations
* test2: assume TPM 2, if not detected
* print TPM kernel config
* cleanup

Kind regards,
Petr

Petr Vorel (4):
  IMA: Move get_algorithm_digest(), set_digest_index() to ima_setup.sh
  IMA: Rewrite ima_boot_aggregate.c to new API
  ima_tpm.sh: Fix calculating boot aggregate
  ima_tpm.sh: Fix calculating PCR aggregate

 .../integrity/ima/src/ima_boot_aggregate.c    | 114 +++---
 .../integrity/ima/tests/ima_measurements.sh   |  62 +---
 .../security/integrity/ima/tests/ima_setup.sh |  84 ++++-
 .../security/integrity/ima/tests/ima_tpm.sh   | 334 +++++++++++++++---
 4 files changed, 422 insertions(+), 172 deletions(-)

-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
