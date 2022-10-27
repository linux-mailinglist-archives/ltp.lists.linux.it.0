Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A3260F16C
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Oct 2022 09:47:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B84BF3CA7AF
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Oct 2022 09:47:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6FDB63C0895
 for <ltp@lists.linux.it>; Thu, 27 Oct 2022 09:47:53 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C1D8E1400F49
 for <ltp@lists.linux.it>; Thu, 27 Oct 2022 09:47:52 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AF75E22895;
 Thu, 27 Oct 2022 07:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666856871; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OrWEmihsneh2jVR1znksHsmLRTB8qbxoF75M34tO7PA=;
 b=V6IxW3VkZ64p9BKXi1uJg3cgqpcW9mGDFMEd+wB+zIuR5AHrAqORR2DaLtn5CqzDKA7qR+
 waxlqhFNVMgWY8i3IDfpuwPP3sin0adXPrgqDWfksm26LcmfIMwwWLoAd9qi7+axCjP29C
 DhzLh4zFcve+yBJ0hKjMf+9U1YrzNCY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666856871;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OrWEmihsneh2jVR1znksHsmLRTB8qbxoF75M34tO7PA=;
 b=2SSioULp0GDykFo2p8ag+q+QnOUNpk+WGT69fH8VshHNuKM46dqBsUsJ+484FedzDgxXhj
 At1eZIcULbhB4GDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E75F313357;
 Thu, 27 Oct 2022 07:47:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AqqwKaY3WmNcLQAAMHmgww
 (envelope-from <akumar@suse.de>); Thu, 27 Oct 2022 07:47:50 +0000
From: Avinesh Kumar <akumar@suse.de>
To: rpalethorpe@suse.de
Date: Thu, 27 Oct 2022 13:17:48 +0530
Message-ID: <5881925.lOV4Wx5bFT@localhost>
Organization: SUSE
In-Reply-To: <87bkq0xqas.fsf@suse.de>
References: <20221019071706.25416-1-akumar@suse.de> <87bkq0xqas.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] setfsuid02: Rewrite using new LTP API
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

Hi Richie,

On Tuesday, October 25, 2022 1:29:36 PM IST Richard Palethorpe wrote:
> hello,
> 
> Avinesh Kumar <akumar@suse.de> writes:
> 
> > Rewrite using new API and add setfsuid(-1) call to verify that preceding
> > setfsuid() call with an invalid fsuid had failed.
> 
> Merged with a couple of changes.
> 
> > +	TST_EXP_VAL_SILENT(setfsuid(invalid_uid), current_uid);
> 
> Need to use the SETFSUID macro for 16-bit (as pvorel said).
> 
> > +	TST_EXP_VAL(setfsuid(-1), current_uid,
> > +				"setfsuid(invalid_fsuid) test for
> > expected failure:");
> 
> Substituted invalid_uid for -1 because -1 (UINT_MAX or USHORT_MAX) could
> be a valid UID AFAICT.

Thank you for review.
I used -1 as suggested in the manpage of setfsuid, which says setfsuid(-1) should
always fail. I have used the same for setfsgid test also.


Regards,
Avinesh






-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
