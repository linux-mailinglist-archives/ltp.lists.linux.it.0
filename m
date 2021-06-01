Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3BE396FB9
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 11:00:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9F2EF3C8047
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 11:00:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 906563C2920
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 11:00:54 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id EF6DB1A008A1
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 11:00:53 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 165C11FD30;
 Tue,  1 Jun 2021 09:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622538053;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j8GnuWu8sCM7rW/I0t/uX9Q6wGCPcbyOQAu1cFDtDMM=;
 b=f2O8H+lcJdN1GfWyYSU6oy/SW/RwxY+cQhjc4MIY9SyYyKAG3ySIRJ6oO9LPd+FXi1QfwI
 FtICvTPaYREFIwDvHE8ackouRtrD3z2sWIbMb2pJnTAHAwSHsRR8BYKBg1LEmRGA+csC+A
 +cESnx/AtBA2XJ5SY/pF8MVnAoTWXLw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622538053;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j8GnuWu8sCM7rW/I0t/uX9Q6wGCPcbyOQAu1cFDtDMM=;
 b=FQfvXx+memIhEpjAMLq2HYxDEHvsnCupHgzqlOuNt/O2AGhhZwoW4QZwjPZzKtiBvtTkyp
 72rh7M38UUgDsrCw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 91A05118DD;
 Tue,  1 Jun 2021 09:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622538052;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j8GnuWu8sCM7rW/I0t/uX9Q6wGCPcbyOQAu1cFDtDMM=;
 b=VQ/RMRMKToRr2Fj4DSbsXpDYZncdGHZoat3YgnenCSSQ9Ne4NHBCWdEb85EsuoHJjx5W3j
 MQIlcLnl4FNbO9kAFm81vHjHtSDDN0tUnT+AnEBUOzZJDiaxwiVwzT25UnENyUOYhWyK+4
 NYGVtpsjku8ndAmDD3BNmsuDbNtGeSk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622538052;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j8GnuWu8sCM7rW/I0t/uX9Q6wGCPcbyOQAu1cFDtDMM=;
 b=P7tWocWS41tnNjIuExK1GpadACZj9qjRjQ09+EciDoMOHGUK4hdJtUHA6lHakoISVUe1pZ
 PwGfjyoIftJFBDBg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id d9hPIkT3tWCjWgAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Tue, 01 Jun 2021 09:00:52 +0000
Date: Tue, 1 Jun 2021 11:00:51 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YLX3Qyah6SLQTKzW@pevik>
References: <20210531135314.5067-1-mdoucha@suse.cz>
 <f8300887-b372-950e-5c26-92ba36869246@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f8300887-b372-950e-5c26-92ba36869246@bell-sw.com>
Authentication-Results: imap.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.50
X-Spamd-Result: default: False [-0.50 / 100.00]; ARC_NA(0.00)[];
 HAS_REPLYTO(0.00)[pvorel@suse.cz]; REPLYTO_EQ_FROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TO_DN_SOME(0.00)[];
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
Subject: Re: [LTP] [PATCH 1/2] network/busy_poll: Fix tests in namespaced env
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

> On 31.05.2021 16:53, Martin Doucha wrote:
> > Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> > ---
> >  testcases/network/busy_poll/busy_poll01.sh | 15 ++++++---------
> >  testcases/network/busy_poll/busy_poll02.sh |  7 +++----
> >  testcases/network/busy_poll/busy_poll03.sh |  7 +++----
> >  3 files changed, 12 insertions(+), 17 deletions(-)

> > diff --git a/testcases/network/busy_poll/busy_poll01.sh b/testcases/network/busy_poll/busy_poll01.sh


> Hi Martin,

> ...
> >  setup()
> >  {
> >  	busy_poll_check_config

> > -	busy_poll_old="$(cat /proc/sys/net/core/busy_poll)"
> > -	rbusy_poll_old=$(tst_rhost_run -c 'cat /proc/sys/net/core/busy_poll')
> > +	busy_poll_old="$(sysctl -n /proc/sys/net/core/busy_poll)"
> > +	rbusy_poll_old=$(tst_rhost_run -c 'sysctl -ne /proc/sys/net/core/busy_poll')
> >  }

> Here should be net.core.busy_poll, not the path.
Hi Alexey, Martin,

Yep, I was just going to report it as well.

Merging both patches with this fix, thanks both for your time!

Kind regards,
Petr

> Otherwise looks good.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
