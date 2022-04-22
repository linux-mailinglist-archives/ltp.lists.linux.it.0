Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8617350B61C
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Apr 2022 13:24:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D97FF3CA704
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Apr 2022 13:24:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7283A3C5DC4
 for <ltp@lists.linux.it>; Fri, 22 Apr 2022 13:24:12 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E775F1400437
 for <ltp@lists.linux.it>; Fri, 22 Apr 2022 13:24:11 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D25B7210F3;
 Fri, 22 Apr 2022 11:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1650626650;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/r4u6DqqwTGTzyq9+F6m/PA5V0JFoGSEDrD39vFJK3o=;
 b=UrHb4av69QHPljLjPij985Ddu9wz7qJuar9Dnf+FYgJ+Gwy+YIjF69rsPI1IAQbhky+84m
 NkBQQaqGjhFoAC1EtkOYJVAJMGh8cPUICdQaDr9ae6QlwpJV0lu9fuPJo7z9qASxBVVF2Z
 FAxYcvIi5HwBi7HAfW9lzYjuDE+tcng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1650626650;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/r4u6DqqwTGTzyq9+F6m/PA5V0JFoGSEDrD39vFJK3o=;
 b=RuLAj+IYx8Wn+DaLGauEmwo9IsXoOZVMXDZaoeif9U2ZTtozISlhYbDyuNI41MhJARbADi
 gxQnrh2kZiXZbBCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AD631131BD;
 Fri, 22 Apr 2022 11:24:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dvf3KFqQYmKnPQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 22 Apr 2022 11:24:10 +0000
Date: Fri, 22 Apr 2022 13:24:03 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YmKQUzWN7DKS30r4@pevik>
References: <20220316150429.2873-1-pvorel@suse.cz> <YjH9dDef3w7Iu3vG@pevik>
 <CAEemH2cB+k+dbS_N=S0jGs9H3ct1wBUYhuaR-+V7wRVtydVN_g@mail.gmail.com>
 <YjQ1WKtV0amHh4Aq@pevik>
 <CAEemH2e8af4Y=1vGTL36OjKy2TbuYRBwYFkf7fHT7pfjg6-87w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2e8af4Y=1vGTL36OjKy2TbuYRBwYFkf7fHT7pfjg6-87w@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC][PATCH 1/1] ci: Ubuntu xenial -> bionic
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

Hi Cyril,

gently ping for ack.

NOTE: if we accept it, I need also to update doc/supported-kernel-libc-versions.txt:

-| Ubuntu 16.04 LTS xenial      | 4.4    | 2.23  | 5.3.1 | -
-| Debian 9 stretch (oldstable) | 4.9.30 | 2.24  | 6.3.0 | 3.8
+| Debian 9 stretch (oldstable) | 4.9.30 | 2.24  | 6.3.0 | 3.8
+| Ubuntu 16.04 LTS xenial      | 4.15   | 2.27  | 7.3.0 | -

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
