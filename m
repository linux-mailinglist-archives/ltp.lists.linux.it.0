Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 29402552CE3
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jun 2022 10:25:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 445CF3C93D9
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jun 2022 10:25:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6C4DB3C21D9
 for <ltp@lists.linux.it>; Tue, 21 Jun 2022 10:25:31 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4BB961A002CF
 for <ltp@lists.linux.it>; Tue, 21 Jun 2022 10:25:29 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 33EA322068;
 Tue, 21 Jun 2022 08:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1655799929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O1zLghUx5jnfgMUOs9tAgHJt14RIRZTti+UayVBVRIQ=;
 b=X6XyFIJPhOi8X8CRG/aySZrXafBPygvl3nOpl2LUDqXYQNWF8um+XNKePcKyNmSoAdv+1U
 tyV/YFRZUe7zDjpxHIS+r5BGTOZUgZ2X7613HAbvzvGB1fE0abe1ECpIz9hgxfkwO+vi/x
 OSggW81WBmIzIFnDfzuOvmU1YCQNAoc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1655799929;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O1zLghUx5jnfgMUOs9tAgHJt14RIRZTti+UayVBVRIQ=;
 b=hvO7bfwBVfwR/BoPA8JFhtyxI74mT01ZHgit/5HMKWY/NdwVO94yHSJ1f27TvcNn/oGEd/
 8HPpsjA5jvK/4jBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2116D13A88;
 Tue, 21 Jun 2022 08:25:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8nxFB3mAsWJ5BAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 21 Jun 2022 08:25:29 +0000
Date: Tue, 21 Jun 2022 10:27:36 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <YrGA+HbsJEUSHkcR@yuki>
References: <2873e7f25ac44d2c103a030bfc5f1d30e0fe80a9.1655795105.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2873e7f25ac44d2c103a030bfc5f1d30e0fe80a9.1655795105.git.jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/migrate_pages03: restore runtime to 5m
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Arches with large pages have trouble completing all loops in 30s,
> restore runtime to 5m.

Can we please also exit the test when it's out of runtime?

The whole point of runtime is that test inner loop actively checks for
remaining runtime so that the runtime is capped.

Should be as easy as:

diff --git a/testcases/kernel/syscalls/migrate_pages/migrate_pages03.c b/testcases/kernel/syscalls/migrate_pages/migrate_pages03.c
index c6afb4cce..2866c96e6 100644
--- a/testcases/kernel/syscalls/migrate_pages/migrate_pages03.c
+++ b/testcases/kernel/syscalls/migrate_pages/migrate_pages03.c
@@ -127,6 +127,11 @@ static void migrate_test(void)
                        tst_res(TFAIL | TERRNO, "migrate_pages() failed");
                        return;
                }
+
+               if (!tst_remaining_runtime()) {
+                       tst_res(TINFO, "Out of runtime, exitting...");
+                       break;
+               }
        }
        SAFE_SETEUID(0);

@@ -134,6 +139,7 @@ static void migrate_test(void)
 }

 static struct tst_test test = {
+       .max_runtime = 300,
        .min_kver = "2.6.32",
        .needs_root = 1,
        .setup = setup,

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
