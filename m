Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8985F59977F
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Aug 2022 10:39:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AE0A43CA1E9
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Aug 2022 10:39:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B79403C278D
 for <ltp@lists.linux.it>; Fri, 19 Aug 2022 10:39:28 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0B79E2005FD
 for <ltp@lists.linux.it>; Fri, 19 Aug 2022 10:39:27 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 99CAB375E0;
 Fri, 19 Aug 2022 08:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1660898366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LggA2sTozUIgWaCEOF+uHu2OtFVnfhNLJYtOa7Uvbwk=;
 b=phpLOpwp37PN3rpGATDVwjsHMo2IFnmXSKUKlu5nkKu1f701QEoSsyjs7i9a7eQrWqKcDh
 QbyNjHABF2Dh9+OG/e9C44qpvitrVVwaIzAGone+im684MSSa9GlIsGJMbYtx4oNOXZpDM
 hhwVgvEE1+Dpgs4p3sPEIGfgHixSLyU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1660898366;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LggA2sTozUIgWaCEOF+uHu2OtFVnfhNLJYtOa7Uvbwk=;
 b=OrdQQH6LSN4fTMjatxi21X2b5weRRctHGJ1I68W5wyIFZSzuC+9GLu1Cj9GExN77EfQ2q0
 gDLmzXf5HoPwqJBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8309B13AE9;
 Fri, 19 Aug 2022 08:39:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id m8x1Hz5M/2J+agAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 19 Aug 2022 08:39:26 +0000
Date: Fri, 19 Aug 2022 10:41:23 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <Yv9Msztwn77epwCP@yuki>
References: <YtaFddMFjVPMTpme@rei>
 <CAG4es9Wn+wZRu6xr-FgZ=pTq4ReGdrmsmGYO4ZXvKj8ee3QH8w@mail.gmail.com>
 <CAG4es9XhZ7ksvLxwRNO73FC4DQc7KteUQAUPwipbks6kGsvFmw@mail.gmail.com>
 <YvUhZ/9Yf7eZ4a32@yuki> <YvuRAR1DSi67PDzh@pevik>
 <CAG4es9XdXgmPOQK3i+FL3VD-Y8C39sAShwdM6bi7U-CJjk7BQg@mail.gmail.com>
 <YvyxCXTGYpLd8kbQ@pevik>
 <CAG4es9XkRDYnwDr9huepzGhEiHxWdu40DOK9ouA2yWGqv842ow@mail.gmail.com>
 <CAG4es9WmHd52fmjdt7RBkSXEtnGuC2jkBO6UdCTbaHOq8CDgVw@mail.gmail.com>
 <Yv9F8MnPGyLLE0Zm@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yv9F8MnPGyLLE0Zm@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] syscalls/signal06: add volatile to loop
 variable
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
Cc: kernel-team <kernel-team@android.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Thanks! The bug was closed as 'adding "cx" worked'. Reading topperc's comment it
> looks like there no other way to fix the issue on clang than workaround with
> volatile. Does it mean that it's a syscall problem and clang can do nothing
> about it?

It's problem with the inline assembly in the body of the while loop, the
call to the syscall changes the register value that is used for the D
variable in the case of clang, so the loop exits prematurely. We have to
add cx register to the clobber list for that asm statement so that
compiler knows that it's changed by the assembly.

Interfacing assembly with C is a bit tricky since you have to explain
to compiler which registers are changed from the assembly otherwise the
results are undefined.

The patch should look like:

diff --git a/testcases/kernel/syscalls/signal/signal06.c b/testcases/kernel/syscalls/signal/signal06.c
index 64f886ee3..78efd0fb9 100644
--- a/testcases/kernel/syscalls/signal/signal06.c
+++ b/testcases/kernel/syscalls/signal/signal06.c
@@ -73,7 +73,7 @@ void test(void)
                /* sys_tkill(pid, SIGHUP); asm to avoid save/reload
                 * fp regs around c call */
                asm ("" : : "a"(__NR_tkill), "D"(pid), "S"(SIGHUP));
-               asm ("syscall" : : : "ax");
+               asm ("syscall" : : : "ax", "cx");

                loop++;
        }

Although it may not be a complete as the llwm issue suggests we should
have a look at calling conventions for the syscall and check if we need
to add any other registers to the clobber list.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
