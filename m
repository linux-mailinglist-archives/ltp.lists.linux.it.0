Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E4743C76B
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Oct 2021 12:13:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 35D893C6A37
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Oct 2021 12:13:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 042E23C6868
 for <ltp@lists.linux.it>; Wed, 27 Oct 2021 12:13:20 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7853B601294
 for <ltp@lists.linux.it>; Wed, 27 Oct 2021 12:13:20 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 949C6218B8;
 Wed, 27 Oct 2021 10:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635329599;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WnTSDfPqCQ83Qm16DDhzTe83rRF7RHI/bOAxpSgjUYU=;
 b=Gso/y+429DKus4UQV4Zr1LcvhN86/bXUG7Nrzj0YmIvtcwC1v56q+W9kfEhU3mCWhenfa4
 MN3DJLd8gfTW4Mrv3vBNLSo8iiDLngSlJyJXjjZJcCdS2ME96aTrTv9/+wxP/ehiHfUHoe
 GyKbYUeciHsK8tRMNKytEKs0POpHk3Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635329599;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WnTSDfPqCQ83Qm16DDhzTe83rRF7RHI/bOAxpSgjUYU=;
 b=RNuB3jeshh4GGf9nNmCIXppvFuAOb5QTWO4lDFnUXdGueemf5O8STGGt7OFXnvW8A1SNvg
 TyhroxBRjY9ZX5CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5E16413B85;
 Wed, 27 Oct 2021 10:13:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id A9cQFD8meWG8QQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 27 Oct 2021 10:13:19 +0000
Date: Wed, 27 Oct 2021 12:13:17 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YXkmPU9/02Ickuso@pevik>
References: <20211027092027.7124-1-pvorel@suse.cz> <YXkfDEFLUkOO+70q@pevik>
 <YXkhQ86Oal0KuI0K@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YXkhQ86Oal0KuI0K@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] CI: Reenable Tumbleweed
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi!
> > >      container:
> > >        image: ${{ matrix.container }}
> > >        env: ${{ matrix.env }}
> > > +      options: --security-opt seccomp=unconfined
> > Alternatively 'options: --privileged' could be used (to run privileged
> > container), IMHO does not matter which of these we take.

> Looking at docker documentation it looks like --privileged disables much
> more than just the seccomp filtering. I do not think that this is a good
> idea. Let's go with just disabling seccomp for affected distros.
IMHO both are ok for just compilation (other projects use it as well for just
CI doing compilation), but sure, let's use the minimum.
FYI this disables seccomp for all machines. Is that ok for you?
IMHO that's not a big deal + we will not have to bother when Fedora also gets
new enough glibc (IMHO problem will periodically occurs on bleeding edge distros
when glibc starts to use new enough syscall).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
