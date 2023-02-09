Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B196690143
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Feb 2023 08:30:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D59723CC09C
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Feb 2023 08:30:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6F5DC3C4D54
 for <ltp@lists.linux.it>; Thu,  9 Feb 2023 08:30:04 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C16AD1A007F4
 for <ltp@lists.linux.it>; Thu,  9 Feb 2023 08:30:03 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F3D3734DE6;
 Thu,  9 Feb 2023 07:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1675927803;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JxkYEKBnj7R8jdRKxFruOu5H+X4sCXCAMbTaXFOmtl8=;
 b=kPTSYh5jD2crsFRFkSfzoCdIGKKkvYtYbDPSpLuDVlR2v05yhgbJ4rPKVdgV/jFG567Ce3
 Gzb/UlDE+E4ktXlA2RcBC7b9fLE108sG8lPCwX1zid4Rq1ohgGtKyQhar3nmC4g21U4fhh
 cHEIlsysWe/vk/FZKg4GiS34oha4rYk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1675927803;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JxkYEKBnj7R8jdRKxFruOu5H+X4sCXCAMbTaXFOmtl8=;
 b=6PgSnAjimpouNwR7UOu6k91hrLfezDxU/oJTQRsJsBNrlRQAlZtLC7/pJOl8IzN3/j9o8P
 2c4WO1V5nxecm3BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D169B1339E;
 Thu,  9 Feb 2023 07:30:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PwTeMfqg5GN4ewAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 09 Feb 2023 07:30:02 +0000
Date: Thu, 9 Feb 2023 08:30:01 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <Y+Sg+Xqej1j+BaNM@pevik>
References: <20230207131714.2500-1-pvorel@suse.cz>
 <20230207131714.2500-2-pvorel@suse.cz>
 <CAEemH2chcTe263-zqpSF2Gc2CVc8NC+G-KZsFMbwoxEKyjA01w@mail.gmail.com>
 <20230208135404.GB31469@pevik> <20230208141309.GC31469@pevik>
 <CAEemH2dTnMwyi5hvD9GvSNOHWON=pi6z5eF8xTVb7rUobuoWKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dTnMwyi5hvD9GvSNOHWON=pi6z5eF8xTVb7rUobuoWKQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] ioctl01: Add default tty device
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

...
> > I also wonder if we still want to keep -D parameter (i.e. allow tester to
> > pass a
> > file).


> I think there is no necessary keep "-D" parameter since this ioctl01
> is to check errno of ioctl(2) syscall, it might meaningless to specify a
> different char device.

Thx! That makes checking code slightly simpler.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
