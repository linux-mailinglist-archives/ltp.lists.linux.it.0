Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C83B647E06A
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Dec 2021 09:29:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B22393C927E
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Dec 2021 09:29:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 068E63C08F2
 for <ltp@lists.linux.it>; Thu, 23 Dec 2021 09:29:40 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 580BE2011A7
 for <ltp@lists.linux.it>; Thu, 23 Dec 2021 09:29:39 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8503521136;
 Thu, 23 Dec 2021 08:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1640248179;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JEJFl4FnI6fp7TJEGRGz5TDAmGszFnKoPH8jnJd2B0s=;
 b=aZ7WbNd8eEbogsyrqTksfG8V74kgD7YZzJ8PXeORMY1ctBjOpK24oefGaNxoULabMWZ65r
 VYkP71zHvoEDwvl9ECwkZAZ3tJJTSaBWy8WH+lDTpk+e48bTVEEdC1P7VdOKACkyX7iNMY
 z+PLp76iu6dSPog6jqBuvTS8RX9U6CY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1640248179;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JEJFl4FnI6fp7TJEGRGz5TDAmGszFnKoPH8jnJd2B0s=;
 b=P8fZg0Gfg4WwOj03LS6wzqiXN5koMd4muyU564t9IBTfeqWQMd7HMVj679Y7jUL4vrkfPZ
 6p5g7IBZaZentSCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3729013E82;
 Thu, 23 Dec 2021 08:29:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VczRCnMzxGF/ZAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 23 Dec 2021 08:29:39 +0000
Date: Thu, 23 Dec 2021 09:29:37 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>, ltp@lists.linux.it
Message-ID: <YcQzcQuiXBQJPUR6@pevik>
References: <CAEemH2di0818vNoByrpUeEfZi-T58fNMg131=HZFeF2W6Be0Ng@mail.gmail.com>
 <20211223024841.801160-1-liwang@redhat.com>
 <YcQrzbWJyWPpyjeZ@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YcQrzbWJyWPpyjeZ@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] lib: Do not fail a test if oom score cannot be
 adjusted.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> I'm testing upgrade to impish:

> https://github.com/pevik/ltp/actions/runs/1614667613

Hm, impish is also broken. Hope it's just temporary issue.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
