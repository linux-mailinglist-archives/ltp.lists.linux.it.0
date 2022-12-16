Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2560364E8CD
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Dec 2022 10:46:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BA1963CBC36
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Dec 2022 10:46:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2AD923CBC0A
 for <ltp@lists.linux.it>; Fri, 16 Dec 2022 10:46:18 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 25CD21000CEE
 for <ltp@lists.linux.it>; Fri, 16 Dec 2022 10:46:16 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 540985CBB9;
 Fri, 16 Dec 2022 09:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1671183976; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oXlgsJN1cgJxdnKVEDG0vtq8OLAgacZhbcEl2om3qq8=;
 b=phcCeNmSc48u0qkQYojw6WQ/OLLCC3czfKmaLT+gI9AXE7QztgXv2ilXyTFCW06UqOqxb+
 NWOiMJ6kUag+LQOkZhgxG6gFErWk3IlK8B3tuIuC/RX2i3Yvly17JuzRebctYNXiKdR1CL
 Pz+2IfTF6JCQZl9eP491jPlPP3qjM4Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1671183976;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oXlgsJN1cgJxdnKVEDG0vtq8OLAgacZhbcEl2om3qq8=;
 b=6t7xKIk71ad63pEjbcPNBDs3rnpF7BHGf4vFo38kPpFDLyUAi7FFg5zzsh03B4sevQbDf9
 c2uBsqku0fa7oiDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E3EF1138F0;
 Fri, 16 Dec 2022 09:46:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uGq1Nmc+nGOhVgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 16 Dec 2022 09:46:15 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 16 Dec 2022 10:46:10 +0100
Message-Id: <20221216094611.2924-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221216094611.2924-1-pvorel@suse.cz>
References: <20221216094611.2924-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 1/2] doc: State the minimal kernel version
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 =?UTF-8?q?Jan=20L=C3=BCbbe?= <jlu@pengutronix.de>,
 Khem Raj <raj.khem@gmail.com>, Richard Palethorpe <rpalethorpe@suse.com>,
 automated-testing@lists.yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Because the tested version does not automatically mean the minimal
supported.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi all,

I'm sorry to bother you, many of you concentrate on current mainline (or
supported stable) instead of digging into history. But you might know
about somebody who still cares about 3.x. Although not many of these
people would try to run recent LTP on these old versions, but we never
know.

I started with 3.0 as that was the result of the old discussions over
ML.  I'm perfectly ok, if we raise it to 3.10, which is tested.
I guess after CentOS 7 EOL we should raise support even higher.

The motivation is to state the version here, instead in
doc/c-test-api.txt
https://patchwork.ozlabs.org/project/ltp/patch/1671166923-2173-7-git-send-email-xuyang2018.jy@fujitsu.com/

Also stating kernel version limits minimal libc version.
Thus I'm not going to start a discussion about what libc version we
support.

Kind regards,
Petr

 doc/supported-kernel-libc-versions.txt | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/doc/supported-kernel-libc-versions.txt b/doc/supported-kernel-libc-versions.txt
index e48e3aeae3..f89c4882fb 100644
--- a/doc/supported-kernel-libc-versions.txt
+++ b/doc/supported-kernel-libc-versions.txt
@@ -51,7 +51,12 @@ distribution you may as well reconsider you life choices.
 | s390x         | cross compilation
 |==================================
 
-1.3 Supported libc
+1.3 Minimal supported kernel version
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Minimal supported (although untested) kernel version is 3.0.
+
+1.4 Supported libc
 ~~~~~~~~~~~~~~~~~~
 
 [align="center",options="header"]
-- 
2.39.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
