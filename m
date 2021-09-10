Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 669EB406CAC
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Sep 2021 15:09:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B30523C8C76
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Sep 2021 15:09:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2D76F3C8C74
 for <ltp@lists.linux.it>; Fri, 10 Sep 2021 15:08:31 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C4C131A0115E
 for <ltp@lists.linux.it>; Fri, 10 Sep 2021 15:08:30 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 74B3A20218;
 Fri, 10 Sep 2021 13:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631279310; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0LzlYApoRywjdk4j+dQfprpLu6F/4ms/bWpTWfgeo9w=;
 b=ZTL7b0Vr4xOzBJJa+ycSa8zuAfCa9Q+vIsP2xeX7fPPgHHCDiTDF9SL4rSLxZCaRtTENo6
 uLZI6Int6MnU1ORjMZHB2iISYC1oX/DCO2KwVE34HfSG49KiSPCtNvWa2QtM+z/Aw2Wmvh
 NdgaPx/e39RykwTPXFBgg5Hu3TJ46Y4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631279310;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0LzlYApoRywjdk4j+dQfprpLu6F/4ms/bWpTWfgeo9w=;
 b=Oa6Y3vhpYZ1YyB17lCUGliyPk5pphIUNdcq+0CmNCz7rH2OKJZKbWBKMNuF96f14ldiJD/
 DPVv3FQz0+OgaFAg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 4772F133D0;
 Fri, 10 Sep 2021 13:08:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id cFgtD85YO2HKdAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Fri, 10 Sep 2021 13:08:30 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 10 Sep 2021 15:08:20 +0200
Message-Id: <20210910130820.21141-8-pvorel@suse.cz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210910130820.21141-1-pvorel@suse.cz>
References: <20210910130820.21141-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 7/7] sched/process.c: Remove useless TRUE FALSE
 definitions
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

FALSE is not used at all and replace TRUE with 1 (there is no point
trying to use true from <stdbool.h> just for while).

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/sched/process_stress/process.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/testcases/kernel/sched/process_stress/process.c b/testcases/kernel/sched/process_stress/process.c
index b66908e7a..9075305e1 100644
--- a/testcases/kernel/sched/process_stress/process.c
+++ b/testcases/kernel/sched/process_stress/process.c
@@ -46,13 +46,6 @@
 #define MAXBVAL 70
 #define MAXDVAL 11
 
-#ifndef TRUE
-#define TRUE 1
-#endif
-#ifndef FALSE
-#define FALSE 0
-#endif
-
 #ifdef DEBUG
 #define prtln()	printf("At line number: %d\n", __LINE__); \
 		fflush(NULL)
@@ -200,7 +193,7 @@ int send_message(int id, mtyp_t type, char *text)
 
 	strcpy(sndbuf.mtext, text);
 	sndbuf.mtyp = type;
-	while (TRUE) {
+	while (1) {
 		rc = msgsnd(id, &sndbuf, sizeof(struct messagebuf), IPC_NOWAIT);
 		if (rc == -1 && errno == EAGAIN) {
 			debugout("msgqueue %d of mtyp %d not ready to send\n",
@@ -992,7 +985,7 @@ void messenger(void)
 	 *  Infinite loop used to receive error messages from children and
 	 *  to terminate process tree.
 	 */
-	while (TRUE) {
+	while (1) {
 		rc = msgrcv(msgerr, &rcvbuf, sizeof(struct messagebuf), 0, 0);
 		if (rc == -1) {
 			switch (errno) {
-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
