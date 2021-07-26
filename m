Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E873D55C4
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jul 2021 10:40:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 78B353C9228
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jul 2021 10:40:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BE20D3C65B1
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 10:40:27 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4EDD61A0066F
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 10:40:27 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A681421E33;
 Mon, 26 Jul 2021 08:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627288826;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O8sBKanhhMTQsMP9OD4LLV5GXJ5p5znP1GwoFOw5Rrw=;
 b=zEPUKBHuY/dZDc/16aoZhNGYK3iIiPxNCvFbQPWn0r1dep/mlIiZTDikdsFTzauTxigYGe
 IATDrmQc8ifGZBzroAdjJ4XDlW9v+By2zw30k1as0Eite3ufscHXCJM/dK5inwcVTiYZSF
 IwbaRNhRLoRPOhOoAnvYf41gkHC19IQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627288826;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O8sBKanhhMTQsMP9OD4LLV5GXJ5p5znP1GwoFOw5Rrw=;
 b=ts5cRiajghiB2+8GbmTSzy8AA9Qb1r4oNATIdMnN6TlmI9m7+3t/szWlVUeooTNf6M6lQ+
 ZlfoTy1h/pAnKnBA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 7AB371365C;
 Mon, 26 Jul 2021 08:40:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id EW0THPp0/mDoIgAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Mon, 26 Jul 2021 08:40:26 +0000
Date: Mon, 26 Jul 2021 10:40:24 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <YP50+GkBceVIr4It@pevik>
References: <20210401125127.45600-1-wangxin410@huawei.com>
 <YNoxKg+Hm0qa3Z70@pevik>
 <fd26cf45-7dd8-004f-3d41-422ce4d9bbdb@canonical.com>
 <34bbe196-515c-f4f3-6d1c-5c9f1221e52a@canonical.com>
 <ca6ecb17-c1b4-0d8a-a3c4-dc5e8e2bd275@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ca6ecb17-c1b4-0d8a-a3c4-dc5e8e2bd275@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ltp_tpci.c: Add release operation before
 allocation
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
Cc: Wang Xin <wangxin410@huawei.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Krzysztof

...
> > Is there anything stopping Xin's patch from being applied? LGTM:

BTW does it solve your issue "tpci: accept ENOMEM resource failure with
virtio-pci" [1] ?

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/patch/20210618130536.54806-2-krzysztof.kozlowski@canonical.com/

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
