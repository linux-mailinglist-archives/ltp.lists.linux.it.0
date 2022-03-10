Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BA04D44E9
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Mar 2022 11:45:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 308983C0EC4
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Mar 2022 11:45:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E261B3C0209
 for <ltp@lists.linux.it>; Thu, 10 Mar 2022 11:45:03 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0254F601259
 for <ltp@lists.linux.it>; Thu, 10 Mar 2022 11:45:02 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 78D5A1F38A;
 Thu, 10 Mar 2022 10:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1646909101; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=P4RiRhJ0UgmaZER36K/N6fgZfWMWwRrZgLllMMZvY5g=;
 b=NPnWeNtY6n9dhu+ZSWabnJCH+NNGVXd+87UiG9FZiE4CLL4y0KLzq5YhDOmD+kodrW+zpr
 Y/ZFmBfkUWBraUM9AtkCkqwqXndBEdayWFaDRl/DGR75rI+IFAHB2RXPudw6qcqhe9aE25
 FDi7rHTDwz8LvRjUvAEIw1iJuqR95dc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1646909101;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=P4RiRhJ0UgmaZER36K/N6fgZfWMWwRrZgLllMMZvY5g=;
 b=51ppE6XzOa33rIloWlLaW4sHO2zcnN1gEMlGNs0IAO+NYdJOpB96Ct75HX84Eida09lI0/
 rFEeESNKL1bZ34BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2E64313A3D;
 Thu, 10 Mar 2022 10:45:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lpnpCK3WKWIoeAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 10 Mar 2022 10:45:01 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 10 Mar 2022 11:44:57 +0100
Message-Id: <20220310104457.764-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] smoketest: Add macsec02.sh
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

macsec02.sh is a network tests which uses macsec_lib.sh, which uses
ipsec_lib.sh and virt_lib.sh which use tst_net.sh.

Adding this test to smoketest to cover functionality of nested
libraries. Use macsec02.sh as it requires more setup (unlike macsec01.sh).

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 runtest/smoketest | 1 +
 1 file changed, 1 insertion(+)

diff --git a/runtest/smoketest b/runtest/smoketest
index 7bebe4a42e..b7c539640b 100644
--- a/runtest/smoketest
+++ b/runtest/smoketest
@@ -15,3 +15,4 @@ splice02 splice02 -s 20
 shell_test01 echo "SUCCESS" | shell_pipe01.sh
 ping01 ping01.sh
 ping602 ping02.sh -6
+macsec02 macsec02.sh
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
