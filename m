Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F25345E5F18
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Sep 2022 11:56:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 552503CAD6D
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Sep 2022 11:56:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EF65A3C9111
 for <ltp@lists.linux.it>; Thu, 22 Sep 2022 11:56:02 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5F4831A0027D
 for <ltp@lists.linux.it>; Thu, 22 Sep 2022 11:56:01 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 44A551F88E;
 Thu, 22 Sep 2022 09:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1663840561; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rTDpKgde+ZwdGANcQOYgSoRccfIXSB+nSKwRZPzRDG0=;
 b=kMv9naFtBSjoXNYv0cwcv2/qqWYu1rmV+8ra0QWNtqMi9SmI7aLFpjS0XZ6tO1KfgYn0m2
 4OdGOtXuD54qg7WodgaTZd71PKlVNbAZ253FsYy1Txt5RH7FWMomsWv3p0XLsxdND0WH64
 RRw3vM1WIUraaBPOH3QojNJnVY3Rxro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1663840561;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rTDpKgde+ZwdGANcQOYgSoRccfIXSB+nSKwRZPzRDG0=;
 b=FMGWq8b2mkL6zCmlgAQNRTFmephL8OtrVjcMNcNJIUiR4zN4HuPl9XLJY0BLXKpSyRWQql
 mD9e3DRSnRIZ4UBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 31CCF1346B;
 Thu, 22 Sep 2022 09:56:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SsQDCzExLGPkDgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 22 Sep 2022 09:56:01 +0000
Date: Thu, 22 Sep 2022 11:56:44 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <YywxXJTZD3s3ONUU@rei>
References: <6bac7035adc2cfc8ab3800fe1d2d03223ec57ff5.1663662348.git.jstancek@redhat.com>
 <6c5b161bc3bcf753cbda92954ca3f47cb268c68f.1663665637.git.jstancek@redhat.com>
 <6470a099-8b3a-ca9f-f521-181a33b5a28a@suse.com>
 <CAASaF6wFc0z+cec6y2T0ygWKY==LwkFv21CT2VG0Waqk+0SSkw@mail.gmail.com>
 <YyosAWUf7pbVMpBt@pevik>
 <CAASaF6x=5SDfS7Z+PauaLKXaKpaBagjgL3ogxKXBF6a-6Zs9xA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAASaF6x=5SDfS7Z+PauaLKXaKpaBagjgL3ogxKXBF6a-6Zs9xA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/futex_waitv0[23]: replace
 TST_THREAD_STATE_WAIT with repeated wake
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 
> Thanks, any concerns pushing this before release? It's race, but not
> very frequent one, so it could wait.

The v2 looks good to me as well.

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
