Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9480A7C6C3D
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Oct 2023 13:25:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 50AE33CD433
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Oct 2023 13:25:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A39DC3CD3F4
 for <ltp@lists.linux.it>; Thu, 12 Oct 2023 13:25:56 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 053321A00A2A
 for <ltp@lists.linux.it>; Thu, 12 Oct 2023 13:25:55 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A9E25211BD;
 Thu, 12 Oct 2023 11:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1697109954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nm59mcL+dAIkEHeQW3L9A3Tu0zlCasmIdiNHkQQlDyA=;
 b=DKsN+SVpyQy5tNvt69LtC5yXk0UiX17q1QnUorK1CB8YqFFhMQyyRzf39MF0KHp17oTmTN
 qEsVauuJPuNcrl3HT/6WZ52RhdJWw1zDY20qhoZ5C/6KS1pWZ2Goms9MyBdgZWk6jN5KOQ
 6pRVd/RGlTPk6+uZTVfvl/Fl2MPZQ20=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 90FD5139ED;
 Thu, 12 Oct 2023 11:25:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YJdpE8HXJ2UmLwAAMHmgww
 (envelope-from <wegao@suse.com>); Thu, 12 Oct 2023 11:25:53 +0000
To: ltp@lists.linux.it
Date: Thu, 12 Oct 2023 07:25:48 -0400
Message-Id: <20231012112548.6887-1-wegao@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231012111333.32004-1-wegao@suse.com>
References: <20231012111333.32004-1-wegao@suse.com>
MIME-Version: 1.0
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.90
X-Spamd-Result: default: False [0.90 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 BROKEN_CONTENT_TYPE(1.50)[]; NEURAL_HAM_LONG(-3.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.com:s=susede1];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; RCPT_COUNT_TWO(0.00)[2];
 MID_CONTAINS_FROM(1.00)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2] Add test for UI_GET_NAME ioctl
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Fix:#573
Signed-off-by: Wei Gao <wegao@suse.com>
---
 testcases/kernel/input/input_helper.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/input/input_helper.c b/testcases/kernel/input/input_helper.c
index 09530fb4d..8f7d6b523 100644
--- a/testcases/kernel/input/input_helper.c
+++ b/testcases/kernel/input/input_helper.c
@@ -32,6 +32,7 @@
 
 static int uinput_loaded;
 static int check_device(void);
+static int check_ui_get_sysname_ioctl(int fd);
 
 static int try_open_device(void)
 {
@@ -185,6 +186,28 @@ void send_rel_move(int fd, int x, int y)
 	send_event(fd, EV_SYN, 0, 0);
 }
 
+static int check_ui_get_sysname_ioctl(int fd)
+{
+	char name[256];
+
+	SAFE_IOCTL(NULL, fd, UI_GET_SYSNAME(sizeof(name)), name, NULL);
+
+	DIR *test_dir;
+
+	struct dirent *ent;
+
+	test_dir = SAFE_OPENDIR(NULL, "/sys/devices/virtual/input/");
+
+	while ((ent = SAFE_READDIR(NULL, test_dir))) {
+		if (!strcmp(ent->d_name, name))
+			return 1;
+		else
+			continue;
+	}
+
+	return 0;
+}
+
 void create_device(int fd)
 {
 	int nb;
@@ -202,7 +225,7 @@ void create_device(int fd)
 	SAFE_IOCTL(NULL, fd, UI_DEV_CREATE, NULL);
 
 	for (nb = 100; nb > 0; nb--) {
-		if (check_device())
+		if (check_device() && check_ui_get_sysname_ioctl(fd))
 			return;
 		usleep(10000);
 	}
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
