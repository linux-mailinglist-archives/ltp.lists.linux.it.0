Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5B03E1753
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 16:51:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 372AF3C7DB8
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 16:51:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0A0C83C5F73
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 16:51:34 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2B5A1200D4A
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 16:51:33 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5B3EB1FE5D;
 Thu,  5 Aug 2021 14:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628175093; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6grE1omD5OZNgEnTE1IKWe93Mzrp1RsyM4G+KvXRZaw=;
 b=xyynOCKoycCkeX9W+ULH3IzuOtvOwmYsLCaWYF/+K9es7/W2BWqYgef30QxPuUGHrtG9dd
 ABpyO4cJJeyEvNaMriDG29k2yyCKBidc358JwJVopG+2t19ptdHE+1t0RA97xm6ZzXAkFX
 DrSGuWwzgq/f4HIhcH+KjbMbVn3KjP8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628175093;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6grE1omD5OZNgEnTE1IKWe93Mzrp1RsyM4G+KvXRZaw=;
 b=HM6sEzyrXPVSEysgxwnVxqIwKIzIUssU2FijIl2jNwSv191vHVKAP80Y/t00UoBtXTbcsO
 MK0VQBy2NiG6hOCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 316AA13DA8;
 Thu,  5 Aug 2021 14:51:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CLSlC/X6C2H6bAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 05 Aug 2021 14:51:33 +0000
Date: Thu, 5 Aug 2021 16:51:42 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YQv6/oHmYUVeb63S@yuki>
References: <87a6lwmm6c.fsf@suse.de>
 <20210805083539.20634-1-rpalethorpe@suse.com>
 <20210805083539.20634-3-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210805083539.20634-3-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 3/3] Add setsockopt08, CVE-2021-22555
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
> +#include "tst_test.h"
> +#include "tst_safe_net.h"
> +#include "lapi/ip_tables.h"

I've fixed the failure on Centos with missing IFNAMSIZ but this still
fails to compile on ubuntu xenial because the tst_safe_net.h pull in
netinet/in.h and lapi/ip_tables.h pulls in linux/in.h and on old enough
systems these two headers does not like to be included at the same time.

I'm not sure how to fix this, either we drop the include to
linux/netfilter_ipv4/ip_tables.h completely or we add a configure check
if netinet/in.h and linux/in.h could be included at the same time and
ifdef the linux/netfilter_ipv4/ip_tables.h with that check.

Either way both looks like a hack, if anyone has a better idea please
suggest it.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
