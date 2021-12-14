Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA39474857
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Dec 2021 17:39:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 970FA3C8C6C
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Dec 2021 17:39:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4C2653C8A8C
 for <ltp@lists.linux.it>; Tue, 14 Dec 2021 17:39:10 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C3987200972
 for <ltp@lists.linux.it>; Tue, 14 Dec 2021 17:39:09 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EB58C21100;
 Tue, 14 Dec 2021 16:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1639499948;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=guHmbwqflIwEkepaULgZsEuZNfYzCQGk2Bq8FJ6I3lU=;
 b=z0e0BqANhs44BBo771hJm7HR2GptpmETppWIwE7ekIpPTB0PQXwt22vjbhrsnH9mxHxAWk
 kMvNRvMRA7EuihnPCChz32TEsdkCo+jK/D+H0EIRVa7YwSbaCUH0ZbAhtA3+R29jXxbHh2
 l5N7baTWOYIfOizyxp6govP5lRdK3iQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1639499948;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=guHmbwqflIwEkepaULgZsEuZNfYzCQGk2Bq8FJ6I3lU=;
 b=YhizRE83IAGpEQDHKxxneVOYaI/gA3ilK0hOQivJ1rNTimAVlkHs0NXj3EiCH5vgy1p9dW
 oV2ELW2LVnQa2lBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C0E7513CE9;
 Tue, 14 Dec 2021 16:39:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3X6bLazIuGGOCQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 14 Dec 2021 16:39:08 +0000
Date: Tue, 14 Dec 2021 17:39:07 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YbjIqypOcAYAnLbl@pevik>
References: <20211213160437.32353-1-andrea.cervesato@suse.com>
 <YbiyhLnljUy2K7Mv@pevik> <Ybi0mHK4s3X7nLlD@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ybi0mHK4s3X7nLlD@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] Refactoring dio_append.c using LTP API
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

> Hi!
> > I wonder what I'm missing:
> > ./dio_append
> > tst_test.c:1409: TINFO: Timeout per run is 0h 05m 00s
> > dio_append.c:69: TINFO: Parent append to file
> > common.h:45: TBROK: open(dio_append,16449,0666) failed: EINVAL (22)

> That's an O_DIRECT open() EINVAL probably means that O_DIRECT is not
> supported. Is your /tmp/ on tmpfs?
Yes. As we cannot use SAFE_OPEN() in io_read_eof() [1], there should be check
for errno I guess.

Kind regards,
Petr

[1] https://lore.kernel.org/ltp/20211213121417.21825-1-andrea.cervesato@suse.com/


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
