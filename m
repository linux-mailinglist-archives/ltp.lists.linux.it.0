Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 175D0424D91
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Oct 2021 08:56:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4FF5F3C7AAB
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Oct 2021 08:56:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B842E3C55BD
 for <ltp@lists.linux.it>; Thu,  7 Oct 2021 08:56:34 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2D2241001388
 for <ltp@lists.linux.it>; Thu,  7 Oct 2021 08:56:33 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 044BB1FF40;
 Thu,  7 Oct 2021 06:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1633589793; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q2JC999ebY8jtMx6ipsMGCq8pTOVbQ/QxbogeLlItz0=;
 b=hWSt2SnLUhMq1yj5vqPspfHc3G/7nbcI/6JySJfq9pAWLpjCFh/v42bt/GyJrL5934AKfd
 il/FNHbMWgrUK5B2TM5XIlhl/DEIFpQ660tmAQ8xg9QjZCfZrP+LtrZ1sMUlOcHBJmGiAJ
 /8aw8g9Z1Kd4s+XqAGyLsq0GVhu0Qyk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1633589793;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q2JC999ebY8jtMx6ipsMGCq8pTOVbQ/QxbogeLlItz0=;
 b=h4IJSiFbMP6ZMvjW2Zw21NIpJFG8F5ocGT8iIqit/cZl6fdV0cOGx9C976VJLf+R/xv/SV
 61ljwE/dUkmRK+Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E781113B68;
 Thu,  7 Oct 2021 06:56:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PrscNyCaXmG0bAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 07 Oct 2021 06:56:32 +0000
Date: Thu, 7 Oct 2021 08:57:07 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <YV6aQ7vYLhy5FE3r@yuki>
References: <281d8fbf1a7df4d85aea6bbd3ff74982923309c5.1633527038.git.jstancek@redhat.com>
 <YV2zMeb3ILLRPNsL@yuki>
 <CAASaF6yhMEvy8zFOvNvZWFvEQG-_LpwpBc3WgACWOOROObV+zg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAASaF6yhMEvy8zFOvNvZWFvEQG-_LpwpBc3WgACWOOROObV+zg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] open_posix: remove pthread_kill/6-1
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Shouldn't we just flip the YES to WON'T test in the coverage?
> >
> 
> I dropped it because it seemed pointless to keep around wrong assertions.
> I don't have strong opinion here, I can change it to WON'T.

Neither do I.

Anyways, feel free to push with either change.

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
