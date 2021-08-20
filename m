Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4CD3F2A0D
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Aug 2021 12:21:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0DB253C4EB2
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Aug 2021 12:21:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4C0433C0352
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 12:21:23 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5B2B6623487
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 12:21:22 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9662422171;
 Fri, 20 Aug 2021 10:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629454881;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FhNk8lxe6JJrFZjgNC31q5GHymCThZLZrgrFHACGfgY=;
 b=ttmN+OhUloeFYb2WW86BepRW9xvOdfe6ZIWVOONttcJTVnfmvj8/MgH64mSWAPb0KD91Ad
 +bDVJKAaCPUrp0h36eVeAMV7b6hJ/u6Lq8CMr0c13YMW40aJCkObf8hlNPgNZF3NCqrmsZ
 MuoiF5U/IcSlTbHI0DRkCCES05+ALQQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629454881;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FhNk8lxe6JJrFZjgNC31q5GHymCThZLZrgrFHACGfgY=;
 b=FMBf9bia21Gc0KmlG72n/vTfjhluMtYpereR/+CfD3LGO/tKB8ZuCH2GGmBybNKrlPJ4Wy
 rhCOO0VRGrZSAXCg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 38EC113ABF;
 Fri, 20 Aug 2021 10:21:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id MWvSCyGCH2GHZwAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Fri, 20 Aug 2021 10:21:21 +0000
Date: Fri, 20 Aug 2021 12:21:19 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <YR+CH2+GYzwU2/SG@pevik>
References: <20210802214645.2633028-1-krisman@collabora.com>
 <20210802214645.2633028-4-krisman@collabora.com>
 <CAOQ4uxjMfJM4FM4tWJWgjbK4a2K1hNJdEBRvwQTh9+5su2N0Tw@mail.gmail.com>
 <87fsvphksu.fsf@collabora.com>
 <CAOQ4uxj_WwDPxZv0nr9+Hh+pim6+2onaBdFq_BR-qK=xz+8yUg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxj_WwDPxZv0nr9+Hh+pim6+2onaBdFq_BR-qK=xz+8yUg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/7] syscalls/fanotify20: Validate incoming FID in
 FAN_FS_ERROR
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
Cc: kernel@collabora.com, Khazhismel Kumykov <khazhy@google.com>,
 Matthew Bobrowski <repnop@google.com>, Jan Kara <jack@suse.com>,
 Ext4 <linux-ext4@vger.kernel.org>,
 Gabriel Krisman Bertazi <krisman@collabora.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> No problem. That's what review is for ;-)

> BTW, unless anyone is specifically interested I don't think there
> is a reason to re post the test patches before the submission request.
> Certainly not for the small fixes that I requested.

> I do request that you post a link to a branch with the fixed test
> so that we can experiment with the kernel patches.

> I've also CC'ed Matthew who may want to help with review of the test
> and man page that you posted in the cover letter [1].

@Amir Thanks a lot for your review, agree with all you mentioned.

@Gabriel Thanks for your contribution. I'd also consider squashing some of the
commits.

Kind regards,
Petr

> Thanks,
> Amir.

> [1] https://lore.kernel.org/linux-ext4/20210802214645.2633028-1-krisman@collabora.com/T/#m9cf637c6aca94e28390f61deac5a53afbc9e88ae

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
