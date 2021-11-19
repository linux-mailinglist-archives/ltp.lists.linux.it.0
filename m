Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7D6456CBE
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Nov 2021 10:50:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B19283C89A1
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Nov 2021 10:50:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E8A153C0681
 for <ltp@lists.linux.it>; Fri, 19 Nov 2021 10:50:19 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8C312601EB2
 for <ltp@lists.linux.it>; Fri, 19 Nov 2021 10:50:19 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C02DA212CC;
 Fri, 19 Nov 2021 09:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1637315418; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QyMUTXuIV82SeMR4JwGFLzbvcch4iovATxwAZc8IMiQ=;
 b=Hrhnlh5AN67FWrdCfcx0zd9oIELzMSzjXNmBBwLBnw/sHk+pHXwdqDjl5Og+Swh72g20li
 Fy6VhbtBgmJR7nOQ3A6k7QsgpEcTj9pNOJfBEsDIcukViPcr5504vrq8E2ZLN7cY0XNsCp
 bclzsUr5lFwjBuu5KeSqWFrAYBOV2N0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1637315418;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QyMUTXuIV82SeMR4JwGFLzbvcch4iovATxwAZc8IMiQ=;
 b=XNu8erCGymq9jFhLL2Phu8lQ3H56Bf6skC/SsKUtE3dQVQfXEtfXVSh3dvr1gwR8J8zsir
 nKQ7J8ltAURY/2DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A258513DD5;
 Fri, 19 Nov 2021 09:50:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id L/zNJVpzl2EYfQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 19 Nov 2021 09:50:18 +0000
Date: Fri, 19 Nov 2021 10:51:23 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <acervesato@suse.de>
Message-ID: <YZdzm9Q9uP/tLAS+@yuki>
References: <20211118151631.17893-1-acervesato@suse.de> <YZdzBGCnCXN8XDRA@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YZdzBGCnCXN8XDRA@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] dio_truncate.c test refactory with LTP API
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

Hi!
> > -	for (i = 0; i < 100; i++) {
> > -		dio_append(filename, 0);
> > -		truncate(filename, 0);
> > -		dio_append("junkfile", 0xaa);
> > -		truncate("junkfile", 0);
> > -	}
> > -
> >  	for (i = 0; i < num_children; i++) {

Also this should be for (i = 0; i < 100; i++) right?

> > -		kill(pid[i], SIGTERM);
> > +		dio_append(filename, 0, filesize, 200);
> > +		SAFE_TRUNCATE(filename, 0);
> > +		dio_append("junkfile", 0xaa, filesize, 200);
> > +		SAFE_TRUNCATE("junkfile", 0);
> >  	}

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
