Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD2639D8F5
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 11:38:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 670B23C4DBB
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 11:38:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DD7F93C187D
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 11:38:48 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BB08B140054C
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 11:38:47 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 031B721A87;
 Mon,  7 Jun 2021 09:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623058727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cui3w0lcC+Oovc2nUPOLzAKlqeM1G7UeOenF4E9msg0=;
 b=q81qcpXgACHr2GEZebaBgaZAhkGSF1AzPS6xOr+bhtyYlNP49uNxVvOGkRLuruaUJbCKMj
 TeJXmDRE7eDgehI64OavkKyoe8u0A1qCQNg5BWRGU3KerbZvzzVVC16dyhXOuz2Y032JH3
 qt6wCZxzLNb3QbQQ9Rate40cZdOPgwE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623058727;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cui3w0lcC+Oovc2nUPOLzAKlqeM1G7UeOenF4E9msg0=;
 b=J1IwD+JDIN/s4f2SJ9gc9Atrolwopr/fuMa0g2HHBpKsp7qxP1n/5VPptzC9i6JihijtAK
 hJ8CtzALPip/mVBg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id D46D5118DD;
 Mon,  7 Jun 2021 09:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623058726; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cui3w0lcC+Oovc2nUPOLzAKlqeM1G7UeOenF4E9msg0=;
 b=nD9Qcu2Yz5VnFEuKorX6XcCVdoD8p4l2HY5mWnwzVVLwVMp0onT3bUn+EXQeB4oHoObL9b
 d+MtGIPkuJ+mQ1Ofi6lxlOayJnCA0yqwQyizEZbzbQ/oTDCIs5mcOh1Z4ephA8OFu+53yo
 OaCp9VJxLtGkt4TifK3RQzLueK8LK+I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623058726;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cui3w0lcC+Oovc2nUPOLzAKlqeM1G7UeOenF4E9msg0=;
 b=+jxJ4aYiyhYpimNeDM0Mpq2c3hBqbrzM/Z7I10Edt7x9maJx6seCVQ9zayUDf3hK1DhJL4
 hF2zfYbEOrD3R5Ag==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id bNFbMybpvWCAGAAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Mon, 07 Jun 2021 09:38:46 +0000
Date: Mon, 7 Jun 2021 11:12:55 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YL3jFyCj8aPSEpXw@yuki>
References: <20210604111434.21422-1-rpalethorpe@suse.com>
 <20210604111434.21422-2-rpalethorpe@suse.com>
 <e6efb099-1c51-9f68-4996-7ce917107929@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e6efb099-1c51-9f68-4996-7ce917107929@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v2 1/2] Add 'make check' and clang-check to
 build system
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > +include $(top_srcdir)/include/mk/env_pre.mk
> > +include $(top_srcdir)/include/mk/functions.mk
> > +
> > +HOST_MAKE_TARGETS	:= main
> > +HOST_LDFLAGS 		+= -lclang
> If anyone else trying this has problems linking the tool, at least for 
> me, this must be
> HOST_LDLIBS ?????? ?????? += -lclang
> 
> Otherwise the link order is wrong (main.c after -lclang) and all symbols 
> from libclang are undefined.

Thx for report, indeed that has to be fixed.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
