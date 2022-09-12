Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2215B5C5E
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Sep 2022 16:41:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B60863CAAF2
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Sep 2022 16:41:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 82EA73CA599
 for <ltp@lists.linux.it>; Mon, 12 Sep 2022 16:40:59 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6F9C71A00706
 for <ltp@lists.linux.it>; Mon, 12 Sep 2022 16:40:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9BBF521A44;
 Mon, 12 Sep 2022 14:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1662993657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IEdbqqQePQttqeOi8Z58cdG83K4Hf7L0rzeXU0+qY2o=;
 b=0U9jQrjUlzRhnaFHyo9LQ0sIcHZO5keYn1ZW6+Ym4+TGAy/Bprbau7INGrAD1INEnPsVbC
 HpKCtum49EtT56MWyTVzD7fY83NDwOdwXu9bMwahgpuGOv2vHewixnKh4VaD7hors5QZmx
 7uZGISM6h1E3fsYQW1ZtnA2aYLcif5Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1662993657;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IEdbqqQePQttqeOi8Z58cdG83K4Hf7L0rzeXU0+qY2o=;
 b=K2nuoc4g8OROIWB/2PNE/p9q9IdXj2ik4Tq77g5dTicpG86ABRuu2T8w+68S+ZD6vqY1Lt
 uFcHsnVUpICzTkCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 81FC4139C8;
 Mon, 12 Sep 2022 14:40:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +WbUIPlEH2PyTAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 12 Sep 2022 14:40:57 +0000
Date: Mon, 12 Sep 2022 16:42:51 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <Yx9Fa69/ukgEJylz@yuki>
References: <20220909141840.18327-1-pvorel@suse.cz>
 <20220909141840.18327-4-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220909141840.18327-4-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 03/10] tst_supported_fs: Print TCONF if no
 filesystem supported
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
> Although this is unlikely, it can happen.
> This means 32 (TCONF) instead of 0 exit code when searching for all
> filesystems and 32 instead of 1 when searching for a particular
> filesystem.
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> New in v5
> 
> NOTE:
> 
> Although this will later leads to duplicating message (see below) it's
> IMHO better because LVM scripts and zram01.sh use this helper directly.
> 
> Tests added in later commits which demonstrates TCONF:

Shouldn't we rather than this add tst_res(TCONF, "...") messages to the
lib/tst_supported_fs_types.c so that we get consistent messages between
C and shell?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
