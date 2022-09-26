Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8075E9E38
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Sep 2022 11:47:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A0D1F3CADD5
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Sep 2022 11:47:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C95BE3C1B40
 for <ltp@lists.linux.it>; Mon, 26 Sep 2022 11:47:51 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 646E66001B8
 for <ltp@lists.linux.it>; Mon, 26 Sep 2022 11:47:51 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C2E061FDB7;
 Mon, 26 Sep 2022 09:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1664185670; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sEWEVPcrt7Ugkx0cmrT2zIr7EiHawYmIVOBNttNRb4U=;
 b=t5ywHpBledJsFvKYrIJAn+C+WcXiVWoby5hukHyOfXRBaydcdlH7IueHPOuE9MT4lpiZ8D
 ELGJWYC5q0/VKDdmK9Qub4YcG1ANxrHF1RbzlqLc1MPMgbwFwdlF0qUZznhR3bPmnzbxKt
 +0basTuszXhR68oUoILOms7El+GdPvI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1664185670;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sEWEVPcrt7Ugkx0cmrT2zIr7EiHawYmIVOBNttNRb4U=;
 b=1u/2Sp+axgjdax822Q+uoMXUBuVVvsyzks7diYhDvX7aIagUJ1D+W2swVOleUaCeUcKeyJ
 82I+LNzEc3lktbCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A723E139BD;
 Mon, 26 Sep 2022 09:47:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7CTXJ0Z1MWMfAgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 26 Sep 2022 09:47:50 +0000
Date: Mon, 26 Sep 2022 11:49:44 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YzF1uKqHL9kOHrqj@yuki>
References: <Yxr+EpKTnKQbKXTb@yuki> <YyiLZoSRWPgs8Cfh@pevik>
 <Yy2SGpSyfDeApR5o@pevik> <Yy2fle1RVT/P+mJa@yuki>
 <Yy2jpHOAu0J7MXVF@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yy2jpHOAu0J7MXVF@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] September LTP release
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
> I wonder, if we want to document in C/shell API docs, that for skipping ext[2-4]
> on tests which run on single filesystem we one needs to specify "ext2/ext3/ext4.
> It has not been needed so far, thus may not be needed. I understood we're not
> going to change this.

I would keep this after the release.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
