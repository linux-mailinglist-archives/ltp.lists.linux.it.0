Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F413F1D65
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Aug 2021 18:00:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2E5273C53BD
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Aug 2021 18:00:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 54B823C248D
 for <ltp@lists.linux.it>; Thu, 19 Aug 2021 17:59:58 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B33341000A11
 for <ltp@lists.linux.it>; Thu, 19 Aug 2021 17:59:57 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 26EA01FDA8;
 Thu, 19 Aug 2021 15:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629388797; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V5bAO9Vb1icdF6dLNZDJSEOoIDMprsfmVyGjjHDOKSU=;
 b=vKfVVwW6TV0gTuCRLZCbfnasz9h5uU8UJIZ2CGOwj1fOLYCYbrDK1Mc0TYUiwhc64WTE6T
 ll2PNSAR0hbNUOq1WHGyEcEFz9d7j6qSr0QdiM8BWWqoSPWloRmgO2OFGN+dIc9PbD904C
 Rm224Oq090Y2BnVls6NAJJ+DEhlyVDM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629388797;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V5bAO9Vb1icdF6dLNZDJSEOoIDMprsfmVyGjjHDOKSU=;
 b=7VSXD8ykKqLiflEu++Z+J0Kb4DvYDUmpuWwQIewqDw+QNYZ59CV4XwSLHarPu9ulGk/Mml
 PBAm+FPaCgAYWACQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 147F413A85;
 Thu, 19 Aug 2021 15:59:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2HkOBf1/HmFrJAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 19 Aug 2021 15:59:57 +0000
Date: Thu, 19 Aug 2021 18:00:01 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <YR6AAfuxrdw9wuZ/@yuki>
References: <20210629121047.100391-1-krzysztof.kozlowski@canonical.com>
 <20210629121047.100391-5-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210629121047.100391-5-krzysztof.kozlowski@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 4/4] syscalls/msgstress: tune limit of
 processes for small machines
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
> Forking the exactly amount of processes as the limit (either from
> max_pids or from cgroups) is risky - OS might be doing some work and
> interfere with the test.  Instead leave some reserve (hard-coded to
> 500) for the OS so the test won't fail on fork failure.

Isn't 500 far too many? I would expect that 50 would be more than
enough.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
