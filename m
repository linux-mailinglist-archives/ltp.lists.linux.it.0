Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AD53F291B
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Aug 2021 11:28:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 054503C262C
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Aug 2021 11:28:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E9F1A3C1F4E
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 11:28:23 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 61E56200214
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 11:28:22 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 11CB821F5F;
 Fri, 20 Aug 2021 09:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629451702;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cj2qpNPBS28TR/FH21cwfBDjkXPKLpKNsWUHQVYX/kw=;
 b=cGqa+X/v/LnVRROBk5Kao02XwIj6M5snyju6HhuNgkMcDgUZeuFgqPhuR+f25WWkFRYcHB
 ESp5t96b0GE7DbdhLgAL1ntObHVyLL6GUqhdjIB4w3jqiStQa/7lAMckXsB5kx01HxFgzr
 l9G5lONfxJyzyNZC3zUOAeEfY1qOZSI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629451702;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cj2qpNPBS28TR/FH21cwfBDjkXPKLpKNsWUHQVYX/kw=;
 b=Vkavx4XimMd99MM4pt2uOc4tDlsvZrV/glRgl7vOZxIfH7XTGtors2pNxqdY4TEIaz6shE
 aC2EBPnW2uGzCuAg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id C6A2C13883;
 Fri, 20 Aug 2021 09:28:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id nMuoLrV1H2HLWQAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Fri, 20 Aug 2021 09:28:21 +0000
Date: Fri, 20 Aug 2021 11:28:14 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YR91rn//J+HvvUsh@pevik>
References: <20210818091224.27578-1-pvorel@suse.cz>
 <20210818091224.27578-2-pvorel@suse.cz>
 <7ac7a1d6-2d97-f8f5-8d60-040eb0753681@jv-coder.de>
 <YRzVpQT1zYOvxlWe@pevik>
 <CAEemH2es_CzWugkyOworVLFe+ZbtFxpYXK5HjdE_g_w4wHvzVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2es_CzWugkyOworVLFe+ZbtFxpYXK5HjdE_g_w4wHvzVQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] tst_test.sh: Simplify tst_cmd_available()
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
Cc: Elliott Hughes <enh@google.com>, LTP List <ltp@lists.linux.it>,
 Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li, all,

...
> Another reason, I guess, is `command -v ` looks to match the function name
> more:).
> But it depends on you, I'm OK with any of them.
I merged it with "command -v" and second commit.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
