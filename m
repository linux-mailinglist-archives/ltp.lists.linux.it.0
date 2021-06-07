Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF2739D8FB
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 11:40:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C2F8B3C4DE9
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 11:40:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C037C3C187D
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 11:40:37 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3DB681A000BC
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 11:40:36 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7EABA1FDA1;
 Mon,  7 Jun 2021 09:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623058836; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uPfl6Dq7i/k/yX/um9P9vG8EzWeXInsvpfgvB25Gt2s=;
 b=2jb31BDAKCqXXSL+bxig2SyTxX92rNwu/p9cduiyqwNJ5J9ooiI8OiPRSaAqpR3BxWGHDr
 G/BaShkI8xg6SyihxEE+Q2I9ZJjv5CIGTMZ/pbb8IBTZcJPRuVtRXuMqUjfzj2UpCcFFHt
 NRrLkqGQqmYELQDSJnrhXXjqrM7ZrPY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623058836;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uPfl6Dq7i/k/yX/um9P9vG8EzWeXInsvpfgvB25Gt2s=;
 b=VJe4Aj/uOEZXB8Kb/iBb7hCARy32zU0BNdyVXxvUVGshl3qNHiyWDAmS9v2d1DPR5HU4XH
 Q++xHJ+jdZtKz4AA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 5F362118DD;
 Mon,  7 Jun 2021 09:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623058836; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uPfl6Dq7i/k/yX/um9P9vG8EzWeXInsvpfgvB25Gt2s=;
 b=2jb31BDAKCqXXSL+bxig2SyTxX92rNwu/p9cduiyqwNJ5J9ooiI8OiPRSaAqpR3BxWGHDr
 G/BaShkI8xg6SyihxEE+Q2I9ZJjv5CIGTMZ/pbb8IBTZcJPRuVtRXuMqUjfzj2UpCcFFHt
 NRrLkqGQqmYELQDSJnrhXXjqrM7ZrPY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623058836;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uPfl6Dq7i/k/yX/um9P9vG8EzWeXInsvpfgvB25Gt2s=;
 b=VJe4Aj/uOEZXB8Kb/iBb7hCARy32zU0BNdyVXxvUVGshl3qNHiyWDAmS9v2d1DPR5HU4XH
 Q++xHJ+jdZtKz4AA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id DoVsF5TpvWDBGQAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Mon, 07 Jun 2021 09:40:36 +0000
Date: Mon, 7 Jun 2021 11:14:45 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YL3jhejzH6hTYuPZ@yuki>
References: <20210604111434.21422-1-rpalethorpe@suse.com>
 <85bddc61-f6dc-de7c-3a62-daeefcd0a058@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <85bddc61-f6dc-de7c-3a62-daeefcd0a058@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v2 0/2] Libclang based analyzer
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
> So in conclusion, I do not think we can assume libclang to be available 
> for all developers and installing it is probably more work, at least 
> when newer functions from libclang are used, than installing coccinelle.
> And very important for final setup: It must be possible to successfully 
> compile ltp, without libclang/coccinelle available. There is no reason 
> to force this libraries/tools for pure "users" of ltp.

Indeed this is supposed to be tooling for developers and strictly
optional. If this breaks builds without libclang it has to be fixed.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
