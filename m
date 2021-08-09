Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 719E13E46D0
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Aug 2021 15:40:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AAFA03C71C0
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Aug 2021 15:24:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8E6463C5EA9
 for <ltp@lists.linux.it>; Mon,  9 Aug 2021 15:24:13 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 929EF6002C6
 for <ltp@lists.linux.it>; Mon,  9 Aug 2021 15:24:12 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E26EC1FD67;
 Mon,  9 Aug 2021 13:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628515451; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vyRvB0R3CW+aPlD9fXZ1te6IduwmhAYxounRyG4uR+4=;
 b=ExHDO9LzE7e7Uowf6VZcVi8khzmLTQjN2FJyV1J79ZLA30KfY54ex41JKyrpfnJ2q2ruNA
 pysGfX73n/NerAFnVMK+Mr/6O54SNFKiVlRlDXScYG/sC4kGaYe8JyCFNAWpeYb60goPlt
 wROgXaL8CjDO2NOW59hVoR7Ag8PwKlc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628515451;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vyRvB0R3CW+aPlD9fXZ1te6IduwmhAYxounRyG4uR+4=;
 b=VE5hyl3I511D0S6wlrLfJd7w4xxFU3yYo9S8ssxUfAiubIDiK3raxvarJbAW7bmq3fFj6x
 WlGokJx9NQywB7AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CADFD13BAD;
 Mon,  9 Aug 2021 13:24:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BkImMXssEWFfHgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 09 Aug 2021 13:24:11 +0000
Date: Mon, 9 Aug 2021 15:24:22 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YREshhDwOKlFpbbi@yuki>
References: <20210806032131.25721-1-zhanglianjie@uniontech.com>
 <b208d879-0d31-ff16-4ef0-d363e9a65c51@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b208d879-0d31-ff16-4ef0-d363e9a65c51@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib/tst_tmpdir: tst_get_tmpdir() add error handing
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
> > -	return strdup(TESTDIR);
> > +	ret = strdup(TESTDIR);
> Is a failing strdup here really a thing? The only reason strdup should 
> be able to fail is with ENOMEM.
> The only way tst_brkm will work, if strdup fails here is, if TESTDIR is 
> an extremely huge string (the NULL case is already handled above).

It's unlikely, but it may happen if:

* Someone runs memeater on the baground along with LTP
* And kernel is set not to overcommit

And in a case of the test lirary I would rather see it written so that
we check everything, even the unlikely errors.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
