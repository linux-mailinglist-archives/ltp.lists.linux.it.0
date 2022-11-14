Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B3372628389
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Nov 2022 16:08:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8A42F3CD23C
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Nov 2022 16:08:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E44A73C01D2
 for <ltp@lists.linux.it>; Mon, 14 Nov 2022 16:08:44 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0B7A8200970
 for <ltp@lists.linux.it>; Mon, 14 Nov 2022 16:08:43 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3E4DA22B92;
 Mon, 14 Nov 2022 15:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1668438523;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MWjni3NnmQllkoJU0psgaFr9LndPxwTw1nbMtHhV7hM=;
 b=E0rPRs/gCgBkcBcAucAsU/0HSNC1/bmtsC5qG4CTm3HfQIwjZAQu+PwGEz0bXwWLlvIPVA
 97y9TD329XIBLw84Wy+DWmMclrJUXzD+RcuMHPzym6D64xs86S3kHHcRH+UWxKitILeKDC
 lLhoSc+5f95kOIkiku97jnpBZ1y0Ke8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1668438523;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MWjni3NnmQllkoJU0psgaFr9LndPxwTw1nbMtHhV7hM=;
 b=qHGk1PPAuiUfVLZZIxTi8owcClT0dOphXIqiQt6ZLhSdLTuF+jFQHMh+rkbRfbTDlInyTU
 qKs+IMWjmRqBI7Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C1F1013A8C;
 Mon, 14 Nov 2022 15:08:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MEDRJ/pZcmMBBwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 14 Nov 2022 15:08:42 +0000
Date: Mon, 14 Nov 2022 16:08:40 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <Y3JZ+MhZCBF0bLwm@pevik>
References: <20221111170410.16350-1-pvorel@suse.cz>
 <87y1sdspn1.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87y1sdspn1.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] runtest/mm: Use the default value for -p
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

Hi Richie,

> Hello,

> Petr Vorel <pvorel@suse.cz> writes:

> > Test rewrite in 88321bfff introduced reasonable default value for -p
> > option "number of mapping children" (nproc -1 in range <1, 20>), let's
> > use it, instead of forcing -p 20.

Thanks for your review, merged.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
