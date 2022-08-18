Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 287815981FA
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Aug 2022 13:12:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BF6463CA1B8
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Aug 2022 13:12:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1712E3CA0C6
 for <ltp@lists.linux.it>; Thu, 18 Aug 2022 13:12:12 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6FF841400073
 for <ltp@lists.linux.it>; Thu, 18 Aug 2022 13:12:12 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9296C3EF4F;
 Thu, 18 Aug 2022 11:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1660821131;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eVy2n59fQYp+pu9qr16IzYo/E5Ctyx6akUTRrrt1Q2s=;
 b=jhlzRDKj5DhQ7i289fyvZaOesK80n/nfK8Mci6/klXO6qZJ5i77asP7cReB5VU5fhY2pOh
 zNrKjKnfGV930dvbPqvHqyB6LzM09l4zFdZK5HZ1UqhcShq1bRcpZCrAxAz2LUtDO5G38Y
 //bs8JvPpxKZOqETALYj5YXpTSn6a0c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1660821131;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eVy2n59fQYp+pu9qr16IzYo/E5Ctyx6akUTRrrt1Q2s=;
 b=KxifbIzasSSgYiOoGC8jfXkb/Gn+HO1s65d7+2Tcm77OlQNyBhvDIPiFmk7rJo1IZC+m7I
 GvFq7C30AG46+3CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 381B7133B5;
 Thu, 18 Aug 2022 11:12:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zGBHDIse/mKcJQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 18 Aug 2022 11:12:11 +0000
Date: Thu, 18 Aug 2022 13:12:09 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <Yv4eiT5L+M7dMkQ5@pevik>
References: <20220817204015.31420-1-pvorel@suse.cz>
 <Yv4MBF79PnJKJbwm@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yv4MBF79PnJKJbwm@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] API: Allow to use xfs filesystems < 300 MB
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
Cc: linux-xfs@vger.kernel.org, "Darrick J . Wong" <djwong@kernel.org>,
 automated-testing@yoctoproject.org, ltp@lists.linux.it,
 automated-testing@lists.yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> Hi!
> I'm starting to wonder if we should start tracking minimal FS size per
> filesystem since btrfs and xfs will likely to continue to grow and with
> that we will end up disabling the whole fs related testing on embedded
> boards with a little disk space. If we tracked that per filesystem we
> would be able to skip a subset of filesystems when there is not enough
> space. The downside is obviously that we would have to add a bit more
> complexity to the test library.

Maybe I could for start rewrite v2 (I've sent it without Cc kernel devs now it's
mainly LTP internal thing) as it just to have 300 MB for XFS and 256 MB for the
rest. That would require to specify filesystem when acquiring device (NULL would
be for the default filesystem), that's would be worth if embedded folks counter
each MB. It'd be nice to hear from them.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
