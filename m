Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AD15B581D
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Sep 2022 12:22:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9F4373CAADD
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Sep 2022 12:22:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 563CB3CAAA7
 for <ltp@lists.linux.it>; Mon, 12 Sep 2022 12:22:25 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8B45F200747
 for <ltp@lists.linux.it>; Mon, 12 Sep 2022 12:22:24 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DDDA51FF91;
 Mon, 12 Sep 2022 10:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1662978143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IucSi79f1rqe9TM7+AQt9HYUiP/e48LbRFMJOFQb2+o=;
 b=xBH564UTp3E7z1bBQrm8fiViLN6O8ZflLGlz/YjDT1t0SN1EYGGleqvr7KOb70miGm0PYE
 RBFVqlL027rZp7dzmHB2pCJ2AlGMiPlCmbT2W0XxZLrufvkpZ7CHDIZUIqS1Gj2UIkEone
 BccoHSQhq5lgcZGvLFQ4ywINxv23f9w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1662978143;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IucSi79f1rqe9TM7+AQt9HYUiP/e48LbRFMJOFQb2+o=;
 b=SJd9ECCbbwjXasFLlJ7kb8JzXQYhIf5vgHpk0DkkZPQERidvxnvpS3JyqsaWiZysYt2K8j
 m1Nac2y5fp34C5CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CAB05139C8;
 Mon, 12 Sep 2022 10:22:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Pi/xMF8IH2O9XAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 12 Sep 2022 10:22:23 +0000
Date: Mon, 12 Sep 2022 12:24:18 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <Yx8I0ponDUIFC8le@yuki>
References: <20220909141840.18327-1-pvorel@suse.cz>
 <20220909141840.18327-3-pvorel@suse.cz> <Yx8EDrF0P9fhbC3O@yuki>
 <Yx8GIUos8bZNja1D@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yx8GIUos8bZNja1D@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 02/10] shell API/tests: Require root for
 format/mount tests
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > > Although the warning is quite obvious:
> > > tst_device.c:101: TINFO: Not allowed to open /dev/loop-control. Are you root?: EACCES (13)
> > > tst_device.c:140: TINFO: No free devices found
> > > TBROK: Failed to acquire device
> 
> > > It's safer to expect root to get valid result.
> 
> > Another option would actually be to make the TST_NEED_DEVICE flag imply
> > TST_NEEDS_ROOT flag, but I do not think that we have that for the C
> > library either.
> No, it does not imply in C API either. Yes, that would make sense for both API.
> But I'd keep it as it is now and I'll do this change after the release,
> Because I have other small fixes on API I'd like to post before the release.
> 
> BTW I always wondered why it was not done from the start, I thought there is a
> reason for that (i.e. some special user with approved permissions).

Well technically you can be added into whatever group is set to
/dev/loop-control e.g. disk group and then you can create devices
without a need to be a root.

So the most correct solution would be checking if we can access
/dev/loop-control if tst_test.needs_device is set and if not we would
imply needs_root. However this would need to be rethinked properly so
that we do not end up creating something complex and not really
required.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
