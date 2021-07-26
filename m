Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A56E43D58AB
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jul 2021 13:43:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5681A3C8152
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jul 2021 13:43:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 692A13C6735
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 13:43:16 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3ED1C1A0081B
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 13:43:15 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 733621FE6E;
 Mon, 26 Jul 2021 11:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627299795;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3TbTUzfbR/INh/IzjuWipu1ym7oz06AajgNjFEB/AqM=;
 b=d9vH0q+K6KrApkJ6uxmG3iHyxHpuL3ExH7JpLEJ3leoZZaJtEWvoaV+Dq2yPltRdogVoBT
 +uOIeeDifKbNVCwsjp0kPZOjgx2iOLmveoKrFv7xHr65UD/H1FQ4I6900I2QUZHW1Kus8U
 cPB351sggbN1m/ax9J/HTjUQahgBL8A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627299795;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3TbTUzfbR/INh/IzjuWipu1ym7oz06AajgNjFEB/AqM=;
 b=unJ2oLJv/df+qJ/z0y0bCJixWWOqkUuEqCfP4W2ieCSa1uRLqIK75337xUSzKQongYTPBL
 IlgUZTQonEoCsrBw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 3DF2813A91;
 Mon, 26 Jul 2021 11:43:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id +zd2DNOf/mCqYQAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Mon, 26 Jul 2021 11:43:15 +0000
Date: Mon, 26 Jul 2021 13:43:13 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, ltp@lists.linux.it
Message-ID: <YP6f0WWfbybimXG7@pevik>
References: <20210618130536.54806-1-krzysztof.kozlowski@canonical.com>
 <20210618130536.54806-2-krzysztof.kozlowski@canonical.com>
 <YNov+zuL+C4JFlsJ@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YNov+zuL+C4JFlsJ@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] tpci: accept ENOMEM resource failure with
 virtio-pci
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

Hi,

just for a record: Krzysztof confirmed [1] that d631e9cae ("ltp_tpci.c: Add release
operation before allocation") fixed issue with virtio-pci reported here,
suggested to refuse this patch.

Kind regards,
Petr

[1] https://lists.linux.it/pipermail/ltp/2021-July/024053.html

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
