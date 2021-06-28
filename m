Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1900C3B65A6
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 17:30:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5AF043C1C00
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 17:30:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 456343C0F90
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 17:30:40 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D50C81400C5F
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 17:30:39 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 442EA22494;
 Mon, 28 Jun 2021 15:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624894239; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3wgrDo3WeY8V1puyL6l9DSF0bYhLH4o6oJbSt3BRC50=;
 b=gJQlnlrI0MOBYxkVXKPaTa6OjXAcWxgf85nATbu+7EA6aptUXQGkvojyviOoPFYD29Aq/d
 oJfLIU+hkqh8KoEYlNBrNE9uQioz7lBNE1i5eACPbW16snwnPnWKZE76JaoJ56WUYR83T2
 FxkF/DRQwgT4dlVBGD2Nbo4gLFwBXlI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624894239;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3wgrDo3WeY8V1puyL6l9DSF0bYhLH4o6oJbSt3BRC50=;
 b=Mk2IAwUJopomQlF8vBsykUaJliMwNM4A3Bjg2GNcOCQr94YCv2n1PooEVgGb7I9Rvt9URM
 PSehg+u2AUMfKQAA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 23C5F11906;
 Mon, 28 Jun 2021 15:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624894239; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3wgrDo3WeY8V1puyL6l9DSF0bYhLH4o6oJbSt3BRC50=;
 b=gJQlnlrI0MOBYxkVXKPaTa6OjXAcWxgf85nATbu+7EA6aptUXQGkvojyviOoPFYD29Aq/d
 oJfLIU+hkqh8KoEYlNBrNE9uQioz7lBNE1i5eACPbW16snwnPnWKZE76JaoJ56WUYR83T2
 FxkF/DRQwgT4dlVBGD2Nbo4gLFwBXlI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624894239;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3wgrDo3WeY8V1puyL6l9DSF0bYhLH4o6oJbSt3BRC50=;
 b=Mk2IAwUJopomQlF8vBsykUaJliMwNM4A3Bjg2GNcOCQr94YCv2n1PooEVgGb7I9Rvt9URM
 PSehg+u2AUMfKQAA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id Sb1oBx/r2WBBLwAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Mon, 28 Jun 2021 15:30:39 +0000
Date: Mon, 28 Jun 2021 17:05:05 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Message-ID: <YNnlIVB9M4/11JmT@yuki>
References: <YNM4rlDJLzb4xk6v@yuki>
 <1624512827-3256-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1624512827-3256-3-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1624512827-3256-3-git-send-email-xuyang2018.jy@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/3] syscalls/shmget*: Convert into new api
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
Pushed with a minor changes, thanks.

diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget03.c b/testcases/kernel/syscalls/ipc/shmget/shmget03.c
index 81841788c..efbc465e1 100644
--- a/testcases/kernel/syscalls/ipc/shmget/shmget03.c
+++ b/testcases/kernel/syscalls/ipc/shmget/shmget03.c
@@ -41,7 +41,6 @@ static void setup(void)
 
        queues = SAFE_MALLOC(maxshms * sizeof(int));
        for (num = 0; num < maxshms; num++) {
-               queues[num] = -1;
                res = shmget(shmkey + num, SHM_SIZE, IPC_CREAT | IPC_EXCL | SHM_RW);
                if (res == -1)
                        tst_brk(TBROK | TERRNO, "shmget failed unexpectedly");
@@ -59,10 +58,8 @@ static void cleanup(void)
        if (!queues)
                return;
 
-       for (num = 0; num < queue_cnt; num++) {
-               if (queues[num] != -1)
-                       SAFE_SHMCTL(queues[num], IPC_RMID, NULL);
-       }
+       for (num = 0; num < queue_cnt; num++)
+               SAFE_SHMCTL(queues[num], IPC_RMID, NULL);
 
        free(queues);
 }

As there is no need to check for -1 and pre-initialize the array
anymore.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
