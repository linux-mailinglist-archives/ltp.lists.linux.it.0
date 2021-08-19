Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 883DE3F1308
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Aug 2021 08:04:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DC8023C5551
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Aug 2021 08:04:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9822F3C535F
 for <ltp@lists.linux.it>; Thu, 19 Aug 2021 08:04:18 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7535E1000F1B
 for <ltp@lists.linux.it>; Thu, 19 Aug 2021 08:04:17 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 68B4D22084;
 Thu, 19 Aug 2021 06:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629353056;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ROcVhsTpiVeY6fs2bOrXzQNsyk6yuztbYTkkd4ZE9H0=;
 b=BCmbZXbTPAR44QXAM79M4EJUWjI4Z0ye/zmHwYSu7Pr9bf203jWDSN9VVQJhZhXd0k+Z0/
 tlv1KX0p2fzovApyMgY+0vhYXIj2cMDj64N/u46Fw8gzjJBJk824wABfE75Hvaed+2y242
 r9B6EDV87xsZCrEAFv6V7P692KhOiuc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629353056;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ROcVhsTpiVeY6fs2bOrXzQNsyk6yuztbYTkkd4ZE9H0=;
 b=1ckcvATp7t3xtCL/UDDlGG0xJ/cgF4XiOULpVmpd/K+AaQgp14OTTRr+wNxKJqdsSDWVnj
 zuZFaEESQgTxVGBA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 196811371C;
 Thu, 19 Aug 2021 06:04:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id wyG9A2D0HWEXHAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Thu, 19 Aug 2021 06:04:16 +0000
Date: Thu, 19 Aug 2021 08:04:14 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YR30XvGDBTXR/UWp@pevik>
References: <20210818091224.27578-1-pvorel@suse.cz>
 <20210818091224.27578-4-pvorel@suse.cz>
 <8589e81b-4c45-e62e-297a-ef6a3cd548dc@jv-coder.de>
 <YRzaf3jq02zM306Y@pevik>
 <CAEemH2eyyT4STv1NyUnc1hp39z-x3vsetc8z3hVKqs=uaMqGMA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2eyyT4STv1NyUnc1hp39z-x3vsetc8z3hVKqs=uaMqGMA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] commands: Drop which01.sh
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
Cc: LTP List <ltp@lists.linux.it>, Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li, all,

> I just have a look at which01.sh that is written by the new API and so far
> so good.
> Maybe we can reserve it for a bit long time.

OK, two people asking to keep it, lets keep it :).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
