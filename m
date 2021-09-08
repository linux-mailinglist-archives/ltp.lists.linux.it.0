Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A971C403B93
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Sep 2021 16:32:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 150D53C86D5
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Sep 2021 16:32:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BB4273C2297
 for <ltp@lists.linux.it>; Wed,  8 Sep 2021 16:32:02 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3B2CB1A01149
 for <ltp@lists.linux.it>; Wed,  8 Sep 2021 16:32:01 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3E4B9221FB;
 Wed,  8 Sep 2021 14:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631111521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nt34ZjimyI1nsReHe+PAEpp2EpHySMHLpYthzI93A0U=;
 b=V453tfBNRczbKPxN9s6hFyjL6Wfp/RwkBWPsLAfVhMWDBEORV11tjjuW2NMS1SQDzFl1ux
 4EBlgNcE/ucWQ18up7JGp7Ks2zxy2RmScNL1UYqkwGXkdr2kJ5iYOxFUf+EK1Kiv/kIf8v
 z1VKSUtte2QM6IZxBd/l9RNH/GiVwS0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631111521;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nt34ZjimyI1nsReHe+PAEpp2EpHySMHLpYthzI93A0U=;
 b=6m7jenGCTggT5FzlTL2SOLCEFb7kErjIzV6w3RFjLrz/LohHi7CSfspzjW7Lubp+uQDTUm
 L9BTVnLqs2X0rBCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 29EB013D0B;
 Wed,  8 Sep 2021 14:32:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tatACWHJOGELFgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 08 Sep 2021 14:32:01 +0000
Date: Wed, 8 Sep 2021 16:32:14 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <YTjJbnPleZA4wZJb@yuki>
References: <20210624132226.84611-1-krzysztof.kozlowski@canonical.com>
 <YTi8qQOZU3NriZvZ@yuki>
 <3308f9e1-7766-8409-0360-9fe798276a90@suse.cz>
 <YTjGCeaaA0Nv56hn@yuki>
 <CA+Eumj53j-AucdNdJ91-wHO6CN=jNg=kpNpxNwnRwqvbxsWMkw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+Eumj53j-AucdNdJ91-wHO6CN=jNg=kpNpxNwnRwqvbxsWMkw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib: memutils: don't pollute entire system memory
 to avoid OoM
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
> > Sounds good.
> >
> > Krzysztof unless you disagree I will push your patch but change the
> > division factor from 200 to 64.
> 
> 
> Sounds good. In such case please also update the % mentioned at the
> end of commit msg (0.5% -> 1.5%).

Done and pushed, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
