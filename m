Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D352250BA69
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Apr 2022 16:42:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9CF753CA71A
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Apr 2022 16:42:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1A7FE3C8765
 for <ltp@lists.linux.it>; Fri, 22 Apr 2022 16:41:49 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9227E2009E6
 for <ltp@lists.linux.it>; Fri, 22 Apr 2022 16:41:48 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1FE011F748;
 Fri, 22 Apr 2022 14:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1650638508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NwInHVsJ/9Alcj/MOU+5+Zx1qaT7tZ7Uw/ORGxZ4ccY=;
 b=HSExKRrPyo+4x6okDCa3BuCPj1+X8WKq030QmrxCMqB79l5i6Vq0vPrPc97JsTMCwz7zr/
 WNW0xdHOuSGSH6lGX0WAulbXMRS22zyXjGOtMlOiBlYhzxBhNFWmHC3ozwO2bVEwgiuRAu
 F9NAJtdvBtNbShdFUsY/QWCoXxQmAgc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1650638508;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NwInHVsJ/9Alcj/MOU+5+Zx1qaT7tZ7Uw/ORGxZ4ccY=;
 b=4giUlGz4tRp4zeur1HaWex5rNBi5iWPlGTc8Y2CaxH0J8BqwPS3GjFIFV8ANPrl+sWI94j
 JqhxYyiRXn+dBDDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D3C2113AEC;
 Fri, 22 Apr 2022 14:41:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2HZbMqu+YmKUCwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 22 Apr 2022 14:41:47 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 22 Apr 2022 16:41:41 +0200
Message-Id: <20220422144141.16848-5-pvorel@suse.cz>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220422144141.16848-1-pvorel@suse.cz>
References: <20220422144141.16848-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 4/4] doc: Update shell API examples
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
Cc: Martin Doucha <martin.doucha@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Changes v1->v2:
* Updates related to 1st and 2nd commit.

 doc/library-api-writing-guidelines.txt | 11 +++++++----
 doc/shell-test-api.txt                 |  8 ++++++++
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/doc/library-api-writing-guidelines.txt b/doc/library-api-writing-guidelines.txt
index 9e926e9713..06b617e693 100644
--- a/doc/library-api-writing-guidelines.txt
+++ b/doc/library-api-writing-guidelines.txt
@@ -67,17 +67,20 @@ Changes in the shell API should not introduce uncommon dependencies
 
 Besides shell API libraries in 'testcases/lib' it's worth to put common code
 for particular tests into shell library. The filename should end '_lib.sh',
-they should load 'tst_test.sh' or 'tst_net.sh'.
+they should load 'tst_test.sh' or 'tst_net.sh' at the end of the file.
 
 Shell libraries should have conditional expansion for 'TST_SETUP' or 'TST_CLEANUP',
 to avoid surprises when test specific setup/cleanup function is redefined by
-shell library.
+shell library. Although there is not an optimal general solution because
+usually test which have specific setup/cleanup also needs to call library
+setup/cleanup, but it's better not to require 'TST_SETUP' or 'TST_CLEANUP' to
+be on specific place.
 
 [source,sh]
 -------------------------------------------------------------------------------
 # ipsec_lib.sh
 # SPDX-License-Identifier: GPL-2.0-or-later
-TST_SETUP=${TST_SETUP:-ipsec_lib_setup}
-. tst_test.sh
+TST_SETUP="${TST_SETUP:-ipsec_lib_setup}"
 ...
+. tst_test.sh
 -------------------------------------------------------------------------------
diff --git a/doc/shell-test-api.txt b/doc/shell-test-api.txt
index 4c16f36250..df5ebbdf0d 100644
--- a/doc/shell-test-api.txt
+++ b/doc/shell-test-api.txt
@@ -40,6 +40,7 @@ do_test()
 	fi
 }
 
+. tst_test.sh
 tst_run
 -------------------------------------------------------------------------------
 
@@ -90,6 +91,7 @@ test2()
 	tst_res TPASS "Test $1 passed"
 }
 
+. tst_test.sh
 tst_run
 # output:
 # foo 1 TPASS: Test 1 passed
@@ -118,6 +120,7 @@ do_test()
 	esac
 }
 
+. tst_test.sh
 tst_run
 # output:
 # foo 1 TPASS: Test 1 passed
@@ -145,6 +148,7 @@ do_test()
 	tst_res TPASS "Test $1 passed with data '$2'"
 }
 
+. tst_test.sh
 tst_run
 # output:
 # foo 1 TPASS: Test 1 passed with data 'foo'
@@ -174,6 +178,7 @@ do_test()
 	esac
 }
 
+. tst_test.sh
 tst_run
 # output:
 # foo 1 TPASS: Test 1 passed with data 'foo'
@@ -278,6 +283,7 @@ do_test()
 	...
 }
 
+. tst_test.sh
 tst_run
 -------------------------------------------------------------------------------
 
@@ -337,6 +343,7 @@ do_test()
 	...
 }
 
+. tst_test.sh
 tst_run
 -------------------------------------------------------------------------------
 
@@ -379,6 +386,7 @@ do_test()
 	...
 }
 
+. tst_test.sh
 tst_run
 -------------------------------------------------------------------------------
 
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
