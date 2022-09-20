Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE475BECD7
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Sep 2022 20:35:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 259E53CAD4A
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Sep 2022 20:35:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 022FF3C008C
 for <ltp@lists.linux.it>; Tue, 20 Sep 2022 20:35:51 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1C90C200BD2
 for <ltp@lists.linux.it>; Tue, 20 Sep 2022 20:35:50 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CD3F621B5D;
 Tue, 20 Sep 2022 18:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1663698949;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e2bSm2HLxYP4DB2Ks+PZBc9cVPKsBL928BMTsaqCopI=;
 b=Mn+JoNJhj8rfSsavqkBJBz78BTNQkUQsN7liiDEOLMYSKE6p7fDOWewLcYIAjnsETMrJXR
 IhiHXo00hT9NP1CGTiEU3Z/C6gyb3B+vxYTlGZcBtEZcFGRKu26PDsq0RoVMPcSCl47HuL
 2DtFHr0apHkXySnC7Emd+fMPsZhy0xw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1663698949;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e2bSm2HLxYP4DB2Ks+PZBc9cVPKsBL928BMTsaqCopI=;
 b=AkZXYT83rFhEO9imxWhPOmo9U22MKtrJwgPVqHHmE+fjAy5is1n/fHJJoiVjsN1CO+G75+
 yeLz7Wy75gH21xAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9EF351346B;
 Tue, 20 Sep 2022 18:35:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XcY/JAUIKmNLfgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 20 Sep 2022 18:35:49 +0000
Date: Tue, 20 Sep 2022 20:35:47 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <YyoIA59q6K6mIJk4@pevik>
References: <20220919144154.20623-1-andrea.cervesato@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220919144154.20623-1-andrea.cervesato@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] Remove obsolete LTPROOT usage in math runtest
 file
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

Hi Andrea,

thanks, merged!

> -float_bessel cd $LTPROOT/testcases/bin; float_bessel -v
> -float_exp_log cd $LTPROOT/testcases/bin; float_exp_log -v
> -float_iperb cd $LTPROOT/testcases/bin; float_iperb -v
> -float_power cd $LTPROOT/testcases/bin; float_power -v
> -float_trigo cd $LTPROOT/testcases/bin; float_trigo -v
> +float_bessel float_bessel -v
> +float_exp_log float_exp_log -v
> +float_iperb float_iperb -v
> +float_power float_power -v
> +float_trigo float_trigo -v

FYI I was thinking about removing -v, but in the end I kept it as the tests
needs to be migrated to new API anyway.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
