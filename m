Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE0D474878
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Dec 2021 17:47:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 20CD23C8CB3
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Dec 2021 17:47:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4F7BD3C8C62
 for <ltp@lists.linux.it>; Tue, 14 Dec 2021 17:47:17 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 745A11400F39
 for <ltp@lists.linux.it>; Tue, 14 Dec 2021 17:47:17 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AE7EF1F381;
 Tue, 14 Dec 2021 16:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1639500436;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EsUOIlzExTsFudec+Y7M/oLV2ASznW+/kHDNZWia86g=;
 b=Y6efpG3RoW44rP/Gb1O+ftMKpGiDfZcfpZNBJ9khOymhNvXds1Tw9PvLoUn0FTmtKeGLuI
 4tklA8cnh7aetPcOLwGmtQ1BoRy2KIESXrIKlZJiPscySUU7jj+PrS0KqqAt/JEFsORI1h
 Fnf/shgAZ2kH4xP4e+C87VzS+pOTpOY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1639500436;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EsUOIlzExTsFudec+Y7M/oLV2ASznW+/kHDNZWia86g=;
 b=lDgHV6BWnD5Ak6Ty/bqNz3XZ8RJKebLIbUYpgq3sufMpFf5Otliy2lQJ+yugTJeqnl6pXq
 bRCW5K1hGnf3bBBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7714213A1D;
 Tue, 14 Dec 2021 16:47:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id x8WeG5TKuGGEDQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 14 Dec 2021 16:47:16 +0000
Date: Tue, 14 Dec 2021 17:47:14 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Tim.Bird@sony.com
Message-ID: <YbjKkic5F0j4c3bD@pevik>
References: <20211214144309.6704-1-pvorel@suse.cz>
 <20211214144309.6704-3-pvorel@suse.cz>
 <BYAPR13MB25037C7B8DE0850EFB25DDE5FD759@BYAPR13MB2503.namprd13.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BYAPR13MB25037C7B8DE0850EFB25DDE5FD759@BYAPR13MB2503.namprd13.prod.outlook.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/3] tst_test: Print environment variables on -h
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

Hi Tim,

> > +	fprintf(stderr, "LTP_TIMEOUT_MUL      Multiply timeout (must be number >= 1)\n");

> I think this should this be: "Timeout multiplier (must be a number >=1, should be an integer)

Also makes sense, thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
