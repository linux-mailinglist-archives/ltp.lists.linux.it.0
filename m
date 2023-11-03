Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0A27E060B
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Nov 2023 17:02:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 81A7C3CC802
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Nov 2023 17:02:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1C3CC3CB0C4
 for <ltp@lists.linux.it>; Fri,  3 Nov 2023 17:02:05 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7A8C6100114D
 for <ltp@lists.linux.it>; Fri,  3 Nov 2023 17:02:03 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EE7D6218F2;
 Fri,  3 Nov 2023 16:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1699027322; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=DUxop5RPt4qng5RTfciV/svKhymftHCHCxs/a4OAWqA=;
 b=ZkjvUgE2u2V/jFM6amDllhfUDT6ASdr1whIR5Jk7fDIkPKBd1aIaqX6V2fjRlK6EXI2lNV
 1iKF1J9vEHbXCU0MgltJPRY04vw5PDNGdpH5mzanTUqSMR8cDVqJDMzF9KlkZMbHyMA440
 /7iofj/eEqUwnkVfegafA8cT64bT4BY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1699027322;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=DUxop5RPt4qng5RTfciV/svKhymftHCHCxs/a4OAWqA=;
 b=l7YMkQxBV/evJv7fNmelb9AA2iLKKJCaweg/cF++BQjbiXeaXeRtcUQtDHlhYl+J0eetgd
 Mfkjlj4+uRlsAQCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 97ED413907;
 Fri,  3 Nov 2023 16:02:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iV9JInoZRWWGPgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 03 Nov 2023 16:02:02 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  3 Nov 2023 17:01:57 +0100
Message-ID: <20231103160157.1095924-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] lib/tst_kernel.c: Reuse tst_check_builtin_driver()
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

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 lib/tst_kernel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/tst_kernel.c b/lib/tst_kernel.c
index 4b75ceadb..2e534f451 100644
--- a/lib/tst_kernel.c
+++ b/lib/tst_kernel.c
@@ -193,7 +193,7 @@ int tst_check_builtin_driver(const char *driver)
 int tst_check_driver(const char *driver)
 {
 	if (!tst_search_driver(driver, "modules.dep") ||
-		!tst_search_driver(driver, "modules.builtin"))
+		!tst_check_builtin_driver(driver));
 		return 0;
 
 	return -1;
-- 
2.42.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
