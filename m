Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B17FB3B71EB
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 14:15:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 55DF53C6CF1
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 14:15:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3928A3C6CB6
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 14:15:43 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C0F191400BE9
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 14:15:42 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E5EF3226C0;
 Tue, 29 Jun 2021 12:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624968941;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l1twZzMEoH0+IbQxIkHnRnLSCYllsCUprqbpjxVRSqk=;
 b=XNiHVzzjyDH4eoL8S0TZlMw9Mync9ZF9o/mo2Lp5ZFyxDZIaCF1neiefj3rSX/lIVrhCHP
 1MY6jBNAOrPyaKohV/UmyBvVdhPBhu/1zT5VKIxJHwwidSG74vnNdehV7q1Fx5sSvs/F/R
 /wMbdETknHatFySxD1sz4uyRV4Es0I4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624968941;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l1twZzMEoH0+IbQxIkHnRnLSCYllsCUprqbpjxVRSqk=;
 b=OEK38661WM35HXm1eHdBmAPF7ZmlvcWg43s4TmmpWqX/awcyDcxkq4m6UB15dpdDpDHk88
 NhZcNIsLOMrBQcDw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 82CEB11906;
 Tue, 29 Jun 2021 12:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624968941;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l1twZzMEoH0+IbQxIkHnRnLSCYllsCUprqbpjxVRSqk=;
 b=XNiHVzzjyDH4eoL8S0TZlMw9Mync9ZF9o/mo2Lp5ZFyxDZIaCF1neiefj3rSX/lIVrhCHP
 1MY6jBNAOrPyaKohV/UmyBvVdhPBhu/1zT5VKIxJHwwidSG74vnNdehV7q1Fx5sSvs/F/R
 /wMbdETknHatFySxD1sz4uyRV4Es0I4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624968941;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l1twZzMEoH0+IbQxIkHnRnLSCYllsCUprqbpjxVRSqk=;
 b=OEK38661WM35HXm1eHdBmAPF7ZmlvcWg43s4TmmpWqX/awcyDcxkq4m6UB15dpdDpDHk88
 NhZcNIsLOMrBQcDw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id KKN6He0O22CKQgAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Tue, 29 Jun 2021 12:15:41 +0000
Date: Tue, 29 Jun 2021 14:15:39 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YNsO63zlBTPy9foV@pevik>
References: <20210629065836.20932-1-pvorel@suse.cz> <YNrFdXeCRXUko2Ua@pevik>
 <CAEemH2dTEC9QNhs4JZtiR33U9m=nyfQOiZ2u=DrMrXkVvcrRDw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dTEC9QNhs4JZtiR33U9m=nyfQOiZ2u=DrMrXkVvcrRDw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] delete_module0{1,
 3}: Skip when kernel is locked down
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
Cc: Anton Smorodskyi <asmorodskyi@suse.com>,
 Martin Doucha <martin.doucha@suse.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Jan, Li,

thanks for your review, merged!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
