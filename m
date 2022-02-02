Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C634A6FFB
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Feb 2022 12:29:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 625903C98B0
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Feb 2022 12:29:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DD4D63C8F4A
 for <ltp@lists.linux.it>; Wed,  2 Feb 2022 12:29:49 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id AEFB51000931
 for <ltp@lists.linux.it>; Wed,  2 Feb 2022 12:29:48 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BC82B1F383;
 Wed,  2 Feb 2022 11:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1643801387;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D/qtQ1vfj3bhRrhP00y3o4XKNTi0PrABt7KP98DImyg=;
 b=of6+gUharJIOlMWgWg/AKSKwn81skymn9sKb+hgIXhVf6KNxpWa5SXa81X4cxR77sSoBXu
 EvDWtX4fLkiaVqftFwKMg/bnyUjMVAzSb5ajSbXiOoIOhuqKZEalh+ydYXncQdrlfbt/IQ
 Ncm45zndQpjD2giW9lyZjE75uMd+0z4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1643801387;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D/qtQ1vfj3bhRrhP00y3o4XKNTi0PrABt7KP98DImyg=;
 b=GXaxI4xxZu8Vqnw0CbwTn7ow6RcrwKyFZ6s2Wx9dfs5zoa4KTHiW1c5iN1U/nkbNgdXE0k
 JOofnJm92bXicnCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7B8FF13DFF;
 Wed,  2 Feb 2022 11:29:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BfwGFypr+mFgBwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 02 Feb 2022 11:29:46 +0000
Date: Wed, 2 Feb 2022 12:29:33 +0100
From: Petr Vorel <pvorel@suse.cz>
To: linux-sctp@vger.kernel.org, ltp@lists.linux.it,
 Cyril Hrubis <chrubis@suse.cz>,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Xin Long <lucien.xin@gmail.com>, Vlad Yasevich <vyasevich@gmail.com>,
 Neil Horman <nhorman@tuxdriver.com>, Martin Doucha <martin.doucha@suse.com>
Message-ID: <YfprHQcxAnsb1RI/@pevik>
References: <YfpnVfrto4Elshy5@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YfpnVfrto4Elshy5@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC] SCTP tests in LTP vs. on github.com/sctp
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

FYI we've been thinking about back in 2013.
https://lore.kernel.org/ltp/20130805121135.GB8739@rei/

I'd personally prefer sctp folks maintain them and we removed them from LTP.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
