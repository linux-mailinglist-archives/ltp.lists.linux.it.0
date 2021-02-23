Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 70111323400
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 00:00:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F3E963C60DB
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Feb 2021 23:59:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 38CE23C2BEF
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 23:59:39 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 75AF91000A3A
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 23:59:38 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AFF4EAC69;
 Tue, 23 Feb 2021 22:59:37 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 23 Feb 2021 23:59:28 +0100
Message-Id: <20210223225930.27095-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v3 0/2]	IMA: Add test for dm-crypt measurement
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
Cc: snitzer@redhat.com, Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 dm-devel@redhat.com, Tushar Sugandhi <tusharsu@linux.microsoft.com>,
 linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>,
 gmazyland@gmail.com, agk@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!

I updated Tushar's patchset to speedup things.

Changes v2->v3
* rename function s/check_ima_ascii_log_for_policy/test_policy_measurement/
* move tst_res TPASS/TFAIL into test_policy_measurement()
* drop template=ima-buf (see Lakshmi's patch [1] and discussion about
  it, it will be removed from ima_keys.sh as well)
* moved ima_dm_crypt.sh specific changes to second commit
* further API and style related cleanup

Could you please check this patchset?

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/patch/20210222023421.12576-1-nramas@linux.microsoft.com/

Tushar Sugandhi (2):
  IMA: Generalize key measurement tests
  IMA: Add test for dm-crypt measurement

 runtest/ima                                   |  1 +
 .../kernel/security/integrity/ima/README.md   | 20 ++++++
 .../integrity/ima/tests/ima_dm_crypt.sh       | 41 +++++++++++
 .../security/integrity/ima/tests/ima_keys.sh  | 58 ++-------------
 .../security/integrity/ima/tests/ima_setup.sh | 71 +++++++++++++++++++
 5 files changed, 139 insertions(+), 52 deletions(-)
 create mode 100755 testcases/kernel/security/integrity/ima/tests/ima_dm_crypt.sh

-- 
2.30.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
