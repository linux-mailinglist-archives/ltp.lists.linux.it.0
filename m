Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A42C839724E
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 13:26:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 601883C8017
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 13:26:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E3C563C5A31
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 13:26:35 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5260E1A00921
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 13:26:35 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A91C221919;
 Tue,  1 Jun 2021 11:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622546793; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/F5R5GpuFPnXnfvZfrijv7DtSyPwTeFWupVjdT03QvQ=;
 b=2ogIbpAxX3vPj43ELx9oZ8wAZF2rsUzn3dOa198DpTQzWs/FE/BNj3eJOaGf9GKhW3ySxa
 DSwuFWtLwdy/n/ICHKHsjBMjg9ZDdJk5WymX+30Ma7500ssV91YADe8KnfHgZI7CVkx7XK
 1FjXzF1W+R0lzinOWyGqwszF5F19xG8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622546793;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/F5R5GpuFPnXnfvZfrijv7DtSyPwTeFWupVjdT03QvQ=;
 b=otlIwapT1wRW2D+biBZ4RU0BQAGauWFXqFZdgNG7p7le6azrehdeX5XYea5x/NJnOm+wFg
 hTH3h8iNFGd4hBAg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 89FB9118DD;
 Tue,  1 Jun 2021 11:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622546793; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/F5R5GpuFPnXnfvZfrijv7DtSyPwTeFWupVjdT03QvQ=;
 b=2ogIbpAxX3vPj43ELx9oZ8wAZF2rsUzn3dOa198DpTQzWs/FE/BNj3eJOaGf9GKhW3ySxa
 DSwuFWtLwdy/n/ICHKHsjBMjg9ZDdJk5WymX+30Ma7500ssV91YADe8KnfHgZI7CVkx7XK
 1FjXzF1W+R0lzinOWyGqwszF5F19xG8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622546793;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/F5R5GpuFPnXnfvZfrijv7DtSyPwTeFWupVjdT03QvQ=;
 b=otlIwapT1wRW2D+biBZ4RU0BQAGauWFXqFZdgNG7p7le6azrehdeX5XYea5x/NJnOm+wFg
 hTH3h8iNFGd4hBAg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id x/xlIGkZtmDxMwAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Tue, 01 Jun 2021 11:26:33 +0000
Date: Tue, 1 Jun 2021 13:00:40 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Alexander Egorenkov <egorenar@linux.ibm.com>
Message-ID: <YLYTWKje1GXDNy/c@yuki>
References: <20210601093614.245873-1-egorenar@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210601093614.245873-1-egorenar@linux.ibm.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] clock_settime03: fix type of time
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
Applied, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
