Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A83BA39BDDF
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 19:00:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F1C5B3C7FD9
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 19:00:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4FDDB3C4EE0
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 19:00:43 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C740F6009E6
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 19:00:42 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 217B621A2E;
 Fri,  4 Jun 2021 17:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622826042;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4TFJpLsD/ua+2UQat9QTF44z31I1mlAFcpEMvHu1H08=;
 b=tQTosaFPjSyUFAWT7C/77RHypSyJf/ZYlynaMbb+gjukzuzIvL0/y1rCW2IY/6h98N4y7u
 dPdrPa5B9S/EV+X98wGjK1W9kIF5mxtltiukf/UdJ6JIsJfkBNCn5qqJnN+QPWyuo5eo+e
 37YJT1rV0GSrgp9ZpdIG/245MvEFpqY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622826042;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4TFJpLsD/ua+2UQat9QTF44z31I1mlAFcpEMvHu1H08=;
 b=/LRfMqFT2e7K7r/uv0PFtYjnGbtlmjJUIkqsJyyYT/rH08tsrk7T0c85yMK18VPOEKvsWa
 Evdihn8ACS5eBICQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id E665D118DD;
 Fri,  4 Jun 2021 17:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622826042;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4TFJpLsD/ua+2UQat9QTF44z31I1mlAFcpEMvHu1H08=;
 b=tQTosaFPjSyUFAWT7C/77RHypSyJf/ZYlynaMbb+gjukzuzIvL0/y1rCW2IY/6h98N4y7u
 dPdrPa5B9S/EV+X98wGjK1W9kIF5mxtltiukf/UdJ6JIsJfkBNCn5qqJnN+QPWyuo5eo+e
 37YJT1rV0GSrgp9ZpdIG/245MvEFpqY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622826042;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4TFJpLsD/ua+2UQat9QTF44z31I1mlAFcpEMvHu1H08=;
 b=/LRfMqFT2e7K7r/uv0PFtYjnGbtlmjJUIkqsJyyYT/rH08tsrk7T0c85yMK18VPOEKvsWa
 Evdihn8ACS5eBICQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id FhjDNTlcumBcNgAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Fri, 04 Jun 2021 17:00:41 +0000
Date: Fri, 4 Jun 2021 19:00:40 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YLpcOFM7Us0s+y87@pevik>
References: <20210603114208.8152-1-chrubis@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210603114208.8152-1-chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] doc: Modernize test-writing-guidelines
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

Hi Cyril,

Reviewed-by: Petr Vorel <pvorel@suse.cz>

LGTM.

> -1.2 Code duplication
> -~~~~~~~~~~~~~~~~~~~~
> +* Do not write Makefiles from scratch, use LTP build system instead
> +
> +* Etc.
> +
> +
nit: sometimes you use 2 blank lines at the end of the chapter, sometimes just one.
> +1.2 Keep functions and variable names short
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
