Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F371139707C
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 11:40:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 42B483C8046
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 11:40:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E21AB3C1CB7
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 11:40:22 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0C2C31A01115
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 11:40:21 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6C31921920;
 Tue,  1 Jun 2021 09:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622540421;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rrMwaOV1jL6AWaCjHbZ15n73LEDUEXK/COxUMXrM7eA=;
 b=KNFiVtVbuZB/hyyJSmhaNzn7FodWLg+ZpF0tGX8Zy+IJbkZd/fGBAXbaPd/TG05LKJBCJl
 kkBc/cWt0JuX2Z07QNOxltTFsDvRkzB39yobsfbWQm5tLXwNV4i/sBzhX6PtBJ4sH+zGXL
 yD7nCNXZ29Tjz5lEW+2zozdHy+jendo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622540421;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rrMwaOV1jL6AWaCjHbZ15n73LEDUEXK/COxUMXrM7eA=;
 b=F6BJWm1rEFEKHqlpTU4TOsLLQuLjeG+W1ag4ztmT0vTjvveNCOLidce4bkxTvFqiTKSHAr
 x/8Sp79Ms/4AsFDQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 31732118DD;
 Tue,  1 Jun 2021 09:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622540421;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rrMwaOV1jL6AWaCjHbZ15n73LEDUEXK/COxUMXrM7eA=;
 b=KNFiVtVbuZB/hyyJSmhaNzn7FodWLg+ZpF0tGX8Zy+IJbkZd/fGBAXbaPd/TG05LKJBCJl
 kkBc/cWt0JuX2Z07QNOxltTFsDvRkzB39yobsfbWQm5tLXwNV4i/sBzhX6PtBJ4sH+zGXL
 yD7nCNXZ29Tjz5lEW+2zozdHy+jendo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622540421;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rrMwaOV1jL6AWaCjHbZ15n73LEDUEXK/COxUMXrM7eA=;
 b=F6BJWm1rEFEKHqlpTU4TOsLLQuLjeG+W1ag4ztmT0vTjvveNCOLidce4bkxTvFqiTKSHAr
 x/8Sp79Ms/4AsFDQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id DtuICoUAtmAscQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Tue, 01 Jun 2021 09:40:21 +0000
Date: Tue, 1 Jun 2021 11:40:19 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YLYAg9oM0XL4Q0/I@pevik>
References: <20210531165052.8731-1-pvorel@suse.cz>
 <20210531165052.8731-3-pvorel@suse.cz> <YLX5vtHAFVWUmjmU@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YLX5vtHAFVWUmjmU@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] CI: Rename travis script directory
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
Cc: ltp@lists.linux.it, Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> Hi!
> Looks good, acked.
Thanks!

I'm sorry, didn't read carefully that the first ack isn't for whole patchset,
thus merged whole patchset with your ack.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
