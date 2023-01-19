Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D636736A7
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Jan 2023 12:20:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F409C3CC836
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Jan 2023 12:20:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BC4313CC825
 for <ltp@lists.linux.it>; Thu, 19 Jan 2023 12:20:47 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0294F1000F29
 for <ltp@lists.linux.it>; Thu, 19 Jan 2023 12:20:46 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BBF40378D8;
 Thu, 19 Jan 2023 11:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1674127245; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ZZR3DLD2UB3G9DEKJdvh/ftjhVBh+nC6tYtKWW0yArc=;
 b=c1kWlQIoJSU3bfgXUvWAoUJJmVy9tlAtPqZ0AdBERV0y57GQu/waDnN2VWjnZ7lb10ehgb
 7QON4VP0PBQ4IJsq7leaL8o+ku++5qATKM99TaGSLKXJKf+oTyaBCNnvd1/NNwsvpfjGYe
 ZXxzk47fo+fhyT86CwxZ/1rILrdheRs=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7FDB7134F5;
 Thu, 19 Jan 2023 11:20:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xmBZHI0nyWMPOgAAMHmgww
 (envelope-from <andrea.cervesato@suse.com>); Thu, 19 Jan 2023 11:20:45 +0000
To: ltp@lists.linux.it
Date: Thu, 19 Jan 2023 12:18:54 +0100
Message-Id: <20230119111854.13844-1-andrea.cervesato@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v1] tools/runltp-ng: Updated to increase stability
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Update submodule to e842511 (Cleanup session module).
Include commits:

e842511 ("Cleanup session module")
75c97e8 ("Inject env variables inside SUT via option")
4ad85fb ("Kill qemu properly if communication fails")
99f7e92 ("Stabilize SUT reboot during tests execution")

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 tools/runltp-ng | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/runltp-ng b/tools/runltp-ng
index 99f7e92a6..e842511ed 160000
--- a/tools/runltp-ng
+++ b/tools/runltp-ng
@@ -1 +1 @@
-Subproject commit 99f7e92a6c617223039c7aa2f07f4bef9f1e4486
+Subproject commit e842511ed2c680e3b2ea6dec790913a41d5ed937
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
