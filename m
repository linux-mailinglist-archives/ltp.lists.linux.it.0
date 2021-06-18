Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C45B3AD226
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Jun 2021 20:30:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A136A3C304F
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Jun 2021 20:30:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E2CF73C231C
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 20:30:26 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E8A3214013B8
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 20:30:25 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0D37221B48;
 Fri, 18 Jun 2021 18:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624041025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LQgGqjMwO4MLORFLYwbB4Q2QR1NezxFrylzUoUFpj/Y=;
 b=woaC6UVBuP8X1bHC9Oru7sgMIh4PV9VoHBwsNrIUocrOs6JfVayvefOtkqzkmnyFWwJDU7
 e8q3f8ve/BpQ4rpA+Kgl5WOih7dTOEKdumCFZTq+v5Homb9SWDpPwx9pnHK533uQmccBsH
 7BD29R9hkHvLj7lMP2AHlkhYd7zB0Rg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624041025;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LQgGqjMwO4MLORFLYwbB4Q2QR1NezxFrylzUoUFpj/Y=;
 b=1xqPTW0gGLPu3BKvmB8Zux/h9LrqEd5p76D5mmh04H7I307AOzHx4APKzEukH+eATLSXUB
 niwM9PGUjxxaPsCg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id E1D18118DD;
 Fri, 18 Jun 2021 18:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624041025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LQgGqjMwO4MLORFLYwbB4Q2QR1NezxFrylzUoUFpj/Y=;
 b=woaC6UVBuP8X1bHC9Oru7sgMIh4PV9VoHBwsNrIUocrOs6JfVayvefOtkqzkmnyFWwJDU7
 e8q3f8ve/BpQ4rpA+Kgl5WOih7dTOEKdumCFZTq+v5Homb9SWDpPwx9pnHK533uQmccBsH
 7BD29R9hkHvLj7lMP2AHlkhYd7zB0Rg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624041025;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LQgGqjMwO4MLORFLYwbB4Q2QR1NezxFrylzUoUFpj/Y=;
 b=1xqPTW0gGLPu3BKvmB8Zux/h9LrqEd5p76D5mmh04H7I307AOzHx4APKzEukH+eATLSXUB
 niwM9PGUjxxaPsCg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id Lv21NkDmzGAiNgAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Fri, 18 Jun 2021 18:30:24 +0000
Date: Fri, 18 Jun 2021 20:04:47 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: xieziyao <xieziyao@huawei.com>
Message-ID: <YMzgP1kOP/LgfKEU@yuki>
References: <20210617105556.130869-1-xieziyao@huawei.com>
 <20210617105556.130869-4-xieziyao@huawei.com>
 <YMyPhiiKwuwEdj7N@yuki>
 <021a65c83ac448e882077e7dabe1667b@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <021a65c83ac448e882077e7dabe1667b@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3 v2] getrusage: Cleanup and bugfix for
 getrusage03
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
Cc: ltp <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Pushed, thanks.

I had to add another fix for the -i parameter.

When the test was executed in a loop it was failing on subsequent
iterations because it expects that the initiali maxrss is 100MB.

So in order to fix that I had to change the run() function, now each
test runs in its own process and starts with a child that consumes
100MB.

Diff:

diff --git a/testcases/kernel/syscalls/getrusage/getrusage03.c b/testcases/kernel/syscalls/getrusage/getrusage03.c
index f72f908dc..ef2f62a18 100644
--- a/testcases/kernel/syscalls/getrusage/getrusage03.c
+++ b/testcases/kernel/syscalls/getrusage/getrusage03.c
@@ -161,12 +161,16 @@ void (*testfunc_list[])(void) = {

 static void run(unsigned int i)
 {
-       testfunc_list[i]();
-}
+       if (!SAFE_FORK()) {
+               if (!SAFE_FORK()) {
+                       consume_mb(100);
+                       exit(0);
+               }

-static void setup(void)
-{
-       consume_mb(100);
+               SAFE_WAIT(NULL);
+
+               testfunc_list[i]();
+       }
 }

 static struct tst_test test = {
@@ -177,7 +181,6 @@ static struct tst_test test = {
        .tags = (const struct tst_tag[]) {
                {"linux-git", "1f10206cf8e9"},
        },
-       .setup = setup,
        .test = run,
        .tcnt = ARRAY_SIZE(testfunc_list),
 };

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
