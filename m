Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4B23B183A
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 12:49:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2F35A3C6FDA
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 12:49:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8D3E93C2B9A
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 12:49:48 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BA615140114F
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 12:49:47 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EF7A71FD66;
 Wed, 23 Jun 2021 10:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624445386; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QWoXzch3iz9gvX2euz7GUK9Qvs7hGLbBXvF5VeB7JvE=;
 b=TbT/Bay74F739pgZWLgN0D9mL9Padyo10piy1T2Uyh7u2bQOr7OwInGECccO39YThAFgLc
 d1vK1E/Xb6yFVQ1F9GN3v5SyAOXUURyNlwG90oZN0A7CaYSkqXYYobRU00xHvZLThxLFjD
 N36oMCBA4lqtGfuM17iAuTniDD8re/s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624445386;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QWoXzch3iz9gvX2euz7GUK9Qvs7hGLbBXvF5VeB7JvE=;
 b=E02FpY/H8vxB9ZlJ3qwZicKR4W0lqigExBxtX32nz4JfVuQDU6P0QnDSrRLJcmMRY3BdzL
 OHD3QvBw0HAkjCDA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id D23B811A97;
 Wed, 23 Jun 2021 10:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624445386; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QWoXzch3iz9gvX2euz7GUK9Qvs7hGLbBXvF5VeB7JvE=;
 b=TbT/Bay74F739pgZWLgN0D9mL9Padyo10piy1T2Uyh7u2bQOr7OwInGECccO39YThAFgLc
 d1vK1E/Xb6yFVQ1F9GN3v5SyAOXUURyNlwG90oZN0A7CaYSkqXYYobRU00xHvZLThxLFjD
 N36oMCBA4lqtGfuM17iAuTniDD8re/s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624445386;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QWoXzch3iz9gvX2euz7GUK9Qvs7hGLbBXvF5VeB7JvE=;
 b=E02FpY/H8vxB9ZlJ3qwZicKR4W0lqigExBxtX32nz4JfVuQDU6P0QnDSrRLJcmMRY3BdzL
 OHD3QvBw0HAkjCDA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id iwkeMsoR02DlZgAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Wed, 23 Jun 2021 10:49:46 +0000
Date: Wed, 23 Jun 2021 12:24:12 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: 20210618094210.183027-2-xieziyao@huawei.com
Message-ID: <YNMLzEyYD5jPOX/i@yuki>
References: <20210622091108.249098-1-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210622091108.249098-1-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/2 v2] Add tests for libaio
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
Both pushed, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
