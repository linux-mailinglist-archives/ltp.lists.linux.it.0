Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F18D3397306
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 14:11:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A5E113C8016
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 14:11:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 680DF3C5596
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 14:11:08 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 8AD84140005A
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 14:11:08 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E02C31FD2A;
 Tue,  1 Jun 2021 12:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622549467; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vuTer6G5eQKhQwYstR2ij54S+CYfAJyS5seBokSjqJM=;
 b=pEzQ4HXQ+Vw0MMeFsN8ZDUDpZ1ewrgd3exVgEtn0m6hpCnz7Opz8EPdlkLUrGA5e9WkqJA
 9L14Emie/SDtJiICsVWf8q+m9qUdRSnEDgJUnJ3F24yAA53ZlVKRmDIv+mGsrHcnF/1Izz
 2QS2iOEc6od18NHoAOhRvIUCaVhBFUk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622549467;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vuTer6G5eQKhQwYstR2ij54S+CYfAJyS5seBokSjqJM=;
 b=p9ZRm8Axyr1rCm7O8PGe63K7MTsncHDUSA9GCtj6dmDPZFJY532ZnchpVMBt9gI2qoLVvz
 EjmMkfUhmHoXgxAg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id C306C118DD;
 Tue,  1 Jun 2021 12:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622549467; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vuTer6G5eQKhQwYstR2ij54S+CYfAJyS5seBokSjqJM=;
 b=pEzQ4HXQ+Vw0MMeFsN8ZDUDpZ1ewrgd3exVgEtn0m6hpCnz7Opz8EPdlkLUrGA5e9WkqJA
 9L14Emie/SDtJiICsVWf8q+m9qUdRSnEDgJUnJ3F24yAA53ZlVKRmDIv+mGsrHcnF/1Izz
 2QS2iOEc6od18NHoAOhRvIUCaVhBFUk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622549467;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vuTer6G5eQKhQwYstR2ij54S+CYfAJyS5seBokSjqJM=;
 b=p9ZRm8Axyr1rCm7O8PGe63K7MTsncHDUSA9GCtj6dmDPZFJY532ZnchpVMBt9gI2qoLVvz
 EjmMkfUhmHoXgxAg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id +lNHLtsjtmDuTgAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Tue, 01 Jun 2021 12:11:07 +0000
Date: Tue, 1 Jun 2021 13:45:15 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Alexander Egorenkov <egorenar@linux.ibm.com>
Message-ID: <YLYdy5NIC57ZQGF+@yuki>
References: <20210601115453.458069-1-egorenar@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210601115453.458069-1-egorenar@linux.ibm.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] tst_wallclock_restore: fix access time of
 /etc/localtime
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Pushed, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
