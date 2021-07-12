Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A45453C6035
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 18:12:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 755633C7620
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 18:12:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BF68E3C18F7
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 18:12:33 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 161F360055D
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 18:12:32 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 664F121F68;
 Mon, 12 Jul 2021 16:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626106352;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+LDBkcRS7+hbMSt0Zix+SD0ZiaLACpdUJeJQwfjj98o=;
 b=XFnq7rNYmo0ef2SjJ5kNm13ht/7MCEu4oc5+PzfDH0+NcGhO+TYHAhSaJALGVaPCRHy2YS
 wolHegR1ocmOsFSExLqns1kLxDPt6742cikAhf9mZMFZgW/61A0zaq7zKpdnAj4HHYHy2q
 Es8B+BtcpsiudQS8O8E356g85bukgno=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626106352;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+LDBkcRS7+hbMSt0Zix+SD0ZiaLACpdUJeJQwfjj98o=;
 b=CLm5ph+ngbGjqQeG8qgVn6XLe4nBFuLPskZVZcXhUxERrO4taLsobMDixBGIFqwTzwkftR
 QcImyiMa+XmAPsCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 304E613BB0;
 Mon, 12 Jul 2021 16:12:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RPXhCfBp7GBGGgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 12 Jul 2021 16:12:32 +0000
Date: Mon, 12 Jul 2021 18:12:30 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YOxp7pwIQKDiT3bs@pevik>
References: <20210709140143.9180-1-pvorel@suse.cz>
 <CAEemH2fB5VakafKhTgcOsvwK6Q50AJ3WcpRY2fSLfhB86b03Nw@mail.gmail.com>
 <YOvX/tczl7Duu+6L@pevik>
 <34959e10-45fc-f7ea-9e2d-ebe186a97859@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <34959e10-45fc-f7ea-9e2d-ebe186a97859@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] tst_net.sh: Declare prefix variable as empty
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> in tst_ipaddr_un(). This is required to fix problem on dash, which
> (unlike bash and busybox ash implementation) takes value of previously
> defined variable, i.e.  guarding with local does not work:
> 
> $ foo=ee; bar() { local foo; echo "foo: '$foo'"; }; bar
> foo: 'ee'
> 
> It requires declare it as empty:
> $ foo=ee; bar() { local foo=; echo "foo: '$foo'"; }; bar
> foo: ''
> 
> This problem seems to be on various dash versions from 0.5.8 to
> 0.5.11+git20200708+dd9ef66-5 (on Debian oldstable, stable, testing).
> It'd require to set all variables, but now fix just prefix, which is
> used in build.sh and it's quite common name.

FYI this behavior is expected on dash, quoting man dash(1):
"When a variable is made local, it inherits the initial value and exported and
readonly flags from the variable with the same name in the surrounding scope, if
there is one."

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
