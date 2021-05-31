Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08409395BD9
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 15:23:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9DC653C806E
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 15:23:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7C01C3C5F64
 for <ltp@lists.linux.it>; Mon, 31 May 2021 15:23:46 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0EE81200A10
 for <ltp@lists.linux.it>; Mon, 31 May 2021 15:23:45 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6294B1FD30;
 Mon, 31 May 2021 13:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622467425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9RBKpKj1HNEXwdGnfvpiWT9KhMyvJrbQ1Z+Z5yh6xmA=;
 b=hmZU+/p1kfiOFlMudfoZeR4Osn0uOxSfug+aE4ot/EkurX8X3FMr06GAcNND6ZW7BjYTXq
 Q3e9zJWptnAOzDDxBckRRy6roifYJ6UjdUpysQY+Bd8Kwnxfn6XtqgySN6ETqw6X9a7ATd
 VzQH77EdwCJ3PltbUpTPXyjNQnGsrDI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622467425;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9RBKpKj1HNEXwdGnfvpiWT9KhMyvJrbQ1Z+Z5yh6xmA=;
 b=g7TP43Mromojf+jePg9zkwGLnk8SnFWGUlsNq0glNlCBrdadl1DWtpYTDADhGVQjhiEO0a
 4De2x9BOEqsDv0CQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 0445A118DD;
 Mon, 31 May 2021 13:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622467425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9RBKpKj1HNEXwdGnfvpiWT9KhMyvJrbQ1Z+Z5yh6xmA=;
 b=hmZU+/p1kfiOFlMudfoZeR4Osn0uOxSfug+aE4ot/EkurX8X3FMr06GAcNND6ZW7BjYTXq
 Q3e9zJWptnAOzDDxBckRRy6roifYJ6UjdUpysQY+Bd8Kwnxfn6XtqgySN6ETqw6X9a7ATd
 VzQH77EdwCJ3PltbUpTPXyjNQnGsrDI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622467425;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9RBKpKj1HNEXwdGnfvpiWT9KhMyvJrbQ1Z+Z5yh6xmA=;
 b=g7TP43Mromojf+jePg9zkwGLnk8SnFWGUlsNq0glNlCBrdadl1DWtpYTDADhGVQjhiEO0a
 4De2x9BOEqsDv0CQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id M72VO2DjtGCEWQAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Mon, 31 May 2021 13:23:44 +0000
Date: Mon, 31 May 2021 14:57:51 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YLTdT3v4AscW1PIE@yuki>
References: <20210518122610.17171-1-liwang@redhat.com>
 <20210518122610.17171-2-liwang@redhat.com> <YLTbXU1ZF4ZiXKdt@yuki>
 <20f87781-e66d-e8c6-1ac5-de208667a7f2@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20f87781-e66d-e8c6-1ac5-de208667a7f2@jv-coder.de>
Authentication-Results: imap.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.50
X-Spamd-Result: default: False [-0.50 / 100.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[3]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; RCVD_NO_TLS_LAST(0.10)[];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 MID_RHS_NOT_FQDN(0.50)[]; RCVD_COUNT_TWO(0.00)[2]
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] tst_test: using SIGTERM to terminate process
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
> >>   # default trap function
> >> -trap "tst_brk TBROK 'test interrupted or timed out'" INT
> >> +trap "tst_brk TBROK 'test interrupted'" INT
> >> +trap "unset _tst_setup_timer_pid; tst_brk TBROK 'test terminated'" TERM
> > I've been looking at this for a while and I think that we should unset
> > the _tst_setup_timer_pid at the end of the _tst_timeout_process()
> > instead, right?
> That won't work or am I missing something? ;) We are in a subshell in 
> _tst_timeout_process, it cannot manipulate the environment of the parent 
> or is my mental modal of how shell works wrong again?.

Nah, you are right this time, I missed that it runs on a background.

> > Otherwise we will leave the timeout process sleeping if someone sends
> > SIGTERM to the test process from the outside, or do I miss something?
> Yes, that is one of the reasons why I initially suggested a different 
> signal for timeout. That would cleanly separate the logic.
> But on the other hand when will SIGTERM be sent from the outside? This 
> is probably only happening on shutdown? In that case it is not really a 
> problem.
> If someone wants to terminate gracefully using SIGTERM, he could send it 
> to the process group. That would kill the timeout process as well.

Okay. Let's go with this version, it's simple enough and anything that
would behave better would only overcomplicate the code again.

For the patch:

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
