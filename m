Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F320395B93
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 15:20:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1AF823C90A5
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 15:20:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7BA303C90B7
 for <ltp@lists.linux.it>; Mon, 31 May 2021 15:20:35 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 024621A0049E
 for <ltp@lists.linux.it>; Mon, 31 May 2021 15:20:34 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0FA8221920;
 Mon, 31 May 2021 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622467234; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kAmL7YzpPe4yZtWpImMv56LiI+M8y5UvRt/zefaZISQ=;
 b=bO4A86DehfCbi7uvpHvDRKg+gZ1so8CM3vZwrod4T5vVoSK11ENlMaS2eV/ItkvQWabjOw
 mgRmZNYJuMo8ohqYtEgOcNdk9VFiEpYdQ2jrpckq3n6y4XxvS2BpDHZpHCSn/k3kISZuA6
 uh4H6psUiqJKsg5uCWHmNo+fKz8Ixtk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622467234;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kAmL7YzpPe4yZtWpImMv56LiI+M8y5UvRt/zefaZISQ=;
 b=prs24NCau2coiZx7RZzFYAnfioy9NF0F99tmW6NUObl8x5Be/Mk5Gs8fjZFNIsw1S8Y3Xn
 SRCAejbg1CY7z0Bw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 8E714118DD;
 Mon, 31 May 2021 13:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622467233; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kAmL7YzpPe4yZtWpImMv56LiI+M8y5UvRt/zefaZISQ=;
 b=MbNf895IRqfOL+MXUPBJjj4jxyGegdSMGzbfwz0UjHxULKF3ceBMoqC5Xl/2pKgHA5NVlI
 sF/IB6ZnG+af57Mv9pQnQhe8TCdTjQ0fMvGyFdTIaOVDcJKC+t8jeAfkQRcsibiRd4Hi/B
 UgB3UA7EDONlqIW5nOm4UYFPgkaC1Rw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622467233;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kAmL7YzpPe4yZtWpImMv56LiI+M8y5UvRt/zefaZISQ=;
 b=kuMYHrsuKV9xxbZ5cUphj0vVNToxsgaJuH41S7Lr7vB1d3lrEc+vAn4JcXi1QWEivhK1Mt
 gq0F8LqpoRAHWADA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id TraUIaHitGDMVwAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Mon, 31 May 2021 13:20:33 +0000
Date: Mon, 31 May 2021 14:54:39 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YLTcjz4SoLJXPMTg@yuki>
References: <20210518122610.17171-1-liwang@redhat.com>
 <20210518122610.17171-2-liwang@redhat.com>
 <d70f9e5f-0008-02aa-e099-2a8243c4b3fa@jv-coder.de>
 <YLTYDC4hxQPVxkZq@yuki>
 <af8480e6-2020-d21d-bfe7-d9a4d28e0733@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <af8480e6-2020-d21d-bfe7-d9a4d28e0733@jv-coder.de>
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
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
> >> But one more strange thing here.
> >> I wonder why this even works. $pid is used in _tst_kill_test and defined
> >> in _tst_setup_timer as a local variable.
> >> It looks like it is inherited through the call chain and since it is
> >> copied to the background process, it cannot be manipulated by the tests.
> >> Still I would vote for changing this at some point, because it is highly
> >> confusing.
> > That's actually a correct and well defined behavior, if you call a
> > function g from function f the function g has access to the variables
> > local to f.
> >
> > And yes it's confusing, but the alternative is having another global
> > variable which I do not think is much better than this.
> Hm shell code has more strange behavior than I would have ever expected...

Strongly agree here, to be honest if there was as better scripting
language that would be widely avaiable I would have switched long time
ago...

> But at least Li and myself did not know that and even while you know 
> about this "feature", you think it is strange.
> I would rather like to be explicit and use a global variable (what harm 
> is it really?) instead of confusing the next one looking at this piece 
> of code....

If you really think global variable would be better, then go ahead and
send a patch, I do not have a strong feelings about this particular
detail.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
