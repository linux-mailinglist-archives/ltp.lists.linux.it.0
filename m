Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 786D2663D58
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Jan 2023 10:55:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 495443CB583
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Jan 2023 10:55:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 500BA3C85F1
 for <ltp@lists.linux.it>; Tue, 10 Jan 2023 10:55:45 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8239E20025E
 for <ltp@lists.linux.it>; Tue, 10 Jan 2023 10:55:44 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 902BC68034
 for <ltp@lists.linux.it>; Tue, 10 Jan 2023 09:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673344543;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EZH0/BcQhSJ9YJSweUWjKT43qGR5vCthxMAcmxnFnZI=;
 b=CEMqGuEZcWGhTa5tfUjFwdPU2ooVCuUU2YMGEZtLmedMZm4SSvt4sHi217WRpknUvOCgiP
 xDH0ve+m2J+VdadnF7gdVvgV0yVOAInJ3PQAD4I/IBLvx/crZ0rejOWAtA9/6wY08TMlbB
 0c/T9f9i/rB8tkRKNMy1mqPjSBxuF4c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673344543;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EZH0/BcQhSJ9YJSweUWjKT43qGR5vCthxMAcmxnFnZI=;
 b=8aUQiqTML0YTtqx4Z1S8N5NhqsPzw9kCtMAe8AxiQZdAwcePGEl3fdaY5QEgvBdQRfcsDU
 blcYCutqXOBi1mAQ==
Received: from g78 (unknown [10.163.17.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 569A22C141;
 Tue, 10 Jan 2023 09:55:43 +0000 (UTC)
References: <20230103175059.16328-1-pvorel@suse.cz>
User-agent: mu4e 1.8.13; emacs 28.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
Date: Tue, 10 Jan 2023 09:54:30 +0000
Organization: Linux Private Site
In-reply-to: <20230103175059.16328-1-pvorel@suse.cz>
Message-ID: <878riaiuht.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/3] doc: tst_kvercmp2 related fixes
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Please merge.

Acked-by: Richard Palethorpe <rpalethorpe@suse.com>

Petr Vorel <pvorel@suse.cz> writes:

> Petr Vorel (3):
>   doc/c-test-api.txt: Update tst_kvercmp{2,}() use
>   doc/shell-test-api.txt: Improve tst_kvcmp doc
>   doc/API: Link to minimal supported kernel version
>
>  doc/c-test-api.txt     | 20 ++++++++++++++++++--
>  doc/shell-test-api.txt | 13 +++++++++++++
>  2 files changed, 31 insertions(+), 2 deletions(-)
>
> -- 
> 2.39.0


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
