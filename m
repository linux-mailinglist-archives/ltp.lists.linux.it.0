Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 500C769E13F
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Feb 2023 14:25:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CED943CBCA8
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Feb 2023 14:25:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AD69C3CAFE8
 for <ltp@lists.linux.it>; Tue, 21 Feb 2023 14:25:40 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 35F311000936
 for <ltp@lists.linux.it>; Tue, 21 Feb 2023 14:25:39 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 848B85C64F;
 Tue, 21 Feb 2023 13:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1676985938;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8F36DyklIpX0dWyRElFOEsJONG+UnMTraKuUOAzeP7w=;
 b=OpkMDfGfDCDydbKAglAMpLlk0p0b2D3WshB7R0Sgp24Lo+G8sZdc7V1lYSfPT0STCOszzT
 pCLuWJYGEBQhpRveFK0CDpkDzPkoObV+F043xSlrHPqmZRsxYZIE5LaV5aZeUmifwczuUO
 xozVPO0DmESLMZ8QsBwobWJOoVaHT58=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1676985938;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8F36DyklIpX0dWyRElFOEsJONG+UnMTraKuUOAzeP7w=;
 b=1IUQETF+aafQQuL3S5SGIm5XfxJeKBcw2N5TJY0hM4iR3hH4qZB1BuSJrR2yR12XE76BFe
 gVhcDjMECeYw/FCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 632AC13481;
 Tue, 21 Feb 2023 13:25:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 90j9FlLG9GM0LwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 21 Feb 2023 13:25:38 +0000
Date: Tue, 21 Feb 2023 14:25:37 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <Y/TGURx9r32eVd4P@pevik>
References: <20230219085233.645683-1-ycliang@andestech.com>
 <Y/OjdIvxxmw7p+US@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y/OjdIvxxmw7p+US@rei>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/1] lib/tst_pid.c: Count used pid by
 traversing /proc
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: peterlin@andestech.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

fixed typo in variable name and merged.
Thanks!

Kind regards,
Petr

+++ lib/tst_pid.c
@@ -117,7 +117,7 @@ static int get_used_pids(void (*cleanup_fn) (void))
 	DIR *dir_proc;
 	struct dirent *ent;
 	char status_path[PATH_MAX];
-	int used_thread, used_pids = 0;
+	int used_threads, used_pids = 0;
 
 	dir_proc = SAFE_OPENDIR("/proc");
 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
