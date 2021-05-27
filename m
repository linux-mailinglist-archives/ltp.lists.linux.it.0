Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC068392606
	for <lists+linux-ltp@lfdr.de>; Thu, 27 May 2021 06:19:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4FA9F3CA76E
	for <lists+linux-ltp@lfdr.de>; Thu, 27 May 2021 06:19:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9043F3C2ADA
 for <ltp@lists.linux.it>; Thu, 27 May 2021 06:19:51 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 06D91200DFA
 for <ltp@lists.linux.it>; Thu, 27 May 2021 06:19:50 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 02E3E218D6;
 Thu, 27 May 2021 04:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622089190;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=plsRLlRjdgeLXbPa7uG+Z4J3WSUjhgsmm/ML+ZHWS6w=;
 b=R0GDaJblyqpnNec4MbIRF/h8u6KQVgwTKuT1SE/n7kiS7C+icVd8Nf1jA88CIX8vbRRCKs
 tZFzMSQxSeqn0tKY9/w0ig5euyrcTLr03ZeXOSphnmbU9fPpVHUl288EUPNYNdIv0lCKL3
 WG56fqQuQIoPSSEBTUC678rZChxi2S8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622089190;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=plsRLlRjdgeLXbPa7uG+Z4J3WSUjhgsmm/ML+ZHWS6w=;
 b=V532F/0TLUF8Ox0hmvnkkuvVST1j2fGa1bIo+21oku6eNPbzG0sYzKxhZs35B4U4y7PrWV
 3Xfkqu3Eyj1Y9YCQ==
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id B4E0211A98;
 Thu, 27 May 2021 04:19:49 +0000 (UTC)
Date: Thu, 27 May 2021 06:19:48 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YK8d5APc1VZ0Q7T+@pevik>
References: <20210526154949.4473-1-pvorel@suse.cz>
 <CAEemH2ecppttvGW1JeJ_E=w1eUJYEY8+Sx8Euztn2MhRYykEKQ@mail.gmail.com>
 <CAEemH2fGaxQuTvpV1gEp8hVoeHo=42ikSRYs+5RmCuJQfJQa-g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2fGaxQuTvpV1gEp8hVoeHo=42ikSRYs+5RmCuJQfJQa-g@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] doc: Split test-writing-guidelines
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
Cc: Xiao Yang <yangx.jy@cn.fujitsu.com>,
 Richard Palethorpe <rpalethorpe@suse.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li, all,

> > > https://github.com/pevik/ltp/wiki/Test-Writing-Guidelines
> > > https://github.com/pevik/ltp/wiki/C-Test-API

> Seems we have a similar guideline "c-test-tutorial-simple.txt",
> maybe better to combine them together?
I'd prefer to keep them separate. Because otherwise page gets long again.
But I'd consider to unify names ("LTP C Test API" vs. "C Test Case Tutorial"
- API vs. Case).

Kind regards,
Petr

> > > https://github.com/pevik/ltp/wiki/Shell-Test-API

> Forgot to mention, with the increased number of docs, do you think it
> necessary to create an index for including all documents in a sort?
There is list of pages on the right. But as it's sorted alphabetically,
it's not enough. Maybe we should add this list to README.md and to HOME wiki
page.

Well, I have to say I hate github Wiki features. There is no table of content,
for page, we cannot change list of pages, ...

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
