Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEC25A20B0
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Aug 2022 08:11:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BEAD03CA44B
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Aug 2022 08:11:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 798233CA3D7
 for <ltp@lists.linux.it>; Fri, 26 Aug 2022 08:11:31 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 57EB41400519
 for <ltp@lists.linux.it>; Fri, 26 Aug 2022 08:11:29 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5A8AC336FC;
 Fri, 26 Aug 2022 06:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1661494289; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pbjPMaxW9LTe1/xFwgBPlk36VUJ6V7TzwzibpQP3+LA=;
 b=tMA3hRMYRIf1nAKbvSFfsnH712QRcXTpe3TrBOFoJ9CIAc9Qa6LdKdAMNa70LVBdhAWCGR
 bO/i44iVS2W+sPu3oZI7vFaq0eX2JqPS3vHInZnErcqIGD5n1gT40oP3CuqUJFWeu/VB4U
 /5JjrFvIW2SjhAKPb/foS/SpJWxWWxY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1661494289;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pbjPMaxW9LTe1/xFwgBPlk36VUJ6V7TzwzibpQP3+LA=;
 b=R1PpF0iuUNKWm9NBhAehhaj2hyHqdbugBvRqEhxdfXE09aWnpYFVybGlJ4W0EXV+NSw8OQ
 +l+zwpg/EcLeiVAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5A20413A7E;
 Fri, 26 Aug 2022 06:11:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oklrBxBkCGMmcAAAMHmgww
 (envelope-from <akumar@suse.de>); Fri, 26 Aug 2022 06:11:28 +0000
From: Avinesh Kumar <akumar@suse.de>
To: ltp@lists.linux.it
Date: Fri, 26 Aug 2022 11:41:25 +0530
Message-ID: <2649941.mvXUDI8C0e@localhost>
Organization: SUSE
In-Reply-To: <87sflk1dn1.fsf@suse.de>
References: <20220825135528.19653-1-akumar@suse.de>
 <20220825135528.19653-2-akumar@suse.de> <87sflk1dn1.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] inotify_init1_02.c: Convert to new LTP API
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

On Thursday, August 25, 2022 10:06:29 PM IST Richard Palethorpe wrote:
> Hello,
> 
> > -}
> > +static struct tst_test test = {
> > +	.test_all = run,
> > +	.needs_tmpdir = 1
> 
> Both conversions look perfect, but do we need a temp dir? It doesn't
> look like the tests use the file system.
Yes, my bad. No need of temp dir.
Should I send updated patch or will you update before merging?
> 
> 

Thanks,
Avinesh




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
