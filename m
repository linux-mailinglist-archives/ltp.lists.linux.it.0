Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA13C65B34F
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Jan 2023 15:24:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C21733CB6DA
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Jan 2023 15:24:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8D78B3C00D1
 for <ltp@lists.linux.it>; Mon,  2 Jan 2023 15:24:28 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 139EB1400758
 for <ltp@lists.linux.it>; Mon,  2 Jan 2023 15:24:27 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B083B341A7;
 Mon,  2 Jan 2023 14:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1672669466;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l92f6zLSfJnDKNY+ULMdWG/G0LDnMt3cI8c9Ar8zbwQ=;
 b=mN0+C3VSAghH+S+yqjoZg31t/mn2sG7C7ILMw8tDne4hcSz1rGrmf5rt0W8o0bvWecwYc6
 /uAJYcXV1IjSCBewweiJWloH2Hfu1ABkb2YXpF2+HAdBdN31NnEMCh1tPILh81xmsf1BWM
 xepRlbXQaIM8prRiNtfxwMSSN0BXiAk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1672669466;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l92f6zLSfJnDKNY+ULMdWG/G0LDnMt3cI8c9Ar8zbwQ=;
 b=K65+OSsJ+acE96+r2Fy3tf3kiNqV2QHFL4bB0NB+QKidkEmI8SPKJRch8nVQWyOjNx1w9R
 oFNao+gExH9EfmAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 44279139C8;
 Mon,  2 Jan 2023 14:24:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id C/xKDhjpsmOTSQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 02 Jan 2023 14:24:24 +0000
Date: Mon, 2 Jan 2023 15:24:22 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Avinesh Kumar <akumar@suse.de>
Message-ID: <Y7LpFpTgKuPneJfs@pevik>
References: <20221227053247.1855-1-akumar@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221227053247.1855-1-akumar@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] setreuid01.c: remove the test
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Avinesh,

Reviewed-by: Petr Vorel <pvorel@suse.cz>

> Test scenarios in setreuid01.c is covered in setreuid03.c with
> better approach, hence remove it [1]

Waiting a bit to allow other than me and Richie to see this.

Kind regards,
Petr

> [1] https://lore.kernel.org/ltp/Y6Vsgkx%2FVcY%2F78vs@pevik/

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
