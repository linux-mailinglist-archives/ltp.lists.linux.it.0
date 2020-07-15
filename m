Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E1238220D8A
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jul 2020 15:00:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9CED03C2AB0
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jul 2020 15:00:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id B5B9D3C298D
 for <ltp@lists.linux.it>; Wed, 15 Jul 2020 15:00:44 +0200 (CEST)
Received: from mx2.suse.de (unknown [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 16ACC20136C
 for <ltp@lists.linux.it>; Wed, 15 Jul 2020 15:00:43 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DBF74B053;
 Wed, 15 Jul 2020 13:00:45 +0000 (UTC)
Date: Wed, 15 Jul 2020 15:00:41 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Lachlan Sneff <t-josne@linux.microsoft.com>
Message-ID: <20200715130041.GA32414@dell5510>
References: <20200714181703.6374-1-t-josne@linux.microsoft.com>
 <20200714181703.6374-2-t-josne@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714181703.6374-2-t-josne@linux.microsoft.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.3 required=7.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 1/2] IMA: Add a test to verify measurment of
 keys
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: nramas@linux.microsoft.com, linux-integrity@vger.kernel.org,
 ltp@lists.linux.it, balajib@linux.microsoft.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Lachlan, Mimi,

> Add a testcase that verifies that the IMA subsystem has correctly
> measured keys added to keyrings specified in the IMA policy file.

> Additionally, add support for handling a new IMA template descriptor,
> namely ima-buf[1], in the IMA measurement tests.

To speedup things, based on Mimi's comments and review of v4 I pushed this first
commit with few changes (below diff, only ima_keys.sh part)
* simplify error handling ($fail is not needed; I used tst_res and return
  because there will be second test, otherwise I'd use tst_brk)
* added modified docs into this commit
* fix commit title

TODO
* I'll send a patch to read CONFIG_IMA_X509_PATH (I've amended the commit
already enough)

* @Lachlan: expect you send another version for test2.

* @Lachlan: would you also implement Mimi's suggestion? [1]:
An additional test might be to verify that only the keys in the
measurement list are actually on the specified keyring and nothing
else.

Kind regards,
Petr

[1] http://lists.linux.it/pipermail/ltp/2020-July/018018.html

diff --git testcases/kernel/security/integrity/ima/tests/ima_keys.sh testcases/kernel/security/integrity/ima/tests/ima_keys.sh
index 4d53cd04f..904b7515b 100755
--- testcases/kernel/security/integrity/ima/tests/ima_keys.sh
+++ testcases/kernel/security/integrity/ima/tests/ima_keys.sh
@@ -15,7 +15,7 @@ TST_NEEDS_DEVICE=1
 # (450d0fd51564 - "IMA: Call workqueue functions to measure queued keys")
 test1()
 {
-	local keyrings keycheck_lines keycheck_line templates test_file="file.txt" fail
+	local keyrings keycheck_lines keycheck_line templates test_file="file.txt"
 
 	tst_res TINFO "verifying key measurement for keyrings and templates specified in IMA policy file"
 
@@ -57,15 +57,12 @@ test1()
 			tst_brk TCONF "cannot compute digest for $algorithm"
 
 		if [ "$digest" != "$expected_digest" ]; then
-			fail=1
 			tst_res TFAIL "incorrect digest was found for the ($keyring) keyring"
-			break
+			return
 		fi
 	done
 
-	if [ "$fail" ]; then
-		tst_res TPASS "specified keyrings were measured correctly"
-	fi
+	tst_res TPASS "specified keyrings were measured correctly"
 }
 
 tst_run

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
