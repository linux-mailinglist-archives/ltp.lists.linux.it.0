Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6367943CA1A
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Oct 2021 14:51:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 336EB3C69BB
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Oct 2021 14:51:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 99FC43C63A2
 for <ltp@lists.linux.it>; Wed, 27 Oct 2021 14:51:15 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3F43B60220C
 for <ltp@lists.linux.it>; Wed, 27 Oct 2021 14:51:14 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 95C9A21960;
 Wed, 27 Oct 2021 12:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635339074; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+MmCuFTxENLTmkfSlqlmGXoVVzRpgbp9Q1j/nwsXQTQ=;
 b=T7CDh/WGLwummTRXeWQI4ByiNUMHMBxx0y1Rb8Rt3KAQYaoIinaRwCGtqoq7oU05nPurT8
 qGiud8YTys/dgMIGoKaU1cUfYrBYh5gdkOp8MtndXoL52CIN2TAWk+a5nMOZbLR/un15GF
 LItMb9UPRAIxpWh7w92JJj32I+4feZ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635339074;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+MmCuFTxENLTmkfSlqlmGXoVVzRpgbp9Q1j/nwsXQTQ=;
 b=ewTf9YJ13AsjB7MimJk7wEYeAMk2DdInwfRiBSQVr0pyzmv5rEEkv12nTjE69VRtsqi7Rk
 3AdrdJVLQWPLD1Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 75ABA13D55;
 Wed, 27 Oct 2021 12:51:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LHEaG0JLeWGdFAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 27 Oct 2021 12:51:14 +0000
Date: Wed, 27 Oct 2021 14:52:04 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <YXlLdOFE3muy6Dwq@yuki>
References: <20211014012533.18205-1-zhanglianjie@uniontech.com>
 <20211014012533.18205-3-zhanglianjie@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211014012533.18205-3-zhanglianjie@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 3/5] syscalls/clone05: Convert to new API
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
Pushed, good job, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
