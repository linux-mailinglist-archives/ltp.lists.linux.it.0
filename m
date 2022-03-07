Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A809E4CF452
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Mar 2022 10:10:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D7D733C1BDA
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Mar 2022 10:10:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5D8843C1B77
 for <ltp@lists.linux.it>; Mon,  7 Mar 2022 10:10:42 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id AFBAD200939
 for <ltp@lists.linux.it>; Mon,  7 Mar 2022 10:10:41 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D81851F37D;
 Mon,  7 Mar 2022 09:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1646644240; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ncPrLkTb0ArtYS/GxAmfY/3VQMBhLXH+/WAYNbl43VA=;
 b=nYf+m1s8Lv6P0povQd7zayRijC9LRq+TKdKTQy5irVwFi4o9S0rbm6ZilF6olFRAwsDByu
 zqDbJrfC7fhAosGi9uv5SSBn8hHOa1kqZwqXdAAmkb4vnw1F2oXikJ6foc6MukOLq3AAkk
 cJ0+bRqITi9UEOYgLVeqtPX4umKeGIc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1646644240;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ncPrLkTb0ArtYS/GxAmfY/3VQMBhLXH+/WAYNbl43VA=;
 b=AA9uLUal3TMqudK/bL6D/7AkShTYg/tGE8N6+zPvXKUeMB5qG6PPNDUH7ezgX4ZAs2zAvx
 HTUbFcrEeK/WdHBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C5B4513A84;
 Mon,  7 Mar 2022 09:10:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kJc7LxDMJWL8BAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 07 Mar 2022 09:10:40 +0000
Date: Mon, 7 Mar 2022 10:13:00 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YiXMnIT2EE05tB9x@yuki>
References: <20220303145032.21493-1-chrubis@suse.cz>
 <20220303145032.21493-6-chrubis@suse.cz>
 <CAEemH2cnCNdUaoWqe=-dyuFq2Zc7gF79yi8XND8ieTvg8iEaRg@mail.gmail.com>
 <YiH/2240VRU1OlAe@yuki>
 <CAEemH2eEJ06UnKJujTjWksutiK2Lmk_HHAwa76nBjAZGpNcVzA@mail.gmail.com>
 <YiXJSYKsDC+SpDcT@yuki>
 <CAEemH2d_wRGiyLc1VKL4XJQ7A-gWA3sA_MoW9hqmTWBu+3-kLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2d_wRGiyLc1VKL4XJQ7A-gWA3sA_MoW9hqmTWBu+3-kLQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5/7] mem/ksm06: Move ksm restoration into the
 tst_test struct
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> ACK.

Thanks I will push the patchset with the rest of the fixes you have
suggested.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
