Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BA73F397087
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 11:44:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 87BF93C5A31
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 11:44:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EF0CB3C1CB7
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 11:44:47 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7B2692000EC
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 11:44:47 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D57C821920;
 Tue,  1 Jun 2021 09:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622540686; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CY4DV2uFVzb+Yty4f23L6X+eRlokYObXPrexfcuIRC0=;
 b=BLXMbjsjIiX9QI10eCBpiQA09ZBMT5GWTF38m1rIkZ/ZF4qWGfiJH36tTIs5T4itXJAwqs
 PjWeSIhUgXVlSnIVBB5/Q+cOmVy7mIS+DiSaX/Tvdzg3G4lwWR3KZWPYFH7/t1r/rkzfFm
 rxsSHDTCTWtec8jY2gMi4jR40/rhOCg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622540686;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CY4DV2uFVzb+Yty4f23L6X+eRlokYObXPrexfcuIRC0=;
 b=VOIvCiD0ox7os+91eu2QBj2Idv869WBfpyx0IKXkcXJy8A1ItvW0Fs1Nb27HPu8e4E2/zr
 qNAVMRO6dmb4tkDw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id BC380118DD;
 Tue,  1 Jun 2021 09:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622540686; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CY4DV2uFVzb+Yty4f23L6X+eRlokYObXPrexfcuIRC0=;
 b=BLXMbjsjIiX9QI10eCBpiQA09ZBMT5GWTF38m1rIkZ/ZF4qWGfiJH36tTIs5T4itXJAwqs
 PjWeSIhUgXVlSnIVBB5/Q+cOmVy7mIS+DiSaX/Tvdzg3G4lwWR3KZWPYFH7/t1r/rkzfFm
 rxsSHDTCTWtec8jY2gMi4jR40/rhOCg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622540686;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CY4DV2uFVzb+Yty4f23L6X+eRlokYObXPrexfcuIRC0=;
 b=VOIvCiD0ox7os+91eu2QBj2Idv869WBfpyx0IKXkcXJy8A1ItvW0Fs1Nb27HPu8e4E2/zr
 qNAVMRO6dmb4tkDw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 3gC/LI4BtmB7cwAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Tue, 01 Jun 2021 09:44:46 +0000
Date: Tue, 1 Jun 2021 11:18:54 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YLX7fpw6lSmNRdX9@yuki>
References: <20210601091943.6300-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210601091943.6300-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] CI/debian: Install dblatex
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
Things like this qualify to be obvious enough to be merged right away...

Anyways acked.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
