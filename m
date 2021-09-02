Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAEC3FF15C
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 18:28:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5FDC83C9921
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 18:28:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 072453C299A
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 18:28:25 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 800D41A0144C
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 18:28:25 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D81F422643;
 Thu,  2 Sep 2021 16:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630600104;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jDN7yBVXjcNZaIDl1Jc8rc9yZUBJVN0jpsyicwiAa5M=;
 b=pM+2eQXTJRtuue620tp4kqUpN7wjSiT8y4G/vfGR/NlS4SV1FsgBM3Yo99z/hKCD1bI032
 9xSo/Z2o9IRFHP9nWrdDYRAY0xZHjy6NkkzCwgUqAYYqMnHRNJm7Hi+etCemrpFO/tBUqG
 aOawjFFqaPhU2QZ+F/Il6G5Ex/WMf3Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630600104;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jDN7yBVXjcNZaIDl1Jc8rc9yZUBJVN0jpsyicwiAa5M=;
 b=PSknFX34SNKgb62a9moq538X5x7dC/vgHCEiR58r/a447uQieGSrdhOwtnYFImxAL911pB
 8eP41EBqTcvc7WDw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 8ED5B13AC7;
 Thu,  2 Sep 2021 16:28:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 0LQJHqj7MGHERgAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Thu, 02 Sep 2021 16:28:24 +0000
Date: Thu, 2 Sep 2021 18:28:22 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <YTD7pssW/MhxeaDI@pevik>
References: <20210713161556.63096-1-krzysztof.kozlowski@canonical.com>
 <3ed326d8-292a-21df-6bb3-d3f1b68fedd4@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3ed326d8-292a-21df-6bb3-d3f1b68fedd4@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] controllers/memcg: document non-hierarchical on
 v5.11
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Krzysztof,

> On 13/07/2021 18:15, Krzysztof Kozlowski wrote:
> > Since kernel v5.11, there is no non-hierarchical mode, so mention it in
> > the code.

> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > ---
> >  .../kernel/controllers/memcg/functional/memcg_lib.sh | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)


> Any comments here?
Good point, sorry for overlooking this. Thanks, merged!

Kind regards,
Petr


> Best regards,
> Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
