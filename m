Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 412AD39DDF0
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 15:44:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EE87A3C56B8
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 15:44:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 39E0A3C2868
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 15:44:23 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CCDE31000CBB
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 15:44:22 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 13AC321A9F;
 Mon,  7 Jun 2021 13:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623073462; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XzgbIPixGE0UTe5DABpj7grWSk061+nrKUMyoZv0y1U=;
 b=TpQ/gFLGULzrZyZwJwvt68MlVDKwqFIoRwATwxs21+WPN5F3skki2m9YJykOco4+BN1kdx
 pCYwHBt1ZqdLGcBLHAg1UJ2XjDAixbEyBC2fE9ZruNedyqbs8Fzq9ls3jQ1qPy5o1Jod+h
 k9R/Om5GJHzZuz8uE0RZboA70mSbYmI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623073462;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XzgbIPixGE0UTe5DABpj7grWSk061+nrKUMyoZv0y1U=;
 b=9O689ueb+f4I3SlL8LWAwpsvek3pNkmDa9hrDF9Xnfk9A7xwkbP9TOW/FsTxTdXP9BK8Td
 pi04EHY2t/MDUoDQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id E74AE118DD;
 Mon,  7 Jun 2021 13:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623073462; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XzgbIPixGE0UTe5DABpj7grWSk061+nrKUMyoZv0y1U=;
 b=TpQ/gFLGULzrZyZwJwvt68MlVDKwqFIoRwATwxs21+WPN5F3skki2m9YJykOco4+BN1kdx
 pCYwHBt1ZqdLGcBLHAg1UJ2XjDAixbEyBC2fE9ZruNedyqbs8Fzq9ls3jQ1qPy5o1Jod+h
 k9R/Om5GJHzZuz8uE0RZboA70mSbYmI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623073462;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XzgbIPixGE0UTe5DABpj7grWSk061+nrKUMyoZv0y1U=;
 b=9O689ueb+f4I3SlL8LWAwpsvek3pNkmDa9hrDF9Xnfk9A7xwkbP9TOW/FsTxTdXP9BK8Td
 pi04EHY2t/MDUoDQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id w+huNrUivmD+KwAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Mon, 07 Jun 2021 13:44:21 +0000
Date: Mon, 7 Jun 2021 15:18:30 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YL4cpqeL539b6PUb@yuki>
References: <20210507083321.167998-1-xieziyao@huawei.com>
 <20210507083321.167998-3-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210507083321.167998-3-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] syscalls/io_setup: Add io_setup02 test for
 native AIO
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
Cc: rpalethorpe@suse.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Here as well, we need the needs_kconfig array.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
