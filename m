Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B03BB3B799C
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 22:59:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6F1303C8D7E
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 22:59:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 80B763C1CC2
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 22:59:40 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id AFAEC100052B
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 22:59:39 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E66631FDC9;
 Tue, 29 Jun 2021 20:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625000378;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EPapJ+2TGqkDUU9LPHRnI1PlDpfyAA6dsEM9wCUtgJs=;
 b=x0TOxPfjubzy7CbpPa4e6kKclFunMzhjR12tt9no/0PYlhm7mCVRXPA8US7KH9P0vyYjdT
 L6bYWrpieYhZLL25A6QJJqin33BT3/TnsJDw6DIDja+c3GJO8QoYcxS0/tfZWJcq9TrY8B
 md4uL/LpzBFk67nLfVeU/mE3/oC+0ho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625000378;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EPapJ+2TGqkDUU9LPHRnI1PlDpfyAA6dsEM9wCUtgJs=;
 b=owOUARAPyTsLvkZXuIz6ENOhVxKF6ssWq46J/+a6Bh+2Zn5ego29HE9vAso6o08NmnwJw6
 4d9XWC1kIAZfKDDQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id ADF0A11906;
 Tue, 29 Jun 2021 20:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625000378;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EPapJ+2TGqkDUU9LPHRnI1PlDpfyAA6dsEM9wCUtgJs=;
 b=x0TOxPfjubzy7CbpPa4e6kKclFunMzhjR12tt9no/0PYlhm7mCVRXPA8US7KH9P0vyYjdT
 L6bYWrpieYhZLL25A6QJJqin33BT3/TnsJDw6DIDja+c3GJO8QoYcxS0/tfZWJcq9TrY8B
 md4uL/LpzBFk67nLfVeU/mE3/oC+0ho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625000378;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EPapJ+2TGqkDUU9LPHRnI1PlDpfyAA6dsEM9wCUtgJs=;
 b=owOUARAPyTsLvkZXuIz6ENOhVxKF6ssWq46J/+a6Bh+2Zn5ego29HE9vAso6o08NmnwJw6
 4d9XWC1kIAZfKDDQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id u2NUKLqJ22A6NgAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Tue, 29 Jun 2021 20:59:38 +0000
Date: Tue, 29 Jun 2021 22:59:37 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>,
 Martin Doucha <martin.doucha@suse.com>, ltp@lists.linux.it
Message-ID: <YNuJuSMWFhNEFPTQ@pevik>
References: <YNuA/0J20mjiV+NC@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YNuA/0J20mjiV+NC@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] tst_fuzzy_sync01 sporadically fails
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

I'm sorry, the subject was supposed to be tst_fuzzy_sync01 sporadically fails.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
