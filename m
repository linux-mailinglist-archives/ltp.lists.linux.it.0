Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 934E649392C
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Jan 2022 12:04:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 098813C968F
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Jan 2022 12:04:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A19C13C967B
 for <ltp@lists.linux.it>; Wed, 19 Jan 2022 12:04:49 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 10A2F6009E6
 for <ltp@lists.linux.it>; Wed, 19 Jan 2022 12:04:48 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2A2742170E;
 Wed, 19 Jan 2022 11:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1642590288;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N2oaGslFk77vLf4O1jYCc4e18QrxbE5/SwD8SXzaUR8=;
 b=Ht8/muSPlxurrRpx6eNCCCQnHQoV9xfsd9XgGnQYUizbrMvqAp/Luzy7H9/QHRPtHp8tJk
 kBMJoAIgeJknaPVAR3dQIadMQEIOseNcyUH+oexPrEE2cDGubEXVlsfddHQ9rf0AmwwbJB
 xTDEsLheXZbiPZpM2levsfiUm6of3xQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1642590288;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N2oaGslFk77vLf4O1jYCc4e18QrxbE5/SwD8SXzaUR8=;
 b=6xQfbHvBXmoPliHwQB2PFDu+uYV6TwrJNALrRNbdYGtmgy4EiJGlDPfiPlbCIHudj0XIfe
 07Axub1er/21tPAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EC9C913B3D;
 Wed, 19 Jan 2022 11:04:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OwmMN0/w52HJXAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 19 Jan 2022 11:04:47 +0000
Date: Wed, 19 Jan 2022 12:04:46 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>, ltp@lists.linux.it
Message-ID: <YefwTuQecjXl1T0B@pevik>
References: <20220118170243.22496-1-mdoucha@suse.cz> <YefuJcfsDpuYeQ3X@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YefuJcfsDpuYeQ3X@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Rewrite statx04 test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> >   * xfs filesystem doesn't support STATX_ATTR_COMPRESSED flag, so we only test
> >   * three other flags.

> I'd maybe add "known-fail" for xfs, as user hit this when running -s.
> Maybe document like this also btrfs.
btrfs is mentioned in tags (04a87e347282), thus only xfs.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
