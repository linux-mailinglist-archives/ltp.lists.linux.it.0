Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FD03DF31A
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 18:46:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 35F713C889A
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 18:46:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 68F8A3C5535
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 18:46:50 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 74F9A20004A
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 18:46:49 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9AC4D20062;
 Tue,  3 Aug 2021 16:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628009208;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wDwcrgvEvYhH4ihgHnHp5amdiz+gVEMfYk7w1ZgTCGU=;
 b=F7+YtIR0pg1/4FYmvvovyu4bG+MuPLZoHd3NIZZB71s4gQIbsPn1J9ec/5JNzekEzLJNT+
 PBPTTRZwIgTh4HCgMXO0cdlFq5VjSMZihJf0+2FMpQVimlg13s4u9jrgKfRY7XXyw9vwsj
 Gp6Yk+r32K4rSjD7HFwE0px01JX2d9s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628009208;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wDwcrgvEvYhH4ihgHnHp5amdiz+gVEMfYk7w1ZgTCGU=;
 b=BpDiMoi2XThXILF8vYbu3N+K9v5x8XWFOceMId89dUxtbIxVil9862cIRj/V2XpYTFzEqk
 QYQr0l2fNdF8o1Bg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 67F6B13B74;
 Tue,  3 Aug 2021 16:46:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id X4MuF/hyCWENDQAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Tue, 03 Aug 2021 16:46:48 +0000
Date: Tue, 3 Aug 2021 18:46:46 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YQly9swcBhrmqgnB@pevik>
References: <20210802173536.19525-1-pvorel@suse.cz>
 <20210802173536.19525-3-pvorel@suse.cz> <YQkLmb3pUPY8cKP8@yuki>
 <YQkps5nZ8gHJSaUQ@pevik> <YQkqY3Mdmv4cYsFx@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YQkqY3Mdmv4cYsFx@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v7 2/7] test/test_zero_hugepage.sh: Skip test on
 read-only file system
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
> > > I wonder if we should rather check if proc is mounted readonly
> > > explicitly since this may hide all kinds of errors.
> > Sure, makes sense, I'll adapt it in v8. It's just not a fun to write tests which
> > you cannot debug on VM, but just pushing to git :(.

> Well I guess that you can remount proc RO on your testing machine with
> something as:

> mount -o remount,ro /proc
Indeed one (very old one) of many of my VMs didn't yell "mount: /proc: mount
point is busy." and actually allowed remount /proc to ro. Nice, thanks for a
tip!

Kind regards,
Petr


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
