Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 65928641040
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Dec 2022 22:56:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B6D483CE240
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Dec 2022 22:56:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E2C7B3CC451
 for <ltp@lists.linux.it>; Fri,  2 Dec 2022 22:56:31 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C79121310AAC
 for <ltp@lists.linux.it>; Fri,  2 Dec 2022 22:56:30 +0100 (CET)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 08E7D21BA6;
 Fri,  2 Dec 2022 21:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1670018190;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AF9WRA2XWm1i+1DrFnuQMUyXm4hhGpsKyQL72leT4+U=;
 b=Kmj60bZKFKgkta5pNjlRHoHByq4mnmiWZVGYrRgzCOhp0qr7rsEllkucyuOdgm09jateJ0
 qCfM2I+fUs2k6V0BNb/hKzsA4cY8qJ4j7ra3RZxLgrEykYWhROvnlEhVDIwQr8auGFoAKn
 uuwCszwrnzNpNgAbl6I1sP1WiMDdIW8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1670018190;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AF9WRA2XWm1i+1DrFnuQMUyXm4hhGpsKyQL72leT4+U=;
 b=smECjXwKNpkr5z0XkA2oTuIzomcjKDI8weHWuEzT/lXuTmC63O5gdflfFfg3MP4y6uzPLQ
 UMgHUaIgGxKfIbBg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id AF1DD133DE;
 Fri,  2 Dec 2022 21:56:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id n7aoKI10imPjMwAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Fri, 02 Dec 2022 21:56:29 +0000
Date: Fri, 2 Dec 2022 22:56:26 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-ID: <Y4p0iqpG1gIcsd+Q@pevik>
References: <20221202093342.104600-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221202093342.104600-1-akihiko.odaki@daynix.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ftp/ftp01.sh: Fix list_files
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
Cc: Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Akihiko,

> The arguments and the returned values were swapped.
Thanks, merged!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
