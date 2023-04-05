Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0108F6D7B30
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Apr 2023 13:23:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5BA223CC783
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Apr 2023 13:23:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E5C3D3C9908
 for <ltp@lists.linux.it>; Wed,  5 Apr 2023 13:23:47 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3A55D10009A1
 for <ltp@lists.linux.it>; Wed,  5 Apr 2023 13:23:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 67B2C20685
 for <ltp@lists.linux.it>; Wed,  5 Apr 2023 11:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680693826; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ww/hSinR5vEGvdqDVVavnFaI1Pt7PcdabMRfheJG8tA=;
 b=cVzWZSUFXgEFps+L3L/91zHTLNv6A83UB1LqKVHYiUqRONgfORnEIrsFa66NuQTB/aX1gW
 SsugW8+QJmzOzkn6+aW2tb/3XG9aS/MMQkV/BYMufeo2cF8FKbqXjCsVB0bU9XTH8TmrK3
 tpnfiSGzxxBmnAOiCZglqxfz8w7w0r4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680693826;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ww/hSinR5vEGvdqDVVavnFaI1Pt7PcdabMRfheJG8tA=;
 b=EDQNgZXFITBFDU7WMjNR9MFdAqrLSxXHAvUp80LqvaBlUK6pHZYuBSCHhZFHejCDXaZe9x
 Fq8EZ6sIbfV8ERDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0EE3E13A31
 for <ltp@lists.linux.it>; Wed,  5 Apr 2023 11:23:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lcsxNkFaLWTBIgAAMHmgww
 (envelope-from <akumar@suse.de>)
 for <ltp@lists.linux.it>; Wed, 05 Apr 2023 11:23:45 +0000
From: Avinesh Kumar <akumar@suse.de>
To: ltp@lists.linux.it
Date: Wed,  5 Apr 2023 16:53:44 +0530
Message-Id: <20230405112344.7391-1-akumar@suse.de>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] doc/c-test-api.txt: Correct TST_EXP_POSITIVE
 documentation
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

TST_EXP_POSITIVE() macro returns PASS result for zero value also.

If we have any test scenarios which should pass only for values
greater than zero, then we should rename this to something like
TST_EXP_NON_NEG() and add new macro for only >0 values.

Signed-off-by: Avinesh Kumar <akumar@suse.de>
---
 doc/c-test-api.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/doc/c-test-api.txt b/doc/c-test-api.txt
index 11f87def2..6f12fa63b 100644
--- a/doc/c-test-api.txt
+++ b/doc/c-test-api.txt
@@ -353,8 +353,8 @@ if (!TST_PASS)
 	return;
 -------------------------------------------------------------------------------
 
-If the return value of 'wait' is positive. This macro will print a pass result
-and set +TST_PASS+ appropriately. If the return value is zero or negative, then
+If the return value of 'wait' is positive or zero, this macro will print a pass
+result and set +TST_PASS+ appropriately. If the return value is negative, then
 it will print fail.  There are many similar macros to those shown here, please
 see 'tst_test_macros.h'.
 
-- 
2.40.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
