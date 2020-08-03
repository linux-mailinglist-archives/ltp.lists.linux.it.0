Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1555123AC0A
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Aug 2020 19:59:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8849E3C335A
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Aug 2020 19:59:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 4409A3C3346
 for <ltp@lists.linux.it>; Mon,  3 Aug 2020 19:59:44 +0200 (CEST)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id B236C200AE0
 for <ltp@lists.linux.it>; Mon,  3 Aug 2020 19:59:43 +0200 (CEST)
Received: from localhost.localdomain (c-73-187-218-229.hsd1.pa.comcast.net
 [73.187.218.229])
 by linux.microsoft.com (Postfix) with ESMTPSA id 272FC20B490A;
 Mon,  3 Aug 2020 10:59:41 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 272FC20B490A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1596477582;
 bh=+dFj7dCuj0185ShJTiqY0XRK9Voy3eIJ3vAQPDuPtos=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G21+stlPx18eHz5jSTg/MuJCj5biz+YUFWi5HaAFTbI7yZxkjgHmGvOchsHdroBi3
 vou3k0GYm9PulHl8IddI44MWjXvzWOEG21T48SBkMo+HrV2q4ZJjM8fJnnSNNEdOEP
 I28leVOF0q237hP+zSvC6s0yPq8rolBk0044jaZ4=
From: Lachlan Sneff <t-josne@linux.microsoft.com>
To: pvorel@suse.cz,
	zohar@linux.ibm.com,
	ltp@lists.linux.it
Date: Mon,  3 Aug 2020 13:59:02 -0400
Message-Id: <20200803175904.40269-2-t-josne@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200803175904.40269-1-t-josne@linux.microsoft.com>
References: <20200803175904.40269-1-t-josne@linux.microsoft.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_PASS,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] IMA: Update key test documentation
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
Cc: tytyhicks@linux.microsoft.com, balajib@linux.microsoft.com,
 nramas@linux.microsoft.com, linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The current documentation for the existing IMA key test was
left in by accident by a previous merge. It does not apply
to the test that is currently included in the LTP.

Update the documentation for the IMA key test.

Signed-off-by: Lachlan Sneff <t-josne@linux.microsoft.com>
---
 .../kernel/security/integrity/ima/README.md   | 22 +++++--------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/testcases/kernel/security/integrity/ima/README.md b/testcases/kernel/security/integrity/ima/README.md
index d4644ba39..2956ac7fd 100644
--- a/testcases/kernel/security/integrity/ima/README.md
+++ b/testcases/kernel/security/integrity/ima/README.md
@@ -15,27 +15,15 @@ Although a custom policy, loaded via dracut, systemd or manually from user
 space, may contain equivalent measurement tcb rules, detecting them would
 require `IMA_READ_POLICY=y` therefore ignore this option.
 
-### IMA key import test
-`ima_keys.sh` requires a x509 public key, by default in `/etc/keys/x509_ima.der`
-(defined in `CONFIG_IMA_X509_PATH` kernel config option).
-The key must be signed by the private key you generate. Follow these instructions:
-https://manpages.ubuntu.com/manpages/disco/man1/evmctl.1.html#generate%20trusted%20keys
-
-The test cannot be set-up automatically because the x509 public key must be
-built into the kernel and loaded onto a trusted keyring
-(e.g. `.builtin_trusted_keys`, `.secondary_trusted_keyring`).
-
-As well as what's required for the IMA tests, the following are also required
-in the kernel configuration:
+### IMA key test
+`ima_keys.sh` requires a readable IMA policy, as well as a loaded policy
+with `func=KEY_CHECK keyrings=...`, see example in `keycheck.policy`.
+
+Mandatory kernel configuration for IMA:
 ```
 CONFIG_IMA_READ_POLICY=y
-CONFIG_IMA_X509_PATH="/etc/keys/x509_ima.der"
-CONFIG_SYSTEM_TRUSTED_KEYRING=y
-CONFIG_SYSTEM_TRUSTED_KEYS="/etc/keys/ima-local-ca.pem"
 ```
 
-Test also requires loaded policy with `func=KEY_CHECK`, see example in `keycheck.policy`.
-
 ### IMA kexec test
 
 `ima_kexec.sh` requires loaded policy which contains `measure func=KEXEC_CMDLINE`,
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
