Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C6F64A3ED
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Dec 2022 16:05:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DCDA73CBE57
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Dec 2022 16:05:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BF3833C2B4D
 for <ltp@lists.linux.it>; Mon, 12 Dec 2022 16:05:35 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 327091A00607
 for <ltp@lists.linux.it>; Mon, 12 Dec 2022 16:05:34 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 1F6C433764;
 Mon, 12 Dec 2022 15:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1670857534;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B3/k9HwjThb3NfYSRqCaJMJB1SFwgg4JZDohNFQ9vxw=;
 b=PEoS0D9u5V+C6WCexiMp9JOYGbROGkWPQjewZFzfQI4HB2TkJswOEMvc+PWmulwyeyMm5q
 coAqOFSx3sL3S1BHNSdGFmG7ADMfF/aIu2hqoMxgKuTZ23154uiKtebSP4HKfqHYidE4JM
 4DbQhlCpomLneAfFRrDF1KD4KtMfLxA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1670857534;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B3/k9HwjThb3NfYSRqCaJMJB1SFwgg4JZDohNFQ9vxw=;
 b=yQzw2tZvRcn1QZNNRQ+TadpD6TX3KLNzsnJ6DkOFBiJ2LJUtzq/iFW8D01JYBjE8eDfGQP
 iRZ2aBoXZFxE7RDA==
Received: from g78 (unknown [10.163.28.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 965DD2C141;
 Mon, 12 Dec 2022 15:05:33 +0000 (UTC)
References: <1669691831-23456-1-git-send-email-zenghongling@kylinos.cn>
 <Y4Xd4jd/X5zsmoqH@pevik> <Y4cPD+1DJhMwGPpj@pevik>
User-agent: mu4e 1.8.11; emacs 28.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
Date: Mon, 12 Dec 2022 15:03:57 +0000
Organization: Linux Private Site
In-reply-to: <Y4cPD+1DJhMwGPpj@pevik>
Message-ID: <87a63su0g2.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] mkfs: relax size check
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it, zenghongling <zenghongling@kylinos.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

No response, setting to rejected in patchwork.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
