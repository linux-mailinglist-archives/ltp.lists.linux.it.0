Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 479B03B1DDF
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 17:53:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 520D93C8E3F
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 17:53:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D516A3C2298
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 17:53:18 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E57CE200060
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 17:53:17 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5B8241FD65;
 Wed, 23 Jun 2021 15:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624463597;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WR5vbcp/mSw0fy6INbSG5KF1Y0OfsCNzIU9EnbgpqSk=;
 b=dMhnxhFsEmn5qF+AKLQ/DzVnjGGrAm0DArEf8HCpFKzm99DLb3OXcpNpV56VH+XELWNiR2
 QsIaVmZ2E+XjF5+WPCTLBpiyLU4Z4aR2htxtHFIen5vUYKtc8Rz9ReYy0BdSNMccim0KIK
 kbiHeV8MAt4OMQPsN8m8u4uwQZDQawE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624463597;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WR5vbcp/mSw0fy6INbSG5KF1Y0OfsCNzIU9EnbgpqSk=;
 b=oKfiqAubiynA2nWDftQIQolOu7pHUKBaqEx9uk8KcVf3XULcdkWEY1JfZKfEbgPsHr6M+5
 ZZ6pwXD53wQkrMAw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 2E3C511A97;
 Wed, 23 Jun 2021 15:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624463597;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WR5vbcp/mSw0fy6INbSG5KF1Y0OfsCNzIU9EnbgpqSk=;
 b=dMhnxhFsEmn5qF+AKLQ/DzVnjGGrAm0DArEf8HCpFKzm99DLb3OXcpNpV56VH+XELWNiR2
 QsIaVmZ2E+XjF5+WPCTLBpiyLU4Z4aR2htxtHFIen5vUYKtc8Rz9ReYy0BdSNMccim0KIK
 kbiHeV8MAt4OMQPsN8m8u4uwQZDQawE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624463597;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WR5vbcp/mSw0fy6INbSG5KF1Y0OfsCNzIU9EnbgpqSk=;
 b=oKfiqAubiynA2nWDftQIQolOu7pHUKBaqEx9uk8KcVf3XULcdkWEY1JfZKfEbgPsHr6M+5
 ZZ6pwXD53wQkrMAw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id Ipz5B+1Y02BaDwAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 23 Jun 2021 15:53:17 +0000
Date: Wed, 23 Jun 2021 17:53:15 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <YNNY67Fb4erb7wpw@pevik>
References: <20210623153003.94404-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210623153003.94404-1-krzysztof.kozlowski@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] lib: Add tst_virt_hyperv
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

Hi Krzysztof,

patchsed merged, thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
