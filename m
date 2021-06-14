Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 804B33A6935
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Jun 2021 16:45:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1134A3C8AFE
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Jun 2021 16:45:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 13E753C0138
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 16:45:34 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 91BE960069D
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 16:45:34 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DEAFF2198F;
 Mon, 14 Jun 2021 14:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623681933; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k+eU0d87J3TrfoIB+L9i0CmomLSs1blhH83FNhUFIco=;
 b=vL70MAhm1Lb3r9tl9oUFjLIhi40Lva6orqAVniUXJgSntqREVOaxu6KdwQKRpNE35WCKks
 pfMElYeARTiTOYfRsEiWpNRcPvJJ7LOo//KaN9g2tbCuhm0VVQKMaBS/8k3t2rOZgwQw16
 yvgE+w9ZZXyrg2Z6vwsrksOYZJewIh0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623681933;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k+eU0d87J3TrfoIB+L9i0CmomLSs1blhH83FNhUFIco=;
 b=merrb4R4hq2RfjQ7j+4xCmTGzGemtBVSPfp2Wkvn9nuanGNORSpK2FT/LRta3EHRBCg+Ao
 U0XxbR335WRtV3Aw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id A26FA118DD;
 Mon, 14 Jun 2021 14:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623681933; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k+eU0d87J3TrfoIB+L9i0CmomLSs1blhH83FNhUFIco=;
 b=vL70MAhm1Lb3r9tl9oUFjLIhi40Lva6orqAVniUXJgSntqREVOaxu6KdwQKRpNE35WCKks
 pfMElYeARTiTOYfRsEiWpNRcPvJJ7LOo//KaN9g2tbCuhm0VVQKMaBS/8k3t2rOZgwQw16
 yvgE+w9ZZXyrg2Z6vwsrksOYZJewIh0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623681933;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k+eU0d87J3TrfoIB+L9i0CmomLSs1blhH83FNhUFIco=;
 b=merrb4R4hq2RfjQ7j+4xCmTGzGemtBVSPfp2Wkvn9nuanGNORSpK2FT/LRta3EHRBCg+Ao
 U0XxbR335WRtV3Aw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id okTIIY1rx2DWDAAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Mon, 14 Jun 2021 14:45:33 +0000
Date: Mon, 14 Jun 2021 16:19:51 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Vinay Kumar <vinay.m.engg@gmail.com>
Message-ID: <YMdlh1Ek/jknzjq9@yuki>
References: <YMNoFyN89L6/VhP3@yuki>
 <20210613164335.6035-1-vinay.m.engg@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210613164335.6035-1-vinay.m.engg@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] getitimer02: Convert getitimer02 to new API
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
Cc: umesh.kalappa0@gmail.com, metan@ucw.cz, rwmacleod@gmail.com,
 vinay.kumar@blackfigtech.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Pushed with small changes, thanks.

* Adjusted the docparse comment to be more clear

* I've removed the printf format from TST_EXP_FAIL() since
  in this case the automatic message will be nicer

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
