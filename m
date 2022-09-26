Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CD45E9E5B
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Sep 2022 11:53:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 92D923CADDF
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Sep 2022 11:53:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7A92F3CAD73
 for <ltp@lists.linux.it>; Mon, 26 Sep 2022 11:53:03 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 15997600835
 for <ltp@lists.linux.it>; Mon, 26 Sep 2022 11:53:02 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E61D2220FD;
 Mon, 26 Sep 2022 09:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1664185981;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W8x+ytHZbtagrUB583NioKF/B94WLDFiCktQtB6qaWA=;
 b=wiAcYwAEbKdhVWLT1PseBXkQIBCncDOpUuinjBvpUFy4CUOTkALZKwvdW8302Jc7zkvQ8T
 6B7gLtbYH1d5o1vz3PSilA54KJKJLosgmkWeESuYmJnOIROBIn+yNs5JoHaCEPFfHnt+OG
 bZYnqylpsIGUJ91GmpnRMg3zXozWV8s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1664185981;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W8x+ytHZbtagrUB583NioKF/B94WLDFiCktQtB6qaWA=;
 b=1KLwjFT46vspqXwhU+cHiz0r3fmxktAjUW9aX7GHQOh2On9MLQWSzOXd9iDS2lFaJm0bxh
 /ZwywmmcDeJmj4DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 94532139BD;
 Mon, 26 Sep 2022 09:53:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id v0M5In12MWP5BAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 26 Sep 2022 09:53:01 +0000
Date: Mon, 26 Sep 2022 11:52:59 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YzF2exld6LqWrxi8@pevik>
References: <20220923105554.28942-1-pvorel@suse.cz>
 <20220923105554.28942-4-pvorel@suse.cz> <Yy2k448Z6mweD+TS@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yy2k448Z6mweD+TS@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] ima_setup.sh: Use tst_supported_fs instead of
 df
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
Cc: linux-integrity@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

[ Cc linux-integrity ML ]

Cyril, thanks a lot for your review, patchset merged.

@linux-integrity Last 7 fixes made IMA working on my setup, if anything broken
please speak up, so that we can fix it before LTP release (git freeze is going
to be very soon, likely this week).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
