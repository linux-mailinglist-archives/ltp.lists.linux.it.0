Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BEB4EA026
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Mar 2022 21:48:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E0C1E3C9AA2
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Mar 2022 21:48:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 234073C985F
 for <ltp@lists.linux.it>; Mon, 28 Mar 2022 21:48:31 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9CBC5100093A
 for <ltp@lists.linux.it>; Mon, 28 Mar 2022 21:48:30 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 988E81F858;
 Mon, 28 Mar 2022 19:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1648496909;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RgDWJnLiujkVyHGM8DsHindNGqg1Gwnyp1gUSJud0pE=;
 b=CjFw/+uzm+OSBvVsioIEg839cZ+uw7w2YTIWG0ShAtCP752IEToptPhf4zIhlI4zmfv3j1
 BRcQK65TDTEsJjmnBv70Di4AybER4eu7DFpkkUyVDFZyLWpdhWzfyCwmp0LYvd2Dwhh0we
 HFDCE8QCQBSo0vhbOLI8qSz0gaELpmQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1648496909;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RgDWJnLiujkVyHGM8DsHindNGqg1Gwnyp1gUSJud0pE=;
 b=JqE1keGit/sCz0KOO2aQ/hnGCousLiQdf/2wCaO3jFCrEBjtkYHimyaj4F29Gg8/9PSBhM
 wXf+MvqrRT5UhOBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5667313215;
 Mon, 28 Mar 2022 19:48:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2a9dEQ0RQmKfOwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 28 Mar 2022 19:48:29 +0000
Date: Mon, 28 Mar 2022 21:48:26 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YkIRCiRp2p9lnrS+@pevik>
References: <20220325184435.1206-1-pvorel@suse.cz>
 <YkHL1zy02XSDL0C6@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YkHL1zy02XSDL0C6@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] lib: Retry safe_clone() on ENOSPC|EUSERS
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
> > +	/* too fast creating namespaces => retrying */
> > +	if (pid < 0 && (errno == ENOSPC || errno == EUSERS)) {
> > +		tst_res_(file, lineno, TINFO | TERRNO, "%s() failed => retrying",
> > +				 pid == -2 ? "clone" : "clone3");
> > +		usleep(100000);
> > +		pid = tst_clone(args);

> Wouldn't it make sense to use the exponential backof macro we have in
> tst_common.h?
+1 => I'll send v2.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
