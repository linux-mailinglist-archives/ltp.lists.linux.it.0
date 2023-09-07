Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C93B3797132
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Sep 2023 11:23:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 647C23CC2F6
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Sep 2023 11:23:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BAD523CB8D4
 for <ltp@lists.linux.it>; Thu,  7 Sep 2023 11:22:47 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0651061665E
 for <ltp@lists.linux.it>; Thu,  7 Sep 2023 11:22:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 35EB61F8A8;
 Thu,  7 Sep 2023 09:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694078566; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h0n7UPbUUBtgZ3p9Z82a0inoPOVoC/MZ5FvwswUpB6M=;
 b=T3DjK3Ro+BbH4LyXxEzP8A/kEOAJu/VQTqw76btInCjIn3XruQBNSXY6Bngr06v7kxZISM
 LqI9noR0ZK4FPNfjSxDbQZMzmr7XnghhEFyH6f+mcOKByGSpQhcAp2mJ6K8BBhfTSPcAwV
 D8XmhzLbTc5Xjmo40C/cF3OcubCcXWk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694078566;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h0n7UPbUUBtgZ3p9Z82a0inoPOVoC/MZ5FvwswUpB6M=;
 b=XhnqhX0lrlONtZiAxLopWELEDoGLmkbpjlevZif9gWNk2q2+GgbrwpUhQgJwgaRneUiTWZ
 u2Eg/3tXEMZDxRDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2065E138F9;
 Thu,  7 Sep 2023 09:22:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AJP8BmaW+WSINgAAMHmgww
 (envelope-from <mkittler@suse.de>); Thu, 07 Sep 2023 09:22:46 +0000
From: Marius Kittler <mkittler@suse.de>
To: ltp@lists.linux.it
Date: Thu,  7 Sep 2023 11:22:38 +0200
Message-ID: <20230907092239.15253-3-mkittler@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230907092239.15253-1-mkittler@suse.de>
References: <20230907092239.15253-1-mkittler@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/3] Use correct binary operand in ioctl02.c
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

Signed-off-by: Marius Kittler <mkittler@suse.de>
---
 testcases/kernel/syscalls/ioctl/ioctl02.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/ioctl/ioctl02.c b/testcases/kernel/syscalls/ioctl/ioctl02.c
index 77283e510..72a446f99 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl02.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl02.c
@@ -226,7 +226,7 @@ static int chk_tty_parms(void)
 
 	if (!
 	    (termio.c_lflag
-	     && (ISIG | ICANON | XCASE | ECHO | ECHOE | NOFLSH))) {
+	     & (ISIG | ICANON | XCASE | ECHO | ECHOE | NOFLSH))) {
 		tst_res(TINFO, "lflag has incorrect value. %o",
 			 termio.c_lflag);
 		flag++;
@@ -234,14 +234,14 @@ static int chk_tty_parms(void)
 
 	if (!
 	    (termio.c_iflag
-	     && (BRKINT | IGNPAR | INPCK | ISTRIP | ICRNL | IUCLC | IXON | IXANY
+	     & (BRKINT | IGNPAR | INPCK | ISTRIP | ICRNL | IUCLC | IXON | IXANY
 		 | IXOFF))) {
 		tst_res(TINFO, "iflag has incorrect value. %o",
 			 termio.c_iflag);
 		flag++;
 	}
 
-	if (!(termio.c_oflag && (OPOST | OLCUC | ONLCR | ONOCR))) {
+	if (!(termio.c_oflag & (OPOST | OLCUC | ONLCR | ONOCR))) {
 		tst_res(TINFO, "oflag has incorrect value. %o",
 			 termio.c_oflag);
 		flag++;
-- 
2.41.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
