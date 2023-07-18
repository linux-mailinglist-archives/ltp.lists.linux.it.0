Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 360E3757EE8
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Jul 2023 16:03:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 316263CEAF8
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Jul 2023 16:03:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1A73F3C9A2E
 for <ltp@lists.linux.it>; Tue, 18 Jul 2023 16:03:10 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 34407600114
 for <ltp@lists.linux.it>; Tue, 18 Jul 2023 16:03:09 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 63398218F8;
 Tue, 18 Jul 2023 14:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1689688989; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OZqarg5fMpWd7AaknJ41DNarATXoeE9zUDXa0r/AhUg=;
 b=B1K1x4usBjfrFo8ifTChNH/E3Cq3M4EX0gWl0FmvI0vb9JFNrzPlE8KENAolcUoLYDLAp2
 f1xRk7lpo80lCMG2Owab0jhWJvW9yiKllC39GwZT5ZU6yo4SYdsjOBrFirUG8VhCzPOINR
 zH/GkFIM0mavZ/gPvaqh1gAkThjBwko=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1689688989;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OZqarg5fMpWd7AaknJ41DNarATXoeE9zUDXa0r/AhUg=;
 b=btyX5NLLw4ccLc8C9iBs9cv5icIRJyDiEi/44xXdOhSESXvcajGTbN8Rl6wmHWotTHyHfQ
 XtsXqg9ih8CT8qCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 510DD134B0;
 Tue, 18 Jul 2023 14:03:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rnmTEp2btmTeegAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 18 Jul 2023 14:03:09 +0000
Date: Tue, 18 Jul 2023 16:04:12 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <ZLab3JV7ECyGIccZ@yuki>
References: <20230718114027.GA1172148@pevik>
 <ZLaYMAkKxMK3h7mC@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZLaYMAkKxMK3h7mC@yuki>
X-Virus-Scanned: clamav-milter 1.0.1 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
Subject: Re: [LTP] sched_rr_get_interval01 depends on particular CONFIG_HZ
 value
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
> > sched_rr_get_interval01.c depends on particular CONFIG_HZ value.
> > Recent change in openSUSE kernel from the default 250 to 300 breaks it:
> > 
> > sched_rr_get_interval01.c:57: TPASS: sched_rr_get_interval() passed
> > sched_rr_get_interval01.c:64: TPASS: Time quantum 0s 99999990ns
> > sched_rr_get_interval01.c:72: TFAIL: /proc/sys/kernel/sched_rr_timeslice_ms != 100 got 90
> > sched_rr_get_interval01.c:57: TPASS: sched_rr_get_interval() passed
> > sched_rr_get_interval01.c:64: TPASS: Time quantum 0s 99999990ns
> > sched_rr_get_interval01.c:72: TFAIL: /proc/sys/kernel/sched_rr_timeslice_ms != 100 got 90
> > 
> > According to kernel/Kconfig.hz CONFIG_HZ can have various values (100, 250, 300,
> > 1000). Should we adapt the test to expect any of these? Or should we require
> > kernel config to read CONFIG_HZ value and check for correct value?
> 
> We had the same problem with getrusage04.c, see the
> guess_timer_resolution() function there.

However in the case of sched_rr_get_interval() both values are supposed
to be in seconds. The sched_rr_get_interval() fills in a timespec and
the proc file is in miliseconds. As far as I can tell we actually
compare apples to apples in the test and not oranges and apples.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
