Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BB93F1311
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Aug 2021 08:07:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EFB3A3C5469
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Aug 2021 08:07:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BBB3C3C536F
 for <ltp@lists.linux.it>; Thu, 19 Aug 2021 08:07:04 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C73041A01177
 for <ltp@lists.linux.it>; Thu, 19 Aug 2021 08:07:03 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 31E45220A4;
 Thu, 19 Aug 2021 06:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629353223;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5kVaY0TA25IxaaTQfmq5ebZQp4fW6ZWEtyCY0uy2MWs=;
 b=NjfmQPDAlGaKsLtGhxA+1JrFQwzJzPDuSDAfWxwk1HzLnkuLn9hpb3ptDRKWUN3X+ny66W
 +mZt4G7Dio3PpBmFTDtxCFQimaZ4d0tdPs4bEUs08eP7OHLXaU4motDx0pi/8ZlpLH5oy7
 Z844m0YVeW0CL+1W35WRg1yp2M9o7oM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629353223;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5kVaY0TA25IxaaTQfmq5ebZQp4fW6ZWEtyCY0uy2MWs=;
 b=ul8K+0XLakVlkRcc43jU3VrUxLItsU1gTTztg2f8fWp5TJjZ7aqZ6//tGhRJjQdKPvPUbk
 BFL81wNlvEIbPFBg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id F02D91371C;
 Thu, 19 Aug 2021 06:07:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id q80/OAb1HWGLHAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Thu, 19 Aug 2021 06:07:02 +0000
Date: Thu, 19 Aug 2021 08:07:01 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YR31BUdElySUzHR6@pevik>
References: <20210818110440.285-1-egor.petrov@oracle.com>
 <CAEemH2cC36KjDTu7Z_WPxxcP+66EUT_8gtGU9XHQ-3gV46i47w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cC36KjDTu7Z_WPxxcP+66EUT_8gtGU9XHQ-3gV46i47w@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Fixed SELinux path check in tst_get_enforce()
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
Cc: Egor Petrov <egor.petrov@oracle.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Egor,

> Hi Egor,

> Patch applied, thanks!
Thanks for fixing my error.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
