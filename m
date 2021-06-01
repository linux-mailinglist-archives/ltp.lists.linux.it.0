Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B32397081
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 11:42:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AEC673C5DF5
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 11:42:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B37713C1CB7
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 11:42:31 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1D309200340
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 11:42:30 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5CF5A21920;
 Tue,  1 Jun 2021 09:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622540550; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vreotl8PUEOqjGnAqQestET+RKr/74/Cmakl0+huORY=;
 b=X804ZivRbPYit5XM50HXpJpvLBax1ZCnV3Hvo4jm/txKvftZaiMi5+903fsB+FJGih/i6S
 RZsOPRKWCmlzf8igqekSuy+uOflMDnf7EECaf/7ryTiW9dxlrVL/Nq37JUUFDIkBvPvmXB
 azHskwBH22nyV7sjIDTWS2l3p9CXcw4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622540550;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vreotl8PUEOqjGnAqQestET+RKr/74/Cmakl0+huORY=;
 b=0DCH3M8e0saBVoPOOHq4PGHTk1B9vV4PYfY242ZyfnbNz2SLBKj6s8pUTMlNQOYSTap2hY
 jBOHTvj5M9RaIjDQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 2D11C118DD;
 Tue,  1 Jun 2021 09:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622540550; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vreotl8PUEOqjGnAqQestET+RKr/74/Cmakl0+huORY=;
 b=X804ZivRbPYit5XM50HXpJpvLBax1ZCnV3Hvo4jm/txKvftZaiMi5+903fsB+FJGih/i6S
 RZsOPRKWCmlzf8igqekSuy+uOflMDnf7EECaf/7ryTiW9dxlrVL/Nq37JUUFDIkBvPvmXB
 azHskwBH22nyV7sjIDTWS2l3p9CXcw4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622540550;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vreotl8PUEOqjGnAqQestET+RKr/74/Cmakl0+huORY=;
 b=0DCH3M8e0saBVoPOOHq4PGHTk1B9vV4PYfY242ZyfnbNz2SLBKj6s8pUTMlNQOYSTap2hY
 jBOHTvj5M9RaIjDQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id /xKEBAYBtmAycgAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Tue, 01 Jun 2021 09:42:30 +0000
Date: Tue, 1 Jun 2021 11:16:37 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YLX69YxFykMahpoB@yuki>
References: <20210531165052.8731-1-pvorel@suse.cz>
 <20210531165052.8731-4-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210531165052.8731-4-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] CI: Move from Travis to GitHub Actions
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
Cc: ltp@lists.linux.it, Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Travis is unreliable due "pull rate limit" issue.
> 
> Also using GitHub native CI allows more advanced features
> (e.g. update wiki with doc/*.txt, nightly build docparser doc).
> 
> Nice bonus is that manual podman activation for distros using glibc >=
> 2.33 (e.g. openSUSE Tumbleweed, Fedora) it's not needed in GitHub.
> 
> Fixes: https://github.com/linux-test-project/ltp/issues/761

Good work, thanks for doing this, acked.

Also please do not forget to remove the travis user from LTP github repo
once this is applied.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
