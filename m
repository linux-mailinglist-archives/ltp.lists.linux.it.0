Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EE13E23F3
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 09:26:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 89EAA3C7A53
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 09:26:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 712AB3C4C1F
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 09:26:09 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D3B3F1401100
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 09:26:08 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 4E5F92209C
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 07:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628234768;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CZbtpZLfMtrlb3N+EqFqoosY26bqiXBqhezlHQtHlaE=;
 b=TkGeDn5KCJ7dphpI2SAq4c9gL6JeteJPDDmkBq1S5aNhhLjJO0NRPyLHYcDjH7sNzG35Ln
 BmyHaLn6ttKAA+OSjfbfi6tlmaLoHhJJfo1wCMxs+xmj6IPp70r1AJ5Mh4j6WvBiOvY+MI
 O5UTsBmAmdj1+yJ+unAnTWIqYApmWow=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628234768;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CZbtpZLfMtrlb3N+EqFqoosY26bqiXBqhezlHQtHlaE=;
 b=U9FLt8Clz0Gjn004204+P7A4mZbp8r1vcN4rLKYrHR69HCO3M2e89WL9OR6j20fi3CtanW
 vLbyQlBEBTfWkGDQ==
Received: from g78 (rpalethorpe.tcp.ovpn1.nue.suse.de [10.163.17.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 07248A3CA4;
 Fri,  6 Aug 2021 07:26:07 +0000 (UTC)
References: <87a6lwmm6c.fsf@suse.de>
 <20210805083539.20634-1-rpalethorpe@suse.com>
 <20210805083539.20634-3-rpalethorpe@suse.com> <YQv6/oHmYUVeb63S@yuki>
 <YQv/lZ858UReF5Vs@yuki>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <YQv/lZ858UReF5Vs@yuki>
Date: Fri, 06 Aug 2021 08:26:04 +0100
Message-ID: <877dgzm3ub.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Cyril,

Cyril Hrubis <chrubis@suse.cz> writes:

> Hi!
>> > +#include "tst_test.h"
>> > +#include "tst_safe_net.h"
>> > +#include "lapi/ip_tables.h"
>> 
>> I've fixed the failure on Centos with missing IFNAMSIZ but this still
>> fails to compile on ubuntu xenial because the tst_safe_net.h pull in
>> netinet/in.h and lapi/ip_tables.h pulls in linux/in.h and on old enough
>> systems these two headers does not like to be included at the same time.
>> 
>> I'm not sure how to fix this, either we drop the include to
>> linux/netfilter_ipv4/ip_tables.h completely or we add a configure check
>> if netinet/in.h and linux/in.h could be included at the same time and
>> ifdef the linux/netfilter_ipv4/ip_tables.h with that check.
>> 
>> Either way both looks like a hack, if anyone has a better idea please
>> suggest it.
>
> Uff and it looks like setsockopt03 does include the same headers so this
> could probably be fixed by another shuffle, but I will have to figure
> out what has to be moved and where.

Looking in libc-compat.h we have:

/* Coordinate with glibc netinet/in.h header. */
#if defined(_NETINET_IN_H)

/* GLIBC headers included first so don't define anything
 * that would already be defined. */
#define __UAPI_DEF_IN_ADDR		0
...


I suppose we may be able to do something similar. In tst_safe_net.h we
could check if _LINUX_IN_H is defined before including
netinet/in.h. Then include lapi/ip_tables.h first. Maybe even put

#ifdef _NETINET_IN_H
# error "incompatible system header ..."
#endif

in lapi/ip_tables.h

IDK if this may break some existing tests.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
