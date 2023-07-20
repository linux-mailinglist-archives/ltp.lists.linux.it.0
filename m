Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 304D075B35E
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Jul 2023 17:47:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 02F913CAE7B
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Jul 2023 17:47:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5434F3C0222
 for <ltp@lists.linux.it>; Thu, 20 Jul 2023 17:47:21 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9B856601BA9
 for <ltp@lists.linux.it>; Thu, 20 Jul 2023 17:47:20 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E3AEE1FE3A;
 Thu, 20 Jul 2023 15:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1689868039;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8exm3XadAcVRzCDg6udL5fkOYbJ0XkOwDmRBf/lgP+M=;
 b=rRMCGAxq5aFxPiR9ZqAh0GEJmpolglQsUzfaJcLPUedXWEduiMEBQ/k6TuQ8E+mIJb92aS
 2t//PoVtXr/93OX6DP+cWOlp3atTrC6G1Gl+6l+SM/TT8hzdlTOveOllox/qjSe4yiVmxr
 tfyHZUjOZzti2LRtQukpAo9a1NENgzQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1689868039;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8exm3XadAcVRzCDg6udL5fkOYbJ0XkOwDmRBf/lgP+M=;
 b=KWIvjpU6rO0L4cZT6rrbrxiMYENb12MUXX82zQJyjjfWqMcIeiKOcbNnc4U5Mqt2RaBeFg
 Lv0DDG9pBjW3siDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8FBCC133DD;
 Thu, 20 Jul 2023 15:47:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8ovNIAdXuWTIIQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 20 Jul 2023 15:47:19 +0000
Date: Thu, 20 Jul 2023 17:47:17 +0200
From: Petr Vorel <pvorel@suse.cz>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Message-ID: <20230720154717.GA1343882@pevik>
References: <20230711170335.13142-1-rick.p.edgecombe@intel.com>
 <20230712080936.GA756025@pevik>
 <504874fbc8cac972153d6592815c90af14b7a618.camel@intel.com>
 <ZK-wQ5cj39LnTPp9@yuki>
 <00ee0e896d7d385ec1b7e48dfccbada1c432360a.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00ee0e896d7d385ec1b7e48dfccbada1c432360a.camel@intel.com>
X-Virus-Scanned: clamav-milter 1.0.1 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] security/stack_clash: Add test for mmap()
 minding gap
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>,
 "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Rick,

> On Thu, 2023-07-13 at 10:05 +0200, Cyril Hrubis wrote:
> > Hi!
> > > > > ++++++++++++++++++++++++++++++++++++-
> > > > > =A0 1 file changed, 80 insertions(+), 1 deletion(-)

> > > > nit: You might want to add your copyright.

> > > What do you mean? It's not a new file..

> > Probably just to add "Copyright (c) 2023 your name" to the top of the
> > C file

> Should I send another version or do you guys want to just fixup these
> two things? (docparse and copyright)

I added your copyright and merged. I'll fix docparse later today in a separ=
ate
commit. Thank you!

Kind regards,
Petr

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
