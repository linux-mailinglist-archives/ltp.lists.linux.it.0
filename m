Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0953B167F
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 11:10:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CDDFF3C8A4B
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 11:10:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B9F663C1A97
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 11:10:15 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E1158600A0A
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 11:10:14 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 520111FD36;
 Wed, 23 Jun 2021 09:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624439414; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EJiYHT9c+IMlKuF+EyDHytyFCHDZ5v+K2gqpfjHWQRY=;
 b=XT68VYG5ZkJ80kDCIm2BDuWLkUKyvcwq5r3+vIVDdL2CW5cFHf1xt1ulsK6j4GkoGYLS2J
 ZoYhIWdRmIelHGFT1fMXAUOc/fTgVpvmspasIlAaabDMLuU48UPDjx17/Q1UHVvvTI6Q2Z
 RC3v48cTY5MRyhEdGJVgj3lMdYKVnXo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624439414;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EJiYHT9c+IMlKuF+EyDHytyFCHDZ5v+K2gqpfjHWQRY=;
 b=rNNBdy4RSkl0RGSBT/YLZBUMy6DimJmiYv6onfSGPPcc6VD6NfTycm09E/ODcEAEtE3aZP
 7ntwUTz68zsIunCg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 3213711A97;
 Wed, 23 Jun 2021 09:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624439414; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EJiYHT9c+IMlKuF+EyDHytyFCHDZ5v+K2gqpfjHWQRY=;
 b=XT68VYG5ZkJ80kDCIm2BDuWLkUKyvcwq5r3+vIVDdL2CW5cFHf1xt1ulsK6j4GkoGYLS2J
 ZoYhIWdRmIelHGFT1fMXAUOc/fTgVpvmspasIlAaabDMLuU48UPDjx17/Q1UHVvvTI6Q2Z
 RC3v48cTY5MRyhEdGJVgj3lMdYKVnXo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624439414;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EJiYHT9c+IMlKuF+EyDHytyFCHDZ5v+K2gqpfjHWQRY=;
 b=rNNBdy4RSkl0RGSBT/YLZBUMy6DimJmiYv6onfSGPPcc6VD6NfTycm09E/ODcEAEtE3aZP
 7ntwUTz68zsIunCg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id vdxSCnb60mDANAAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Wed, 23 Jun 2021 09:10:14 +0000
Date: Wed, 23 Jun 2021 10:44:39 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Duc Ly <Duc.Ly@idtechproducts.com>
Message-ID: <YNL0d39i3OOOIft/@yuki>
References: <BY5PR22MB1826245B4D2C69C3553F0DDAF30E9@BY5PR22MB1826.namprd22.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BY5PR22MB1826245B4D2C69C3553F0DDAF30E9@BY5PR22MB1826.namprd22.prod.outlook.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] LTP environment setup
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Can you provide any links or documents on how to set up LTP environment from scratch?

What exactly are you looking for?

Compiling and installing LTP can be quite easy, that's just usuall ./configure && make && make install.

If you are looking for build/run dependencies we recently started to
work on a script that prints list of packages when given a distribution
name, see https://github.com/metan-ucw/runltp-ng/blob/master/install_pkg.pm

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
