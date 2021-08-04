Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 251563E02B6
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 16:05:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A9B6D3C80BC
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 16:05:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E1A943C7FEB
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 16:05:19 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6A97B601496
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 16:05:19 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 51F1820141;
 Wed,  4 Aug 2021 14:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628085918; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7H30HGg/oRa/auU5JfFXW50E1StrkSWi3gTu2ZV7HHg=;
 b=pGu4ZlZjMeT/RCiPwsj37qpQN7AxF+LpraqlPJRCLmqVNOAaZ46xL5RRvFbHCKCBBw0jJt
 jIa24CB/Mfopuwr+kLsOqRlpmK5qD/uF8lDjAubYi2YoookQUs0C0IM2c7GWLSSq/b9ueL
 43Sz0gYVbhyRysdEsATRcvqNpAS2Idg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628085918;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7H30HGg/oRa/auU5JfFXW50E1StrkSWi3gTu2ZV7HHg=;
 b=JEYl6jUaxyFLiJGJzo3V5K4GdTmgay9bKDY2UdhGzqzBmgAn3JlwYKBKRJAWWfEimysaEt
 6uiEdTSuCgohQyAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2B9B113B3C;
 Wed,  4 Aug 2021 14:05:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id h4AECp6eCmEkaQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 04 Aug 2021 14:05:18 +0000
Date: Wed, 4 Aug 2021 16:05:26 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YQqepmX0gmdpSqn5@yuki>
References: <20210715050812.1950884-1-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210715050812.1950884-1-lkml@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] squashfs: Add regression test for sanity check
 bug
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Pushed with minor changes, thanks.

Apart from removing the needs_tmpdir I've also changed the TPASS message
to something more meaningful and move the TINFO message to setup so that
it's not printed on each iteration.

Full diff:

diff --git a/testcases/kernel/fs/squashfs/squashfs01.c b/testcases/kernel/fs/squashfs/squashfs01.c
index f02c91f83..502de419d 100644
--- a/testcases/kernel/fs/squashfs/squashfs01.c
+++ b/testcases/kernel/fs/squashfs/squashfs01.c
@@ -51,6 +51,8 @@ static void setup(void)
 {
 	int i;
 
+	tst_res(TINFO, "Test squashfs sanity check regressions");
+
 	SAFE_MKDIR(DATA_DIR, 0777);
 
 	for (i = 0; i < 2048; ++i) {
@@ -85,8 +87,6 @@ static void setup(void)
 
 static void run(void)
 {
-	tst_res(TINFO, "Test squashfs sanity check regressions");
-
 	if (mount(tst_device->dev, MOUNT_DIR, "squashfs", 0, NULL) != 0)
 		tst_brk(TFAIL | TERRNO, "Mount failed");
 	mounted = 1;
@@ -94,7 +94,7 @@ static void run(void)
 	SAFE_UMOUNT("mnt");
 	mounted = 0;
 
-	tst_res(TPASS, "Test passed");
+	tst_res(TPASS, "Regression not detected");
 }
 
 static struct tst_test test = {
@@ -117,5 +117,4 @@ static struct tst_test test = {
 		{"linux-git", "8b44ca2b634"},
 		{}
 	},
-	.needs_tmpdir = 1,
 };

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
