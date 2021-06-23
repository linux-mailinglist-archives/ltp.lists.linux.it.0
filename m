Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B7B3B1DCC
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 17:46:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D10143C8A4E
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 17:46:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5131D3C1C4F
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 17:46:17 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B28F6600D43
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 17:46:16 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 165481FD36;
 Wed, 23 Jun 2021 15:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624463176;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c+pRi9vNK1kQx+zcOwTSQsmbpovCf/m/3ZJFxCF6hPE=;
 b=z0Pnked8KG5+5RZJHj71KIi1FL5C8QdBRJnqqEOD++bWUQZE/UK3yFp0sfc52Zc6b/OB2X
 xGfSz59gXv2ZUO+Dj6TYge9K5aPTOyzVNM9fvXPRYPhzCAZ3TdultG+82Z0cQzdse/JKvg
 DLX0vd9LwY6nKbf7NVJBszpJe5SZwF4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624463176;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c+pRi9vNK1kQx+zcOwTSQsmbpovCf/m/3ZJFxCF6hPE=;
 b=s0wcyR+Bp0KXf2zEXiqIg3lJAzSJe2AdhKmUNYLVHbsY8DvpCm0hAaTvut48dMZm59PZOz
 1pn85ruGAnmNbhAA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id D087211A97;
 Wed, 23 Jun 2021 15:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624463176;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c+pRi9vNK1kQx+zcOwTSQsmbpovCf/m/3ZJFxCF6hPE=;
 b=z0Pnked8KG5+5RZJHj71KIi1FL5C8QdBRJnqqEOD++bWUQZE/UK3yFp0sfc52Zc6b/OB2X
 xGfSz59gXv2ZUO+Dj6TYge9K5aPTOyzVNM9fvXPRYPhzCAZ3TdultG+82Z0cQzdse/JKvg
 DLX0vd9LwY6nKbf7NVJBszpJe5SZwF4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624463176;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c+pRi9vNK1kQx+zcOwTSQsmbpovCf/m/3ZJFxCF6hPE=;
 b=s0wcyR+Bp0KXf2zEXiqIg3lJAzSJe2AdhKmUNYLVHbsY8DvpCm0hAaTvut48dMZm59PZOz
 1pn85ruGAnmNbhAA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id Am53MUdX02A6CwAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 23 Jun 2021 15:46:15 +0000
Date: Wed, 23 Jun 2021 17:46:14 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Duc Ly <Duc.Ly@idtechproducts.com>
Message-ID: <YNNXRugwpW/uCRSv@pevik>
References: <BY5PR22MB1826245B4D2C69C3553F0DDAF30E9@BY5PR22MB1826.namprd22.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BY5PR22MB1826245B4D2C69C3553F0DDAF30E9@BY5PR22MB1826.namprd22.prod.outlook.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Duc,

> Hi,

> Can you provide any links or documents on how to set up LTP environment from scratch?

> I am a novice at this and would like a more detailed explanation on how to proceed. Thank yo in advance.

Cyril replied about how to run tests. See also environment variables:
doc/user-guide.txt [1].

But if you asking about compilation, and basic info see README.md [2], INSTALL [3]
(I suppose you have read these).

Kind regards,
Petr

[1] https://github.com/linux-test-project/ltp/wiki/User-Guidelines
[2] https://github.com/linux-test-project/ltp
[3] https://github.com/linux-test-project/ltp/blob/master/INSTALL

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
