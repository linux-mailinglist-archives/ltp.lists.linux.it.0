Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E265997F7
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Aug 2022 11:00:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1D9673CA1D5
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Aug 2022 11:00:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7D9783CA1A4
 for <ltp@lists.linux.it>; Fri, 19 Aug 2022 11:00:09 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B5235601117
 for <ltp@lists.linux.it>; Fri, 19 Aug 2022 11:00:07 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 89D83338E0;
 Fri, 19 Aug 2022 09:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1660899607; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M0G7AaNOX3PaAu1DDr6Tc9oQgbtJfuDj2oaukqkNAbI=;
 b=BnWt7nPOEp5OKUlXJkNoNzU5gY+CBqJ3ouQXE0WXaQhZh2VymKwRhaLNjOBIxFxpjraLCH
 zI9wJFPDyiqlDUi5ylhkbs7GnyQk72J6SQCYU4hjd06ycFrif3gokl6S2tpgtsFyKaq7zj
 NXhqv8VaUX+RRTgUjxOnsAhLDRgm/As=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1660899607;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M0G7AaNOX3PaAu1DDr6Tc9oQgbtJfuDj2oaukqkNAbI=;
 b=SjuawvvuLmhvqaFwfS4C9eCHagm1tGbtIuB5wxvegXJM352D0J8TRUQ40vXaft2Fpcckpu
 CWu11cWJUxe7K8AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7238313AE9;
 Fri, 19 Aug 2022 09:00:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hYHzGhdR/2JzcgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 19 Aug 2022 09:00:07 +0000
Date: Fri, 19 Aug 2022 11:02:04 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <Yv9RjDQ1B3euepWH@yuki>
References: <CAG4es9Wn+wZRu6xr-FgZ=pTq4ReGdrmsmGYO4ZXvKj8ee3QH8w@mail.gmail.com>
 <CAG4es9XhZ7ksvLxwRNO73FC4DQc7KteUQAUPwipbks6kGsvFmw@mail.gmail.com>
 <YvUhZ/9Yf7eZ4a32@yuki> <YvuRAR1DSi67PDzh@pevik>
 <CAG4es9XdXgmPOQK3i+FL3VD-Y8C39sAShwdM6bi7U-CJjk7BQg@mail.gmail.com>
 <YvyxCXTGYpLd8kbQ@pevik>
 <CAG4es9XkRDYnwDr9huepzGhEiHxWdu40DOK9ouA2yWGqv842ow@mail.gmail.com>
 <CAG4es9WmHd52fmjdt7RBkSXEtnGuC2jkBO6UdCTbaHOq8CDgVw@mail.gmail.com>
 <Yv9F8MnPGyLLE0Zm@pevik> <Yv9Msztwn77epwCP@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yv9Msztwn77epwCP@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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

On Fri, Aug 19, 2022 at 10:41:23AM +0200, Cyril Hrubis wrote:
> Hi!
> > Thanks! The bug was closed as 'adding "cx" worked'. Reading topperc's comment it
> > looks like there no other way to fix the issue on clang than workaround with
> > volatile. Does it mean that it's a syscall problem and clang can do nothing
> > about it?
> 
> It's problem with the inline assembly in the body of the while loop, the
> call to the syscall changes the register value that is used for the D
> variable in the case of clang, so the loop exits prematurely. We have to
> add cx register to the clobber list for that asm statement so that
> compiler knows that it's changed by the assembly.
> 
> Interfacing assembly with C is a bit tricky since you have to explain
> to compiler which registers are changed from the assembly otherwise the
> results are undefined.
> 
> The patch should look like:
> 
> diff --git a/testcases/kernel/syscalls/signal/signal06.c b/testcases/kernel/syscalls/signal/signal06.c
> index 64f886ee3..78efd0fb9 100644
> --- a/testcases/kernel/syscalls/signal/signal06.c
> +++ b/testcases/kernel/syscalls/signal/signal06.c
> @@ -73,7 +73,7 @@ void test(void)
>                 /* sys_tkill(pid, SIGHUP); asm to avoid save/reload
>                  * fp regs around c call */
>                 asm ("" : : "a"(__NR_tkill), "D"(pid), "S"(SIGHUP));
> -               asm ("syscall" : : : "ax");
> +               asm ("syscall" : : : "ax", "cx");
> 
>                 loop++;
>         }
> 
> Although it may not be a complete as the llwm issue suggests we should
> have a look at calling conventions for the syscall and check if we need
> to add any other registers to the clobber list.

Looking at: https://en.wikibooks.org/wiki/X86_Assembly/Interfacing_with_Linux

We may as well add r11 as suggested by the clang issue comment and that
should be complete.

Edward will you send a patch?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
