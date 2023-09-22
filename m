Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B597AAD58
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Sep 2023 11:03:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AB9FF3CE367
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Sep 2023 11:03:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CDB673CA3A6
 for <ltp@lists.linux.it>; Fri, 22 Sep 2023 11:03:47 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9566C1BB9C39
 for <ltp@lists.linux.it>; Fri, 22 Sep 2023 11:03:45 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E6BE5211BD;
 Fri, 22 Sep 2023 09:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1695373424;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qMyJqhA+p6Hi3QaeCdJXgnr97pBqlm6Ek+gnfpSGM1g=;
 b=kZsh7yFEqS1lKEr9IrOkjnjbsS1qeYE3A2oXdXoQ/6Qq1XGQGdVX3G5c7gcsZ5VlDu6DrK
 mhL9apfgguUQxbK5C8PDmKLoZS0VkPDxCdR1eYZLFWjWqNBFpU1ZIyIL7+zmAFzfHAuHYt
 k/tM+baqKAll6/OJSCbj7M8PzY/Nh+s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1695373424;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qMyJqhA+p6Hi3QaeCdJXgnr97pBqlm6Ek+gnfpSGM1g=;
 b=HfyTZjUip9Dlzw1AB6kmDKi1Wc24O/cfTQVa2AHLQ+OMkRtzUzzEchsqfI3rnJyfDCLDCi
 CClSQvZm9xiH9QAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B96B413597;
 Fri, 22 Sep 2023 09:03:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aSLJK3BYDWWDTwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 22 Sep 2023 09:03:44 +0000
Date: Fri, 22 Sep 2023 11:03:43 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <20230922090343.GA483490@pevik>
References: <20230919083827.8423-1-rpalethorpe@suse.com>
 <a2aa6bf8-2299-daad-2291-750c7db6e143@suse.cz>
 <CAB1t1Cz8f5gy4vq1z7Ts3kHX1kmuMo2zcW7qNk548NJZuTASmQ@mail.gmail.com>
 <8734z6fvy1.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8734z6fvy1.fsf@suse.de>
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] kvm: Fix Nix build failure by moving
 -fno-stack-protector to CFLAGS
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
Cc: ltp@lists.linux.it, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hello,

> Petr Vorel <petr.vorel@gmail.com> writes:

> > Hi all,

> > [I Cc Fabrice and Buildroot ML]

> > On Tue, 19 Sept 2023 at 14:51, Martin Doucha <mdoucha@suse.cz> wrote:

> >> Hi,
> >> pvorel should have a look whether it doesn't break the other systems
> >> where -fno-stack-protector is needed, but otherwise:

> > Yesterday night I tested the current LTP master with ./utils/test-pkg. Some
> > Bootlin toolchains keep failing (bootlin-x86-64-musl, bootlin-x86-64-glibc):

> > CC testcases/kernel/kvm/lib_x86.o
> > gbr-test-pkg/bootlin-x86-64-musl/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/11.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld:
> > lib_x86.o: in function `kvm_init_guest_vmcb':
> > lib_x86.c:(.text+0x7c8): undefined reference to `__stack_chk_fail'
> > collect2: error: ld returned 1 exit status

> > Problems are only on x86_64, other archs (aarch64, riscv64, mipsel, amv7r)
> > are OK.

> I think only x86_64 is supported.

Yes (+ i386). Thanks, I forgot on it.


> > NOTE: In Buildroot LTP is currently disabled when musl is used due  5.11
> > headers requirement for musl toolchain [1], but I temporarily remove this
> > requirement to get more testing. That's why there are also musl results.

> > It looks like this patch actually fixes it, thus:
> > Acked-by: Petr Vorel <pvorel@suse.cz>

> Right, it's not just Nix then. I will merge it.

+1


> > There are even more kvm test related results [2], but I suspect they are more
> > related to the Buildroot toolchain than LTP itself:

> > CC testcases/kernel/kvm/lib_guest.o
> > bootstrap_x86_64.S: Assembler messages:
> > bootstrap_x86_64.S:16: Error: unknown pseudo-op: `.code16'
> > bootstrap_x86_64.S:19: Error: unknown mnemonic `cli' -- `cli'
> > bootstrap_x86_64.S:21: Error: unknown mnemonic `lgdt' -- `lgdt kvm_gdt32_desc'
> > bootstrap_x86_64.S:23: Error: operand 1 must be an integer register --
> > `mov $0x11,%eax'
> > bootstrap_x86_64.S:24: Error: operand 1 must be an integer register --
> > `mov %eax,%cr0'
> > bootstrap_x86_64.S:26: Error: unknown mnemonic `jmp' -- `jmp
> > $3*8,$protected_mode_entry'
> > bootstrap_x86_64.S:28: Error: unknown pseudo-op: `.code32'

> For me I would at the least we need V=1 enabled or the names and
> versions of the tools being used to guess what is wrong here.

I'm not sure if I find some spare time in my after-work time.
If yes, I'll post logs.

Kind regards,
Petr

> mov $0x11,%eax looks like a really simple op to put 11 in EAX using
> AT&T/GAS syntax. If that goes wrong then possibly the wrong syntax is
> expected by the assembler or else a previous line is confusing it.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
